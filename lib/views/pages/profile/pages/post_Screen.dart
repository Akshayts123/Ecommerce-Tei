import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List _images = [
    1,
    2,
    3,
  ];
  final List postImages = [
    "assets/images/post1.jpg",
    "assets/images/post2.jpg",
    "assets/images/post3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 0, top: 0),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) =>
            buildPost(context, index),
      ),
    );
  }

  Container buildPost(BuildContext context, index) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        margin: EdgeInsets.all(0.0),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            children: [
                              Text(
                                "Sangam Shakya",
                                style: context.textTheme.titleMedium,
                              ),
                              Text("2 months ago",
                                  style: context.textTheme.titleSmall)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            value: "delete",
                            child: Text("Delete Post"),
                          ),
                          PopupMenuItem(
                            value: "save",
                            child: Text("Save Post"),
                          ),
                        ];
                      },
                      child: Icon(Icons.arrow_drop_down, color: Colors.grey),
                    ),
                  )
                ],
              ),

              // * post text
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                    "Why you need to make breaks part of your routine taking note Why you need to make breaks part of your routine taking note ",
                    style: context.textTheme.titleSmall),
              ),

              //*
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Card(
                  elevation: 0,
                  semanticContainer: false,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    postImages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //*
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child:
                            Text("❤ 123", style: context.textTheme.titleSmall),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child:
                            Text("💬 123", style: context.textTheme.titleSmall),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child:
                            Text("💨 1", style: context.textTheme.titleSmall),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
