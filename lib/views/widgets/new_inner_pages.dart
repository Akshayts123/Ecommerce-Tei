import 'package:e_commerce/models/category.dart';
import 'package:e_commerce/views/product_details/cat_products.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:get/get.dart';
import '../../models/product.dart';
import '../product_details/product_detail_screen.dart';

class NewInnerPages extends StatelessWidget {
  const NewInnerPages(
      {Key? key, required this.child, required this.cats})
      : super(key: key);

  final Widget child;
  final Categorys cats;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      closedColor: context.theme.cardColor,
      transitionType: ContainerTransitionType.fade,
      transitionDuration: const Duration(milliseconds: 850),
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return InkWell(
          onTap: openContainer,
          child: child,
        );
      },
      openBuilder: (BuildContext context, VoidCallback _) {
        return CatProducts(cats);
      },
    );
  }
}
