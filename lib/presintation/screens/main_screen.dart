import 'package:alothaim_test/core/helpers/colors_helper.dart';
import 'package:alothaim_test/presintation/controllers/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainScreenController> {
  MainScreen({super.key});

  MainScreenController controller = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home,
      Icons.shopping_cart_checkout_outlined,
    ];
    return Obx(
      () => Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 70.h,
            decoration: BoxDecoration(
                color: ColorsHelper.mainColor,
                borderRadius: BorderRadius.circular(22)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: ListView.builder(
                itemCount: icons.length,
                scrollDirection: Axis.horizontal,
                itemExtent: 120.w,
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
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: controller.children[controller.selectedScreen.value],
      ),
    );
  }
}
