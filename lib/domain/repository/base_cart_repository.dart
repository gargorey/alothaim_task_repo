import 'package:alothaim_test/core/error/filure.dart';
import 'package:alothaim_test/domain/entities/cart_entities/cart_list_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseCartRepository {
  Future<Either<Failure, bool>> addToCart({required Map<String, dynamic> data});
  Future<Either<Failure, CartListEntity>> getCartList();
}
