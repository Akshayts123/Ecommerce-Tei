import 'package:e_commerce/views/pages/home/widgets/build_card.dart';
import 'package:e_commerce/views/pages/home/widgets/popular_card.dart';
import 'package:e_commerce/views/pages/home/widgets/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/category.dart';
import '../../../product_details/cat_products.dart';


ListView category(productList) {
  return ListView.builder(
      padding: const EdgeInsets.only(left: 5),
      itemCount: productList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        Categorys cats = controller.filteredProductscat[index];
        return GestureDetector(

          onTap: () => {Get.to(ProductDetail)},
          child: buildPopularCard(productList[index],cats),
        );
      });
}

GridView mostPopularCategory(context, product) {
  return GridView.count(
    crossAxisCount: 2,
    children: List.generate(product.length, (index) {
      Categorys cats = controller.filteredProductscat[index];
      return GestureDetector(
        onTap: () => Get.to(ProductDetail(product: product[index], cats:cats ,)),
        child: buildCard(product[index]),
      );
    }),
  );
}
