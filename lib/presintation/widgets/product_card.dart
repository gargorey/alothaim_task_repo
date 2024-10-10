import 'package:alothaim_test/presintation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.onPressed,
    required this.onPressedAddToCart,
  });

  final int id;
  final String image;
  final String title;
  final double price;
  final VoidCallback onPressed;
  final VoidCallback onPressedAddToCart;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                image,
                height: 90.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('\$${price.toStringAsFixed(2)}'),
            ),
            Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
              child: CustomButtonWidget(
                  onPressed: onPressedAddToCart, text: "Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
