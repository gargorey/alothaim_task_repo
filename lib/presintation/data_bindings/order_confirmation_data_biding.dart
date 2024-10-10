import 'package:alothaim_test/presintation/controllers/order_confirmation_controller.dart';
import 'package:get/get.dart';

class OrderConformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      () => OrderConformationController(),
    );
  }
}
