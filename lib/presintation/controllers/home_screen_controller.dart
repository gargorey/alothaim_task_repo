import 'package:alothaim_test/domain/entities/products_entities/all_products_entity.dart';
import 'package:alothaim_test/domain/use_cases/get_all_products_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  GetAllProductsUseCase _getAllProductsUseCase = GetAllProductsUseCase();
  RxList<AllProductsEntity> allProductsListModel = <AllProductsEntity>[].obs;
  RxBool isLoading = false.obs;
  getAllProducts() async {
    isLoading.value = true;
    Either<bool, List<AllProductsEntity>> response =
        await _getAllProductsUseCase.getAllProducts();
    isLoading(false);
    response.fold(
      (l) => Get.snackbar('', "something went wrong"),
      (r) {
        allProductsListModel.value = r;
      },
    );
  }

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }
}
