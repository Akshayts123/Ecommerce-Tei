import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'close.dart';

AppBar detailAppBar(product) {
  return AppBar(
    elevation: 0,
    backgroundColor: product.color,
    title: Text(
      product.title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    leading: closeActivity(),
    centerTitle: true,
    actions: const [
      Padding(
        padding: EdgeInsets.all(8),
        child:Icon(
          CupertinoIcons.cart,
          size: 30,
          color: Colors.white,
        ),
      ),
    ],
  );
}
