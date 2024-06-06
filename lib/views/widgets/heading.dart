

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Heading extends StatelessWidget {
  String heading;
   Heading({Key? key,required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(heading,style: context.theme.textTheme.headlineSmall,),
    );
  }
}
