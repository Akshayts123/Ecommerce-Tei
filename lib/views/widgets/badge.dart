

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/home_controller.dart';

class Badge extends StatefulWidget {
  const Badge({Key? key}) : super(key: key);

  @override
  State<Badge> createState() => _BadgeState();
}

class _BadgeState extends State<Badge> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  counter = 0;
                });
              }),
        ),
        counter != 0
            ? new Positioned(
          right: 15,
          top: 11,
          child: new Container(
            padding: EdgeInsets.all(2),
            decoration: new BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Text(
              '$counter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
            : new Container()
      ],
    );
  }
}
