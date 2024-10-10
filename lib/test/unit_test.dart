import 'package:alothaim_test/domain/entities/cart_entities/cart_list_entity.dart';
import 'package:alothaim_test/presintation/controllers/cart_screen_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('test', () {
    test('should return the correct value', () {
      CartScreenController cartScreenController =
          Get.put(CartScreenController());

      // Act
      final result = cartScreenController.getCartList();

      // Assert
      expect(result, CartListEntity);
    });
  });
}
