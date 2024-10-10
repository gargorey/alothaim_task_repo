import 'package:alothaim_test/data/remote_data_source1/repository_implementation/cart_implementation.dart';
import 'package:alothaim_test/domain/entities/cart_entities/cart_list_entity.dart';
import 'package:alothaim_test/domain/repository/base_cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartUseCase extends BaseCartRepository {
  CartImplementation _cartImplementation = CartImplementation();
  @override
  Future<Either<bool, bool>> addToCart({required Map<String, dynamic> data}) {
    return _cartImplementation.addToCart(data: data);
  }

  @override
  Future<Either<bool, CartListEntity>> getCartList() {
    return _cartImplementation.getCartList();
  }
}
