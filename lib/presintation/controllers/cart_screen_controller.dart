import 'package:alothaim_test/core/error/filure.dart';
import 'package:alothaim_test/domain/entities/cart_entities/cart_list_entity.dart';
import 'package:alothaim_test/domain/entities/products_entities/all_products_entity.dart';
import 'package:alothaim_test/domain/use_cases/cart_use_case.dart';
import 'package:alothaim_test/domain/use_cases/get_all_products_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {
  CartUseCase _cartUseCase = CartUseCase();
  RxBool isLoading = false.obs;
  addToCart() async {
    isLoading.value = true;
    Either<Failure, bool> response = await _cartUseCase.addToCart(data: {
      "userId": 5,
      "date": "2020-02-03",
      "products": [
        {"productId": 5, "quantity": 1},
        {"productId": 1, "quantity": 5}
      ]
    });
    isLoading(false);
    response.fold(

      (l) => Get.snackbar('', l.message),
      (r) => Get.snackbar('', "Product Added Succefully"),
    );
  }

  GetAllProductsUseCase _getAllProductsUseCase = GetAllProductsUseCase();

  var productDetailsModel = <AllProductsEntity>[].obs;
  CartListEntity? cartListModel;
  Map<int,dynamic> cartProduct = {};


  updateCart({required int productId,required int qty, required int userId, required String date}) async {
    isLoading.value = true;
    Either<bool, bool> response = await _cartUseCase.updateCart(productId: productId, qty:  qty,date: date,userId: userId);
    isLoading(false);
    response.fold(
          (l) => Get.snackbar('', "something went wrong"),
          (r) {
            cartProduct[productId] = qty;
            update();
            Get.snackbar('', "Cart updated Succefully");

          },
    );
  }


  getCartList() async {
    isLoading.value = true;
    Either<Failure, CartListEntity> response = await _cartUseCase.getCartList();

    print("from cart imp${response}");

    response.fold(

      (l) => Get.snackbar('${l}', l.message),
      (r) {
        cartListModel = r;
        cartProduct.clear();
        productDetailsModel.clear();
        for (var element in r.products!) {
            getProductDetails(id: element.productId!);
            cartProduct.addAll({element.productId!:element.quantity});
          }
        isLoading(false);
      },
    );
  }

  getProductDetails({required int id}) async {

    Either<Failure, AllProductsEntity> response =
        await _getAllProductsUseCase.getProductDetails(id: id);
    response.fold(
      (l) => Get.snackbar('', l.message),
      (r) {
        productDetailsModel.add(r);
      },
    );
  }

  @override
  void onInit() {
    getCartList();
    super.onInit();
  }

  void deleteProduct({required int productID}) {
    cartProduct.removeWhere((key, value) => key == productID);
    productDetailsModel.removeWhere((element) => element.id == productID);
  }

 String calculateTotal() {
    double total = 0;
    for (var element in productDetailsModel) {
      total = total + (element.price * cartProduct[element.id]);
    }
    return total.toStringAsFixed(2);
  }
}