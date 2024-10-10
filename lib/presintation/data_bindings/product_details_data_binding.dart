import 'package:alothaim_test/presintation/controllers/product_details_controller.dart';
import 'package:get/get.dart';

class ProductDetailsDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProductDetailsController(),
    );
  }
}
