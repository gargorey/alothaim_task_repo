import 'package:alothaim_test/presintation/screens/cart_screen.dart';
import 'package:alothaim_test/presintation/screens/home_screen.dart';
import 'package:alothaim_test/presintation/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  RxInt selectedScreen = 0.obs;
  List<Widget> children = [
    HomeScreen(),
    CartScreen(),
    SettingsScreen(),
  ];
}
