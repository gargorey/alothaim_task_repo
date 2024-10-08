import 'package:equatable/equatable.dart';

abstract class AllProductsEntity extends Equatable {
  int id;
  String title;
  double price;

  String image;

  AllProductsEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });
}
