import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class Res {
  static const String lamp = "assets/images/lamp.png";
  static const String chair = "assets/images/chair.png";
  static const String sofa = "assets/images/sofa.png";
  static const String table = "assets/images/table.png";
  static const String table1 = "assets/images/table_1.png";

  static List<Products> fetchProducts() {
    List<Products> productList = [];
    String description =
        "A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy";
    productList.add(Products(
        color: Colors.amber.shade900,
        count: "3",
        description: description,
        image: Res.sofa,
        info: "",
        price: "5000",
        size: "23/56",
        tag: "",
        title: "Sofa"));
    productList.add(Products(
        color: Colors.lightBlue.shade500,
        count: "1",
        description: description,
        image: Res.table,
        info: "",
        price: "4000",
        size: "43/506",
        tag: "",
        title: "Table"));
    productList.add(Products(
        color: Colors.yellow.shade800,
        count: "30",
        description: description,
        image: Res.lamp,
        info: "",
        price: "500",
        size: "23/56",
        tag: "",
        title: "Lamp"));
    productList.add(Products(
        color: Colors.pink,
        count: "5",
        description: description,
        image: Res.chair,
        info: "",
        price: "500",
        size: "23/56",
        tag: "",
        title: "Chair"));
    productList.add(Products(
        color: Colors.teal,
        count: "5",
        description: description,
        image: Res.table1,
        info: "",
        price: "500",
        size: "23/56",
        tag: "",
        title: "Reading Table"));
    return productList;
  }


}
