class CartHelper {




static  String sumPrices({
    required double prices,
    required int qty,
}){
    return (prices * qty).toStringAsFixed(2);
  }



}