import 'package:flutter/material.dart';
import 'package:get/get.dart';

Stack buildUserImage(Size size, BuildContext context) {
  return Stack(
    children: [
      Container(
        width: size.width,
        height: 170,
        color: Colors.transparent,
        padding: EdgeInsets.only(bottom: 140 / 2.2),
        child: Container(
          width: size.width,
          height: 150,
          decoration: BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(10, 10),
                bottomRight: Radius.elliptical(10, 10)),
            // image: DecorationImage(
            //   image: NetworkImage(
            //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg8CzAfl_AEsQ9SqfH_byy8Ozh00wdGBd3tjLMOrlEmWhdLhCq&s"),
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
      ),

      // * 1 backbutton (Row widget)
      Positioned(
        top: 40 / 2,
        left: size.width /2.27,
        child: Row(
          children: [
            Text("Profile",style: Theme.of(context).textTheme.headlineLarge,)
          ],
        ),
      ),

      // * user profile image
      Positioned(
        top: 110 / 2,
        left: size.width / 2.7,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 3),
              shape: BoxShape.circle),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/profile.png')
          ),
        ),
      ),
    ],
  );
}
