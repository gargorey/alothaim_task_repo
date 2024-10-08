import 'package:alothaim_test/domain/entities/products_entities/all_products_entity.dart';

class AllProductsModel extends AllProductsEntity {
  AllProductsModel({
    required super.id,
    required super.title,
    required super.price,
    required super.image,
    // super.description,
    // super.rating,
  });

  factory AllProductsModel.fromJson(Map<String, dynamic> json) {
    return AllProductsModel(
      id: json['id'],
      title: json['title'],
      price: double.parse(json['price'].toString()),
      image: json['image'],
      // description: json['description'],
      // rating: json['rating'],
    );
  }
  AllProductsEntity copyWith({
    required int id,
    required String title,
    required double price,
    String? description,
    required String image,
  }) =>
      AllProductsModel(
        id: id,
        title: title,
        price: price,
        // description: description ?? this.description,
        image: image,
        // rating: rating ?? this.rating,
      );
  @override
  List<Object?> get props => [
        id,
        title,
        price,
        image,
      ];
}
