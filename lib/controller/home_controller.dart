

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  int counter = 0;
  final List<String> bannerimg =[
  "assets/images/lamp.png",
   "assets/images/chair.png",
   "assets/images/sofa.png",
  "assets/images/table.png",
   "assets/images/table_1.png",

  ];
  final List<String> recentimg =[
    "assets/images/recent1.png",
    "assets/images/recent2.png",
    "assets/images/recent3.png",
    "assets/images/recent4.png",
    "assets/images/recent5.png",

  ];
  final List<String> bannertitle =[
    'Chair',
    'Sofa',
    'Woods',
    'Table',
    'Lamp',

  ];
  List<Color> coloring = [
    Color(0xFFE2F1FA),
    Color(0xFFFDE1E6),
    Color(0xFFD5D5E0),
    Color(0xFFE2F1FA),
    Color(0xFFD5D5E0),
  ];
  List<Color> coloring2 = [

    Color(0xFFD5D5E0),
    Color(0xFFE2F1FA),
    Color(0xFFD5D5E0),
    Color(0xFFE2F1FA),
    Color(0xFFFDE1E6),
  ];

}