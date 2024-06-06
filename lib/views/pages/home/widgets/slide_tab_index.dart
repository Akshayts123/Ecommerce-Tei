

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlideTabIndex extends StatelessWidget {
  const SlideTabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 50,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              width: 0.5, color: context.theme.selectedRowColor)),
      child: Icon(
        Icons.ads_click_sharp,
        size: 20,
        color: context.theme.focusColor,
      ),
    );
  }
}
