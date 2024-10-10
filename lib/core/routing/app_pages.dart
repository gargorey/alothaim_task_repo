import 'package:alothaim_test/core/routing/app_routes.dart';
import 'package:alothaim_test/presintation/data_bindings/cart_data_binding.dart';
import 'package:alothaim_test/presintation/data_bindings/home_screen_data_binding.dart';
import 'package:alothaim_test/presintation/data_bindings/order_confirmation_data_biding.dart';
import 'package:alothaim_test/presintation/data_bindings/product_details_data_binding.dart';
import 'package:alothaim_test/presintation/screens/cart_screen.dart';
import 'package:alothaim_test/presintation/screens/home_screen.dart';
import 'package:alothaim_test/presintation/screens/main_screen.dart';
import 'package:alothaim_test/presintation/screens/order_confirrmation_screen.dart';
import 'package:alothaim_test/presintation/screens/product_details_screen.dart';
import 'package:get/get.dart';

class AppPages {
  List<GetPage> routes = [
    GetPage(
      // binding: HomeScreenDataBinding(),
      name: AppRoutes.mainScreen,
      page: () => MainScreen(),
    ),
    GetPage(
      binding: HomeScreenDataBinding(),
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      binding: ProductDetailsDataBinding(),
      name: AppRoutes.productDetailsScreen,
      page: () => ProductDetailsScreen(),
    ),
    GetPage(
      binding: CartScreenDataBinding(),
      name: AppRoutes.cartScreen,
      page: () => CartScreen(),
    ),
    GetPage(
      binding: OrderConformationBinding(),
      name: AppRoutes.conformationScreen,
      page: () => OrderConfirmationScreen(),
    ),
  ];
}
