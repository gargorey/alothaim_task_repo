import 'package:alothaim_test/presintation/controllers/cart_screen_controller.dart';
import 'package:alothaim_test/presintation/controllers/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreenDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CartScreenController(),
    );
    Get.lazyPut(
      () => HomeScreenController(),
    );
  }
}
