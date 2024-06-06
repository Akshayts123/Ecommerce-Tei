import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/category.dart';
import '../../../product_details/cat_products.dart';
import '../../../widgets/snackbar.dart';

class btnAddToCart extends StatefulWidget {
  final Categorys cats;
  final product;
  const btnAddToCart({Key? key, this.product, required this.cats}) : super(key: key);

  @override
  State<btnAddToCart> createState() => _btnAddToCartState();
}

class _btnAddToCartState extends State<btnAddToCart> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            animationDuration: const Duration(seconds: 5),
            backgroundColor: widget.product.color,
            side: const BorderSide(width: 1, color: Colors.white),
            padding: const EdgeInsets.all(10)),
        onPressed: widget.cats.isAvailable
            ? () {
                showSnackBar(context, 'Successfully added to cart');
                controller.addToCartcat(widget.cats);
              }
            : null,
        // Get.to(() => CartPage()),
        child: const Text(
          'ADD TO CART',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
