import 'package:e_commerce/views/pages/profile/pages/post_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../widgets/user_activity_info.dart';
import '../widgets/user_info_widget.dart';
import '../widgets/user_profile_image.dart';
import 'articles_Screen.dart';
import 'gallery_Screen.dart';

class Profile extends StatefulWidget {
  Profile({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedEvent = 0;

  List<Widget> _pages = [GalleryScreen(), PostScreen(), ArticlesScreen()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildUserImage(size,context),

              // * 3 user Name
              buildUserInfo(),

              //* 4 total no. of posts, followers, following (Row Widget)
              buildUserActivity(),

              // * 5 follow and message button (Row widget)
              buildUserEvents(size),

              // *
              _pages[_selectedEvent],
            ],
          ),
        ),
      ),
    );
  }

  

  Container buildUserEvents(Size size) {
    return Container(
      // color: Colors.grey.shade100,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: context.theme.primaryColor)),
                color:
                    _selectedEvent == 0 ?context.theme.primaryColor : context.theme.cardColor,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 0;
                  });
                },
                child: Text("Gallery",
                    style: TextStyle(
                      color: _selectedEvent == 0
                          ? Colors.white
                          : context.theme.primaryColor
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: context.theme.primaryColor)),
                color:
                    _selectedEvent == 1 ? context.theme.primaryColor : context.theme.cardColor,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 1;
                  });
                },
                child: Text("Posts",
                    style: TextStyle(
                      color: _selectedEvent == 1
                          ? Colors.white
                          : context.theme.primaryColor,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: context.theme.primaryColor)),
                color:
                    _selectedEvent == 2 ? context.theme.primaryColor : context.theme.cardColor,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 2;
                  });
                },
                child: Text("Articles",
                    style: TextStyle(
                      color: _selectedEvent == 2
                          ? Colors.white
                          : context.theme.primaryColor,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
