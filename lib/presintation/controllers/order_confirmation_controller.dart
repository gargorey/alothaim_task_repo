import 'package:alothaim_test/domain/entities/products_entities/all_products_entity.dart';
import 'package:get/get.dart';

class OrderConformationController extends GetxController {
  List<AllProductsEntity> cartListModel = Get.arguments["data"];
  String total = Get.arguments["total"];
  void setOrder(List<AllProductsEntity> products, String totalAmount) {
    cartListModel = products;
    total = totalAmount;
  }

  void confirmOrder() {
    // Logic to process the order can go here
    // e.g., save to the server, send notifications, etc.
    // Clear the order after confirmation
    Get.offAllNamed('/home'); // Navigate to the home screen or another screen
  }
}
