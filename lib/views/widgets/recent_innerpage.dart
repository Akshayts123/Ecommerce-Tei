import 'package:e_commerce/models/category.dart';
import 'package:e_commerce/views/product_details/cat_products.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:get/get.dart';
import '../../models/product.dart';
import '../../models/recent.dart';
import '../product_details/product_detail_screen.dart';
import '../product_details/recent_products.dart';

class RecentInnerpage extends StatelessWidget {
  const RecentInnerpage(
      {Key? key, required this.child, required this.recent})
      : super(key: key);

  final Widget child;
  final Recent recent;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      closedColor: context.theme.backgroundColor,
      transitionType: ContainerTransitionType.fade,
      transitionDuration: const Duration(milliseconds: 850),
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return InkWell(
          onTap: openContainer,
          child: child,
        );
      },
      openBuilder: (BuildContext context, VoidCallback _) {
        return RecentProducts(recent);
      },
    );
  }
}
