

import 'package:e_commerce/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';
import '../../../../models/product.dart';
import '../../../product_details/product_detail_screen.dart';
import '../../../widgets/new_inner_pages.dart';
import '../../../widgets/open_container_wrapper.dart';
import 'best_offer_container.dart';

class BestOffers extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
   BestOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
      margin: EdgeInsets.only(top: 10),
      height: 255,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 10),
          scrollDirection: Axis.horizontal,
          itemCount: controller.filteredProductscat.length,
          itemBuilder: (BuildContext context, int index) {
            Categorys cats = controller.filteredProductscat[index];
            return  Container(
              padding: EdgeInsets.only(right: 10),
              child: NewInnerPages(
                  cats: cats,child: BestOfferContainer(index: index,)),
            );
          }),
    );
  }
}
