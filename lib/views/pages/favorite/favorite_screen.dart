import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/product_grid_view.dart';
import '../home/widgets/recent_viewed_container.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: context.theme.primaryColor,
        title: Text(
          "Favorites",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.all(20),
        child: ProductGridView(),
      ),
    );
  }
}
