import 'package:alothaim_test/presintation/controllers/cart_screen_controller.dart';
import 'package:get/get.dart';

class CartScreenDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CartScreenController(),
    );
  }
}
