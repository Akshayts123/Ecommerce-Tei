// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:get/get.dart';
//
// import '../../widgets/custom_image_icon.dart';
// import '../../widgets/media_query.dart';
// import '../home/home.dart';
//
// class DashboardScreen extends HookWidget {
//   DashboardScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//     final indexState = useState(0);
//     final bottomState = useState(true);
//     final controller = useScrollController();
//     final location = useState('');
//     final screens = [
//       HomeScreen(),
//       Container(),
//       Container(),
//       Container(),
//       Container(),
//     ];
//     return WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//       child: NotificationListener<OverscrollIndicatorNotification>(
//         onNotification: (overscroll) {
//           overscroll.disallowGlow();
//           return true;
//         },
//         child: Scaffold(
//           key: scaffoldKey,
//           body: AnnotatedRegion<SystemUiOverlayStyle>(
//             value: SystemUiOverlayStyle.light
//                 .copyWith(statusBarColor: context.theme.primaryColor),
//             child: screens[indexState.value],
//           ),
//           // body:
//           bottomNavigationBar: SizedBox(
//             height: 60,
//             child: BottomNavigationBar(
//               selectedFontSize: 12,
//               selectedItemColor: context.theme.primaryColor,
//               unselectedItemColor: Colors.grey,
//               type: BottomNavigationBarType.fixed,
//               currentIndex: indexState.value,
//               onTap: (e) {
//                 indexState.value = e;
//                 if (controller.position.pixels != 0.0) {
//                   controller.animateTo(
//                     0.0,
//                     duration: Duration(seconds: 1),
//                     curve: Curves.easeIn,
//                   );
//                 }
//               },
//               showUnselectedLabels: true,
//               showSelectedLabels: true,
//               items: [
//                 BottomNavigationBarItem(
//                   label: "Home",
//                   tooltip: "Home",
//                   icon: iconAssetImage(
//                     'assets/images/home_inactive.svg',
//                     null,
//                     Colors.grey,
//                   ),
//                   activeIcon: iconAssetImage(
//                     'assets/images/home_active.svg',
//                     null,
//                     context.theme.primaryColor,
//                   ),
//                 ),
//                 BottomNavigationBarItem(
//                   label: "Category",
//                   icon: iconAssetImage(
//                     'assets/images/categories_inactive.svg',
//                     null,
//                     Colors.grey,
//                   ),
//                   activeIcon: iconAssetImage(
//                     'assets/images/categories_active.svg',
//                     null,
//                     context.theme.primaryColor,
//                   ),
//                 ),
//                 BottomNavigationBarItem(
//                   label: "Cart",
//                   icon: iconAssetImage(
//                     'assets/images/bag_inactive.svg',
//                     35,
//                   ),
//                   activeIcon: iconAssetImage('assets/images/bag_active.svg', 35,
//                       context.theme.primaryColor),
//                 ),
//                 BottomNavigationBarItem(
//                   label: "Favorite",
//                   icon: iconAssetImage(
//                     'assets/images/hear_inactive.svg',
//                     null,
//                     Colors.grey,
//                   ),
//                   activeIcon: iconAssetImage(
//                     'assets/images/hear_active.svg',
//                     null,
//                     context.theme.primaryColor,
//                   ),
//                 ),
//                 BottomNavigationBarItem(
//                   label: "Personal",
//                   icon: iconAssetImage(
//                     'assets/images/profile_inactive.svg',
//                     null,
//                     Colors.grey,
//                   ),
//                   activeIcon: iconAssetImage(
//                     'assets/images/profile_active.svg',
//                     null,
//                     context.theme.primaryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import '../../../consts/app_data.dart';
import '../../../controller/product_controller.dart';
import '../cart/cart_screen.dart';
import '../favorite/favorite_screen.dart';
import '../home/drawer.dart';
import '../home/home.dart';
import '../home/widgets/carousel_slider.dart';
import '../profile/pages/profile_Screen.dart';



final ProductController controller = Get.put(ProductController());

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  static  List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    Profile(),

  ];

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
      overscroll.disallowGlow();
      return true;
    },
    child:Scaffold(

      bottomNavigationBar: Obx(
            () {
          return BottomNavyBar(
            backgroundColor: context.theme.cardColor,
            itemCornerRadius: 10,
            selectedIndex: controller.currentBottomNavItemIndex.value,
            items: AppData.bottomNavyBarItems
                .map((item) => BottomNavyBarItem(
                icon: item.icon,
                title: Text(item.title),
                activeColor: item.activeColor,
                inactiveColor: item.inActiveColor))
                .toList(),
            onItemSelected: controller.switchBetweenBottomNavigationItems,
          );
        },
      ),
      body: Obx(() {
        return PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: screens[controller.currentBottomNavItemIndex.value],
        );
      }),
    ),),);
  }
}
