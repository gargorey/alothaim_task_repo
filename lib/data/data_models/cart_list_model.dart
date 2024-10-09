import 'package:alothaim_test/domain/entities/cart_entities/cart_list_entity.dart';

class CartListModel extends CartListEntity {
  CartListModel({
    required super.id,
    required super.date,
    required super.products,
    required super.userId,
  });

  factory CartListModel.fromJson(Map<String, dynamic> json) {
    return CartListModel(
      id: json['id'],
      date: json['date'],
      products:
          json["products"] == null ? [] : mappingListOfObject(json['products']),
      userId: json['userId'],
    );
  }
}

List<CartListProduct> mappingListOfObject(str) {
  return List<CartListProductModel>.from(
      str.map((x) => CartListProductModel.fromJson(x)));
}

class CartListProductModel extends CartListProduct {
  CartListProductModel({
    super.productId,
    super.quantity,
  });
  factory CartListProductModel.fromJson(Map<String, dynamic> json) {
    return CartListProductModel(
        productId: json['productId'], quantity: json['quantity']);
  }
}
