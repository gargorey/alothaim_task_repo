import 'package:equatable/equatable.dart';

abstract class CartListEntity extends Equatable {
  int? id;
  int? userId;
  String? date;
  List<CartListProduct>? products;

  CartListEntity({
    this.id,
    this.userId,
    this.date,
    this.products,
  });

  @override
  List<Object?> get props => [id, userId, date, products];
}

abstract class CartListProduct extends Equatable {
  int? productId;
  int? quantity;

  CartListProduct({
    this.productId,
    this.quantity,
  });

  @override
  List<Object?> get props => [
        productId,
        quantity,
      ];
}
