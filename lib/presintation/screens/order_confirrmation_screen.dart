import 'package:alothaim_test/presintation/controllers/order_confirmation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderConfirmationScreen extends GetView<OrderConformationController> {
  const OrderConfirmationScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Order Confirmation'),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              // Order Summary
              const Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              ListView.builder(
                itemCount: controller.cartListModel.length, //orderItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  //orderItems[index];
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: Image.network(
                          '${controller.cartListModel[index].image}'),
                      title: Text('${controller.cartListModel[index].title}'),
                      subtitle:
                          Text('${controller.cartListModel[index].price}'),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              // Total Amount
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${controller.total}',
                      // '\$${orderItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity'],),),}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Call to Action
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back to the home screen or wherever you want
                      //   Get.offAll(() => HomeScreen()); // Replace with your home screen
                    },
                    child: const Text(
                      'Continue Shopping',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Pay',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
