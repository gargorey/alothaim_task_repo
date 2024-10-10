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
    Either<bool, bool> response = await _cartUseCase.addToCart(data: {
      "userId": 5,
      "date": "2020-02-03",
      "products": [
        {"productId": 5, "quantity": 1},
        {"productId": 1, "quantity": 5}
      ]
    });
    isLoading(false);
    response.fold(
      (l) => Get.snackbar('', "something went wrong"),
      (r) => Get.snackbar('', "Product Added Succefully"),
    );
  }

  GetAllProductsUseCase _getAllProductsUseCase = GetAllProductsUseCase();

  List<AllProductsEntity>? productDetailsModel;
  Rx<CartListEntity>? cartListModel;

  getCartList() async {
    isLoading.value = true;

    try {
      Either<bool, CartListEntity> response = await _cartUseCase.getCartList();

      print("from cart imp${response}");

      response.fold(
        (l) {
          isLoading(false);

          Get.snackbar('${l}', "something went wrong");},
        (r) {
          print("from  cartListModel!.value = ${r}");

         // cartListModel!.value = r;
          // r.products!.forEach((element) {
          //
          // });

          Future.forEach(r.products!, (element) =>  getProductDetails(id: element.productId!)).then((value)=> isLoading(false) );

        },
      );
    } catch (e) {
      print("from catch "+e.toString());
    }
  }

  getProductDetails({required int id}) async {
    // isLoading.value = true;

   try{
     Either<bool, AllProductsEntity> response =
     await _getAllProductsUseCase.getProductDetails(id: id);
     // isLoading(false);

    return response.fold(
           (l) {


         Get.snackbar('', "something went wrong");
         return null;
       },
           (r) {
             print(productDetailsModel!.length);
             print("________________________");
            productDetailsModel!.add(r);


       },
     );

   }catch(e)
    {
      print("error from product details "+ e.toString());
      return null;
    }
  }

  @override
  void onInit() {
    getCartList();
    super.onInit();
  }
}
