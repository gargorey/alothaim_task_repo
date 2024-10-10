import 'package:alothaim_test/core/error/filure.dart';
import 'package:alothaim_test/domain/entities/products_entities/all_products_entity.dart';
import 'package:alothaim_test/domain/use_cases/get_all_products_use_case.dart';
import 'package:alothaim_test/presintation/controllers/cart_screen_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../core/helpers/custom_snackbar.dart';

class ProductDetailsController extends GetxController {
  final int id = Get.arguments;
  GetAllProductsUseCase _getAllProductsUseCase = GetAllProductsUseCase();
  AllProductsEntity? productDetailsModel;
  RxBool isLoading = false.obs;
  getAllProducts() async {
    isLoading.value = true;
    Either<Failure, AllProductsEntity> response =
        await _getAllProductsUseCase.getProductDetails(id: id);
    isLoading(false);
    response.fold(
      (l) => showCustomSnackBar('', l.message),
      (r) {
        productDetailsModel = r;
      },
    );
  }

  CartScreenController cartController = Get.put(CartScreenController());

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }
}
