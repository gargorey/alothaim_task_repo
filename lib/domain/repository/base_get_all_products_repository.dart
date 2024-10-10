import 'package:alothaim_test/domain/entities/products_entities/all_products_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseGetAllProductsRepository {
  Future<Either<bool, List<AllProductsEntity>>> getAllProducts();
  Future<Either<bool, AllProductsEntity>> getProductDetails({required int id});
  Future<Either<bool, List<AllProductsEntity>>> harin();
}
