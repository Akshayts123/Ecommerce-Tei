import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<String> _list = ["travel", "holiday", "feel"];

  Map<String, String> _likes = {
    "travel": "123",
    "holiday": "124",
    "feel": "12"
  };

  Map<String, String> _images = {
    "travel":
        "assets/images/z1.jpg",
    "holiday":
    "assets/images/z2.jpg",
    "feel":
    "assets/images/z3.jpg",

  };

  Map<String, String> _comments = {
    "travel": "12",
    "holiday": "23",
    "feel": "32"
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _list.map((e) {
        return buildGallery(context, e);
      }).toList(),
    );
  }

  InkWell buildGallery(BuildContext context, String e) {
    return InkWell(
        onLongPress: () {
          buildShowDialog(context, e);
        },
        child: Container(
          padding: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width / 2,
          // height: MediaQuery.of(context).size.width / 2.5,
          child: Card(
            elevation: 0,
            semanticContainer: false,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              _images[e]!,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
  }

  Future buildShowDialog(BuildContext context, String e) {
    return showDialog(
            context: context,
             builder: (BuildContext context) {return WillPopScope(
               onWillPop: () async => true,
               child: AlertDialog(
                 title: Card(

                   elevation: 0,
                   semanticContainer: false,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(8)),
                   clipBehavior: Clip.antiAliasWithSaveLayer,
                   child: Container(
                     height: 200,
                     child: Image.asset(
                       _images[e]!,
                       height: 200,

                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
                 content: Row(
                   children: [
                     InkWell(
                       onTap: () {},
                       child: Container(
                         child: Row(
                           children: [
                             Text("❤"),
                             Text(_likes[e]!,
                                 style: TextStyle(color: Colors.black87)),
                           ],
                         ),
                       ),
                     ),
                     SizedBox(
                       width: 5,
                     ),
                     InkWell(
                       onTap: (){},
                       child: Container(
                         child: Row(
                           children: [
                             Text("💬"),
                             Text(_comments[e]!,
                                 style: TextStyle(color: Colors.black87)),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ); },
          );
  }
}
