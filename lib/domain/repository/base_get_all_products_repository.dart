import 'package:alothaim_test/core/error/filure.dart';
import 'package:alothaim_test/domain/entities/products_entities/all_products_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseGetAllProductsRepository {
  Future<Either<Failure, List<AllProductsEntity>>> getAllProducts();
  Future<Either<Failure, AllProductsEntity>> getProductDetails(
      {required int id});
}
