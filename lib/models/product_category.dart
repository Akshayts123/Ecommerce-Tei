import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

class ProductCategory {
  ProductType type;
  bool isSelected;
  IconData icon;

  ProductCategory(this.type, this.isSelected, this.icon);
}
