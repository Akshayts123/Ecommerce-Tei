

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drawers extends StatefulWidget {

   Drawers({Key? key,}) : super(key: key);

  @override
  State<Drawers> createState() => _DrawersState();
}
RxBool _isLightTheme = false.obs;
class _DrawersState extends State<Drawers> {

  @override
  void initState() {
    super.initState();
    getThemeStatus();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.backgroundColor,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.theme.primaryColor,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: context.theme.primaryColor),
              accountName: Text(
                "Akshay T S",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text("tsakshay@gmail.com"),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color(0xFFD7A1F9),
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ), //Text
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ),
          //DrawerHeader
          ListTile(
            leading:  Icon(Icons.person,color: context.theme.selectedRowColor),
            title: const Text(' My Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Obx(() {
            return ListTile(
              leading: _isLightTheme.value ? Icon(Icons.sunny,color: context.theme.selectedRowColor,): Icon(Icons.brightness_2_rounded,color: context.theme.selectedRowColor,),
              title: _isLightTheme.value ? Text('Light Mode'.tr) : Text('Dark Mode'.tr),
              trailing: Switch(
                activeColor: context.theme.primaryColor,
                value: _isLightTheme.value,
                onChanged: (val) {
                  _isLightTheme.value = val;
                  Get.changeThemeMode(
                    _isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                  );
                  _saveThemeStatus();
                },
              ),
            );
          }),
          ListTile(
            leading:  Icon(Icons.book,color: context.theme.selectedRowColor,),
            title: const Text(' My Course '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading:  Icon(Icons.workspace_premium,color: context.theme.selectedRowColor,),
            title: const Text(' Go Premium '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading:  Icon(Icons.video_label,color: context.theme.selectedRowColor,),
            title: const Text(' Saved Videos '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading:  Icon(Icons.edit,color: context.theme.selectedRowColor,),
            title: const Text(' Edit Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading:  Icon(Icons.logout,color: context.theme.selectedRowColor,),
            title: const Text('LogOut'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

_saveThemeStatus() async {
  SharedPreferences pref = await _prefs;
  pref.setBool('theme', _isLightTheme.value);
}

getThemeStatus() async {
  var _isLight = _prefs.then((SharedPreferences prefs) {
    return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
  }).obs;
  _isLightTheme.value = (await _isLight.value)!;
  Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);}