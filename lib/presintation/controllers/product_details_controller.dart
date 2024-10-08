import 'package:alothaim_test/domain/entities/products_entities/all_products_entity.dart';
import 'package:alothaim_test/domain/use_cases/get_all_products_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final int id = Get.arguments;
  GetAllProductsUseCase _getAllProductsUseCase = GetAllProductsUseCase();
  AllProductsEntity? productDetailsModel;
  RxBool isLoading = false.obs;
  getAllProducts() async {
    isLoading.value = true;
    Either<bool, AllProductsEntity> response =
        await _getAllProductsUseCase.getProductDetails(id: id);
    isLoading(false);
    response.fold(
      (l) => Get.snackbar('', "something went wrong"),
      (r) {
        productDetailsModel = r;
      },
    );
  }

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }
}
