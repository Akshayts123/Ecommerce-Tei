import 'package:e_commerce/views/pages/home/widgets/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/products.dart';

buildPopularCard(Products product,cats) {
  return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () {
          Get.to(ProductDetail(product: product,cats: cats,));
        },
        child: _productCard(product),
      ));
}

Card _productCard(Products product) {
  return Card(
    elevation: 5,
    color: product.color,
    child: GridTile(
      child: Column(
        children: [
          _imageIcon(product),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _title(product),
          ),
        ],
      ),
    ),
  );
}

Text _title(Products product) {
  return Text(
    product.title,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

Container _imageIcon(Products product) {
  return Container(
    height: 100,
    width: 120,
    padding: const EdgeInsets.all(20),
    child: Image.asset(
      product.image,
      fit: BoxFit.cover,
      height: 80,
      width: 80,
    ),
  );
}
