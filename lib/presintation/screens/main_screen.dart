import 'package:alothaim_test/presintation/controllers/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainScreenController> {
  MainScreen({super.key});

  MainScreenController controller = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home,
      Icons.shopping_cart_checkout_outlined,
      Icons.settings,
    ];
    return Obx(
      () => Scaffold(
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: ListView.builder(
            itemCount: icons.length,
            scrollDirection: Axis.horizontal,
            itemExtent: Get.width / icons.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                controller.selectedScreen.value = index;
              },
              child: AnimatedSize(
                duration: const Duration(seconds: 1),
                curve: Curves.ease,
                alignment: Alignment.center,
                child: Icon(
                  icons[index],
                  size: controller.selectedScreen.value == index ? 44 : 24,
                  color: controller.selectedScreen.value == index
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        ),
        body: controller.children[controller.selectedScreen.value],
      ),
    );
  }
}
