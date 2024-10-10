import 'package:alothaim_test/domain/entities/cart_entities/cart_list_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseCartRepository {
  Future<Either<bool, bool>> addToCart({required Map<String, dynamic> data});
  Future<Either<bool, CartListEntity>> getCartList();
  Future<Either<bool, bool>> updateCart({required int productId,required int qty, required int userId, required String date});
}
