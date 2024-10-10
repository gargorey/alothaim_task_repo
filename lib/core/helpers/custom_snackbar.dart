import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


  void showCustomSnackBar(String title,String body,
  {int second = 2,}
  ) {
    Get.snackbar(
      title.tr,
      body.tr,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      duration: Duration(seconds: second),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
      mainButton: TextButton(
        onPressed: () {
          Get.back(); // Close the snackbar
        },
        child: Text(
          'CLOSE'.tr,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }


