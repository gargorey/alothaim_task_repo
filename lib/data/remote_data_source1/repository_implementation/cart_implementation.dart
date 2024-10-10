import 'package:alothaim_test/core/api_constance/api_constance.dart';
import 'package:alothaim_test/core/error/exception.dart';
import 'package:alothaim_test/core/error/filure.dart';
import 'package:alothaim_test/core/http_client/http_client.dart';
import 'package:alothaim_test/data/data_models/cart_list_model.dart';
import 'package:alothaim_test/domain/entities/cart_entities/cart_list_entity.dart';
import 'package:alothaim_test/domain/repository/base_cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartImplementation extends BaseCartRepository {
  CustomHttpClient _customHttpClient =
      CustomHttpClient(baseUrl: ApiConstance.baseUrl);

  @override
  Future<Either<Failure, bool>> addToCart(
      {required Map<String, dynamic> data}) async {
    try {
      final response =
          await _customHttpClient.post(body: data, ApiConstance.cartEndPoint);
      return Right(true);
    } on ServerException catch (failure) {
      return Left(ServeFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CartListEntity>> getCartList() async {
    try {
      final response =
          await _customHttpClient.get(ApiConstance.cartEndPoint + "/1");
      print("from cart implemention$response}");

      return Right(CartListModel.fromJson(response));
    } on ServerException catch (failure) {
      return Left(ServeFailure(failure.errorMessageModel.statusMessage));
    }
  }

  List<CartListEntity> mappingListOfObject(str) =>
      List<CartListModel>.from(str.map((x) => CartListModel.fromJson(x)));
}
