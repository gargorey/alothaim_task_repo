import 'package:alothaim_test/core/api_constance/api_constance.dart';
import 'package:alothaim_test/core/http_client/http_client.dart';
import 'package:alothaim_test/data/data_models/all_products_model.dart';
import 'package:alothaim_test/domain/entities/products_entities/all_products_entity.dart';
import 'package:alothaim_test/domain/repository/base_get_all_products_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllProductsImplementation extends BaseGetAllProductsRepository {
  CustomHttpClient _customHttpClient =
      CustomHttpClient(baseUrl: ApiConstance.baseUrl);

  Future<Either<bool, List<AllProductsEntity>>> getAllProducts() async {
    try {
      final response =
          await _customHttpClient.get(ApiConstance.productsEndPoint);
      List<AllProductsEntity> allProductsModel = mappingListOfObject(response);
      return Right(allProductsModel);
    } catch (e) {
      return left(false);
    }
  }

  List<AllProductsEntity> mappingListOfObject(str) =>
      List<AllProductsModel>.from(str.map((x) => AllProductsModel.fromJson(x)));

  @override
  Future<Either<bool, AllProductsEntity>> getProductDetails(
      {required int id}) async {
    try {
      final response =
          await _customHttpClient.get(ApiConstance.productsEndPoint + "/$id");
      return Right(AllProductsModel.fromJson(response));
    } catch (e) {
      return left(false);
    }
  }

  @override
  Future<Either<bool, List<AllProductsEntity>>> harin() {
    // TODO: implement harin
    throw UnimplementedError();
  }
}
