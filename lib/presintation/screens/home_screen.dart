import 'package:alothaim_test/core/routing/app_routes.dart';
import 'package:alothaim_test/presintation/controllers/cart_screen_controller.dart';
import 'package:alothaim_test/presintation/controllers/home_screen_controller.dart';
import 'package:alothaim_test/presintation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.83,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: controller.allProductsListModel.length,
                  itemBuilder: (context, index) {
                    final product = controller.allProductsListModel[index];
                    return ProductCard(
                      id: product.id,
                      image: product.image,
                      onPressed: () {
                        Get.toNamed(AppRoutes.productDetailsScreen,
                            arguments:
                                controller.allProductsListModel[index].id);
                        // Get.toNamed(AppRoutes.cartScreen);
                      },
                      onPressedAddToCart: () {
                        Get.find<CartScreenController>()..addToCart();
                      },
                      title: product.title,
                      price: product.price,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
