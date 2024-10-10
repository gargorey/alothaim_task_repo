import 'package:alothaim_test/core/api_constance/api_constance.dart';
import 'package:alothaim_test/core/http_client/http_client.dart';
import 'package:alothaim_test/data/data_models/cart_list_model.dart';
import 'package:alothaim_test/domain/entities/cart_entities/cart_list_entity.dart';
import 'package:alothaim_test/domain/repository/base_cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartImplementation extends BaseCartRepository {
  final CustomHttpClient _customHttpClient =
      CustomHttpClient(baseUrl: ApiConstance.baseUrl);

  @override
  Future<Either<bool, bool>> addToCart(
      {required Map<String, dynamic> data}) async {
    try {
      final response =
          await _customHttpClient.post(body: data, ApiConstance.cartEndPoint);
      return const Right(true);
    } catch (e) {
      return left(false);
    }
  }

  @override
  Future<Either<bool, List<CartListEntity>>> getCartList() async {
    try {
      final response = await _customHttpClient.get(ApiConstance.cartEndPoint);
      print("from cart implementation $response}");

      List<CartListEntity> cartList = mappingListOfObject(response);
      return Right(cartList);
    } catch (e) {
      return left(false);
    }
  }

  List<CartListEntity> mappingListOfObject(str) =>
      List<CartListModel>.from(str.map((x) => CartListModel.fromJson(x)));
}
