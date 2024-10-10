import 'package:alothaim_test/domain/entities/cart_entities/cart_list_entity.dart';
import 'package:alothaim_test/presintation/controllers/cart_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends GetView<CartScreenController> {
  CartScreenController controller = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: controller.isLoading.value
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.separated(
        itemCount: 1,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(22.0),
            child: Row(
              children: [
                Image.network(controller.productDetailsModel![index].image),
                SizedBox(width: 10),
                Text("Product price: ${controller.productDetailsModel![index].price}"),
                SizedBox(width: 10),
                // Text("Quantity: ${controller.cartListModel!.quantity}"),
                SizedBox(width: 10),
                // Text("Details: ${controller.productDetailsModel[index].description}"), // Adjust as needed based on actual product details
              ],
            )
        ),
        separatorBuilder: (context,index) => SizedBox(),
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  final CartListEntity cartItem;

  CartCard({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cartItem.products!.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "product.name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${cartItem.products![index].quantity}',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ],
                  ),
                ),
                QuantityControl(cartListProduct: cartItem.products![index]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuantityControl extends StatefulWidget {
  final CartListProduct cartListProduct;

  QuantityControl({required this.cartListProduct});

  @override
  _QuantityControlState createState() => _QuantityControlState();
}

class _QuantityControlState extends State<QuantityControl> {
  void _increaseQuantity() {
    setState(() {
      widget.cartListProduct.quantity! + 1;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (widget.cartListProduct.quantity! > 1) {
        widget.cartListProduct.quantity! - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: _decreaseQuantity,
        ),
        Text(widget.cartListProduct.quantity.toString()),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _increaseQuantity,
        ),
      ],
    );
  }
}
