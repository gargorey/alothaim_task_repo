import 'dart:io';

import 'package:alothaim_test/core/helpers/colors_helper.dart';
import 'package:alothaim_test/core/routing/app_pages.dart';
import 'package:alothaim_test/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'presintation/data_bindings/home_screen_data_binding.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            title: 'Alothaim Task',
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: ColorsHelper.mainColor),
              useMaterial3: false,
            ),
            initialBinding: HomeScreenDataBinding(),
            getPages: AppPages().routes,
            initialRoute: AppRoutes.mainScreen,
          );
        });
  }
}
