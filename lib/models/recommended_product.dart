
import 'package:flutter/material.dart';


class RecommendedProduct {
  Color? cardBackgroundColor;
  Color? buttonBackgroundColor;
  String? imagePath;

  RecommendedProduct(
      {this.cardBackgroundColor,
      this.buttonBackgroundColor = Colors.white,
      this.imagePath});
}
