

import 'package:e_commerce/views/pages/home/widgets/slide_tab.dart';
import 'package:e_commerce/views/pages/home/widgets/slide_tab_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';

class SlideTabContainer extends StatelessWidget {
  final HomeController _coffeeController = Get.find();

   SlideTabContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemCount: _coffeeController.bannerimg.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SlideTabIndex();
            }
            return SlideTab(index: index,);
          }),
    );
  }
}
