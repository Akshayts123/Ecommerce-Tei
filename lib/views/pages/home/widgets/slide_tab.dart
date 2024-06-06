

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';

class SlideTab extends StatelessWidget {
  final index;
  final HomeController _coffeeController = Get.find();

   SlideTab({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 130,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: context.theme.cardColor,
            border: Border.all(
                width: 0.5, color: context.theme.selectedRowColor)),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              margin:
              EdgeInsets.only(right: 10, left: 5),
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                _coffeeController.bannerimg[index],
                width: 20.0,
                height: 20.0,
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Text(
                _coffeeController.bannertitle[index],
                style:
                context.theme.textTheme.titleSmall,
              ),
            )
          ],
        ));
  }
}
