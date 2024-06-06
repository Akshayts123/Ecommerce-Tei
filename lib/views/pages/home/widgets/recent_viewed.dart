
import 'package:e_commerce/models/recent.dart';
import 'package:e_commerce/views/pages/home/widgets/recent_viewed_container.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';
import '../../../../models/category.dart';
import '../../../product_details/cat_products.dart';
import '../../../widgets/new_inner_pages.dart';
import '../../../widgets/recent_innerpage.dart';

class RecentViewed extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  RecentViewed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 320,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            left: 7,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: _coffeeController.bannerimg.length,
          itemBuilder: (BuildContext context, int index) {
            Recent recent = controller.filteredProductsrecent[index];
            return  RecentInnerpage(
                recent: recent,child:RecentViewedContainer(
              index: index,
            ));
          }),
    );
  }
}
