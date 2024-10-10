import 'package:alothaim_test/data/remote_data_source1/repository_implementation/get_all_products_implementation.dart';
import 'package:alothaim_test/domain/entities/products_entities/all_products_entity.dart';
import 'package:alothaim_test/domain/repository/base_get_all_products_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllProductsUseCase extends BaseGetAllProductsRepository {
  GetAllProductsImplementation _getAllProductsImplementation =
      GetAllProductsImplementation();
  @override
  Future<Either<bool, List<AllProductsEntity>>> getAllProducts() {
    return _getAllProductsImplementation.getAllProducts();
  }

  @override
  Future<Either<bool, AllProductsEntity>> getProductDetails({required int id}) {
    return _getAllProductsImplementation.getProductDetails(id: id);
  }

  @override
  Future<Either<bool, List<AllProductsEntity>>> harin() {
    return _getAllProductsImplementation.harin();
  }
}
