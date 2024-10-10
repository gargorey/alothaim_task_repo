import 'package:alothaim_test/presintation/controllers/cart_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartHelper {




static  String sumPrices({
    required double prices,
    required int qty,
}){
    return (prices * qty).toStringAsFixed(2);
  }


  static void deleteHelper({
  required int productID
}){
    Get.defaultDialog(
      title: "Delete Item",
      content: Row(
        children: [
          Expanded(child:Text( "are you sure to delete this item!")),
        ],
      ),
        confirm: MaterialButton(
            color:Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Delete".tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              Get.find<CartScreenController>().deleteProduct(productID:productID);
              Get.back();
            }),
        cancel:  MaterialButton(
          color:Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "cancel".tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              Get.back();
            })
    );
  }



}