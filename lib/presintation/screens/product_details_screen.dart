import 'package:alothaim_test/core/helpers/colors_helper.dart';
import 'package:alothaim_test/presintation/controllers/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          controller.cartController.addToCart();
        },
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: ColorsHelper.mainColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              "Add To Cart",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Container(
                height: Get.size.height,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 250.0.h,
                    floating: false,
                    pinned: true,
                    title: Obx(
                      () => controller.isLoading.value
                          ? Container()
                          : Text(
                              controller.productDetailsModel!.title,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        controller.productDetailsModel!.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.productDetailsModel!.title,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                '\$${controller.productDetailsModel!.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.green),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Description : ',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.green),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                '${controller.productDetailsModel!.description}',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
