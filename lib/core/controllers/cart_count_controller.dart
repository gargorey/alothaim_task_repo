import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartCountController extends GetxController {
  int quant = 0;

  addToCart(int quantity) {
    CartShared.addToCart(quantity);
    update();
    quant = CartShared.getquant();
    update();
  }

  deleteItemFromCart() {
    CartShared.deleteFromCart();
    update();

    quant = CartShared.getquant();
    update();
  }

  setCartQuantity(int quantity) {
    CartShared.setCart(quantity);
    update();

    quant = quantity;
    update();
  }

  @override
  void onInit() {
    quant = CartShared.getquant() == 0 ? 0 : CartShared.getquant();
    super.onInit();
  }
}

class CartShared {
  static late SharedPreferences _sharedPreferences;
  static const _quantityKey = "quant";
  // static int _data = 0;
  static const _isWishListKey = "wish";
  static bool isWishList = false;

  static final prefs = SharedPreferences.getInstance();
  static Future<void> init() async {
    _sharedPreferences = await prefs;
    _sharedPreferences.setInt(_quantityKey, 0);
  }

  static deleteFromCart() {
    if ((_sharedPreferences.getInt(_quantityKey))! > 0) {
      _sharedPreferences.setInt(
          _quantityKey, (_sharedPreferences.getInt(_quantityKey))! - 1);
    }
  }

  static addToCart(int quantity) {
    if ((_sharedPreferences.getInt(_quantityKey))! >= 0)
      _sharedPreferences.setInt(
          _quantityKey, (_sharedPreferences.getInt(_quantityKey))! + quantity);
  }

  static setCart(int quantity) {
    _sharedPreferences.setInt(_quantityKey, quantity);
  }

  static int getquant() {
    return (_sharedPreferences.getInt(_quantityKey)!);
  }
}
