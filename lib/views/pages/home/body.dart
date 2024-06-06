import 'package:e_commerce/views/pages/home/widgets/product_category.dart';
import 'package:flutter/material.dart';
import '../../../models/products.dart';



Column detailBody(List<Products> products, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

      SizedBox(
        height: 140,
        child: category(products),
      ),

    ],
  );
}
