import 'package:alothaim_test/domain/entities/cart_entities/cart_list_entity.dart';
import 'package:alothaim_test/presintation/controllers/cart_screen_controller.dart';
import 'package:alothaim_test/presintation/widgets/custom_button_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/helpers/cart_helper.dart';

class CartScreen extends GetView<CartScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
          onRefresh: ()async=>controller.getCartList(),
              child: ListView(
                        children: [
              ListView.builder(
                itemCount: controller.productDetailsModel.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index){
                  var data = controller.productDetailsModel[index];
                  return  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Image.network(
                                      data.image,width: 50,height: 50,),
                                    SizedBox(width: 10.w,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            width: 140.w,
                                            child: Text(data.title,overflow: TextOverflow.ellipsis,)),
                                        SizedBox(height: 10.h,),
                                        Text("${CartHelper.sumPrices(prices: data.price, qty: controller.cartProduct[data.id])} SAR",style: TextStyle(fontSize: 10.sp),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2<int>(
                                          isExpanded: true,

                                          items: List.generate(10, (index) => DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Padding(
                                              padding:  EdgeInsetsDirectional.only(top: 7,start: controller.cartProduct[data.id] > 99 ? 6 : 12),
                                              child: Text(
                                                (index + 1).toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                                overflow: TextOverflow.ellipsis,

                                              ),
                                            ),
                                          )),

                                          value: controller.cartProduct[data.id],
                                          onChanged: (value) {

                                            controller.updateCart(
                                                qty: value!,
                                                productId: data.id,
                                                date: controller.cartListModel!.date!,
                                                userId: controller.cartListModel!.userId!
                                            );

                                            //controller.saveChanges(productID: productID.toString(), qty: value.toString());
                                            // selectedValue = value;

                                          },
                                          buttonStyleData: ButtonStyleData(
                                            height: 35,
                                            width: 60,
                                            padding: const EdgeInsetsDirectional.only(start:6,end: 10 ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.black12,
                                              ),
                                            ),
                                          ),
                                          iconStyleData: const IconStyleData(
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                            ),
                                            iconSize: 14,
                                            iconEnabledColor: Colors.black38,

                                          ),
                                          dropdownStyleData: DropdownStyleData(
                                            maxHeight: 400,
                                            width: 100,
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(14),
                                              color: Colors.white,
                                            ),
                                            offset: const Offset(50, 0),

                                            scrollbarTheme: ScrollbarThemeData(
                                              radius: const Radius.circular(40),
                                              thickness: MaterialStateProperty.all(5),
                                              thumbVisibility: MaterialStateProperty.all(true),

                                              trackBorderColor:  MaterialStateProperty.all(Colors.green),
                                              trackColor:  MaterialStateProperty.all(Colors.green),
                                              thumbColor: MaterialStateProperty.all(Colors.red), // Set scrollbar color to blue

                                            ),
                                          ),
                                          menuItemStyleData: const MenuItemStyleData(
                                            height: 40,
                                            padding: EdgeInsets.only(left: 10, right: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    InkWell(
                                        onTap: ()=> CartHelper.deleteHelper(productID: data.id),
                                        child: Icon(Icons.restore_from_trash,color: Colors.red,)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  );
                },
              ),
              SizedBox(height: 20.h,),
              Column(

                children: [
                  Text("Total: ${controller.calculateTotal()} SAR"),
                  SizedBox(height: 10.h,),
                  CustomButtonWidget(onPressed: (){
                    controller.checkout();
                  }, text: "check out",width: 150.w,height: 30.h,),
                ],
              ),
                        ],
                      ),
            ),

      ),
    );
  }
}


