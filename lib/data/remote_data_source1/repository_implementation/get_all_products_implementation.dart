import 'package:alothaim_test/core/api_constance/api_constance.dart';
import 'package:alothaim_test/core/error/exception.dart';
import 'package:alothaim_test/core/error/filure.dart';
import 'package:alothaim_test/core/http_client/http_client.dart';
import 'package:alothaim_test/data/data_models/all_products_model.dart';
import 'package:alothaim_test/domain/entities/products_entities/all_products_entity.dart';
import 'package:alothaim_test/domain/repository/base_get_all_products_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllProductsImplementation extends BaseGetAllProductsRepository {
  CustomHttpClient _customHttpClient =
      CustomHttpClient(baseUrl: ApiConstance.baseUrl);

  Future<Either<Failure, List<AllProductsEntity>>> getAllProducts() async {
    try {
      final response =
          await _customHttpClient.get(ApiConstance.productsEndPoint);
      List<AllProductsEntity> allProductsModel = mappingListOfObject(response);
      return Right(allProductsModel);
    } on ServerException catch (failure) {
      return Left(ServeFailure(failure.errorMessageModel.statusMessage));
    }
  }

  List<AllProductsEntity> mappingListOfObject(str) =>
      List<AllProductsModel>.from(str.map((x) => AllProductsModel.fromJson(x)));

  @override
  Future<Either<Failure, AllProductsEntity>> getProductDetails(
      {required int id}) async {
    try {
      final response =
          await _customHttpClient.get(ApiConstance.productsEndPoint + "/$id");
      print("respnse from implem${response}");
      return Right(AllProductsModel.fromJson(response));
    } on ServerException catch (failure) {
      return Left(ServeFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
