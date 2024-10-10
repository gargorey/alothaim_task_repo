import 'package:alothaim_test/presintation/controllers/order_confirmation_controller.dart';
import 'package:alothaim_test/presintation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderConfirmationScreen extends GetView<OrderConformationController> {
    OrderConfirmationScreen({
    super.key,
  });
    OrderConformationController controller = Get.put(OrderConformationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Order Confirmation'),
      ),
      body: Padding(
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(
                          '${controller.cartListModel[index].image}'),
                      title: Text('${controller.cartListModel[index].title}'),

                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            // Total Amount
            Divider(
              thickness: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Items Quantity',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${controller.cartListModel.length}',
                    // '\$${orderItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity'],),),}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

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
            CustomButtonWidget(
              onPressed: () {},
              width: double.maxFinite,
              height: 60,
              text:
                'Confirm',

            ),
          ],
        ),
      ),
    );
  }
}
