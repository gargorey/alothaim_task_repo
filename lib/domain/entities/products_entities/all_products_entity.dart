import 'package:equatable/equatable.dart';

abstract class AllProductsEntity extends Equatable {
  int id;
  String title;
  String? description;
  double price;

  String image;

  AllProductsEntity({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    required this.image,
  });
}
