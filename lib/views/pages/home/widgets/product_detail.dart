import 'package:e_commerce/views/pages/home/widgets/price_rating.dart';
import 'package:flutter/material.dart';

import '../../../../models/category.dart';
import '../../../../models/products.dart';
import 'cart_btn.dart';
import 'detailed_appbar.dart';
import 'image_view.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    Key? key,
    required this.product, required this.cats,
  }) : super(key: key);

  final Products product;
  final Categorys cats;
  @override
  Widget build(BuildContext context) {

    double kSpace = 10;
    return Scaffold(
      appBar: detailAppBar(product),
      body: Stack(
        children: [
          showImageView(context, product),
          const SizedBox(height: 10),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRowPriceRating(product),
                const SizedBox(height: 10),
                Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16.0, color: Colors.white),
                  maxLines: 5,
                ),
                const SizedBox(height: 20),

                 btnAddToCart(product: product,cats:cats  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
