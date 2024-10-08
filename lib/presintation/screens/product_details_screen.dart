import 'package:alothaim_test/presintation/controllers/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value
              ? Container(
                  height: Get.size.height,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  children: [
                    Image.network(controller.productDetailsModel!.image),
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
                          SizedBox(height: 8),
                          Text(
                            '\$${controller.productDetailsModel!.price.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          ),
                          SizedBox(height: 8),
                          // Row(
                          //   children: [
                          //     Icon(Icons.star, color: Colors.yellow),
                          //     SizedBox(width: 4),
                          //     Text(controller.productDetailsModel!.value.rating.toString()),
                          //   ],
                          // ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
