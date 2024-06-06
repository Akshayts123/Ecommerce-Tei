import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  List<int> _articles = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _articles.map((e) {
        return buildContainer(context);
      }).toList(),
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: Card(
          margin: EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
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
                            backgroundImage: AssetImage('assets/images/profile.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              children: [
                                Text("Sangam Shakya",style: context.textTheme.titleMedium,),
                                Text("2 months ago",style: context.textTheme.titleSmall)
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
                        child: Icon(Icons.arrow_drop_down,color: Colors.grey,),
                      ),
                    )
                  ],
                ),

                // * post text
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      "Why you need to make breaks part of your routine taking note Why you need to make breaks part of your routine taking note ",style: context.textTheme.titleSmall),
                ),

                //*
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          child: Text("❤ 123",style: context.textTheme.titleSmall),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          child: Text("💬 123",style: context.textTheme.titleSmall),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          child: Text("💨 1",style: context.textTheme.titleSmall),
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
