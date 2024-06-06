

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'heading.dart';

class Header extends StatelessWidget {
  String headername;
   Header({Key? key, required this.headername}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Heading(
            heading: headername,
          ),
          Text(
            'See All',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          )
        ],
      ),
    );
  }
}
