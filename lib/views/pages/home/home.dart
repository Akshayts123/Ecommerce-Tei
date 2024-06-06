import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/views/pages/home/widgets/best_offer_container.dart';
import 'package:e_commerce/views/pages/home/widgets/best_offers.dart';
import 'package:e_commerce/views/pages/home/widgets/carousel_slider.dart';
import 'package:e_commerce/views/pages/home/widgets/product_category.dart';
import 'package:e_commerce/views/pages/home/widgets/recent_viewed.dart';
import 'package:e_commerce/views/pages/home/widgets/recent_viewed_container.dart';
import 'package:e_commerce/views/pages/home/widgets/slide_tab.dart';
import 'package:e_commerce/views/pages/home/widgets/slide_tab_container.dart';
import 'package:e_commerce/views/pages/home/widgets/slide_tab_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../consts/res.dart';
import '../../../models/recent.dart';
import '../../../services/location_service.dart';
import '../../product_details/cat_products.dart';
import '../../widgets/dialog_loading.dart';
import '../../widgets/header.dart';
import '../../widgets/heading.dart';
import '../../widgets/media_query.dart';
import '../../widgets/product_grid_view.dart';
import '../../widgets/search_filter.dart';
import '../../widgets/snackbar.dart';
import "../home/body.dart";
import 'drawer.dart';

class HomeScreen extends HookWidget {
  final HomeController _coffeeController = Get.find();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
    final indexState = useState(0);
    final location = useState('');
    var products = Res.fetchProducts();
    ScrollController _scrollController = ScrollController();
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      key: _key,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: context.theme.primaryColor,
            leading: IconButton(
              onPressed: () {
                _key.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            pinned: true,
            title: InkWell(
              onTap: () async {
                customDialogueLoading(context);
                final loc = await determinePosition();
                if (loc == null) {
                  showSnackBar(
                    context,
                    "Please provide location to help with better user experience.",
                  );
                  Navigator.pop(context);
                  return;
                }
                Navigator.pop(context);
                location.value = loc ?? '';
              },
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    location.value == '' ? 'No location' : location.value,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, NotificationScreen.routeName);
                  print('notification');
                },
                child: Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      Positioned(
                        top: -4,
                        left: -4,
                        child: Container(
                          padding: const EdgeInsets.all(
                            2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                            color: Colors.red,
                          ),
                          child: Text(
                            '10',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
            // floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: indexState.value != 0
                  ? null
                  : Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          // context.theme.backgroundColor,
                          // context.theme.backgroundColor,
                          Colors.orange,
                          Colors.red,
                        ],
                      )),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 90,
                          ),
                          buildSearchRow(),
                        ],
                      ),
                    ),
            ),
            expandedHeight: indexState.value != 0 ? null : 140,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              // every time calling initState when come and out of viewport
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SlideTabContainer(),
                    PrefetchImageDemo(),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 10),
                      height: 180,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 10,),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          Recent recent =
                              controller.filteredProductsrecent[index];
                          return Container(
                           decoration: BoxDecoration(
                               color: context.theme.dividerColor,
                             borderRadius: BorderRadius.circular(10)
                           ),
                            margin: EdgeInsets.only(right: 10),
                            height: 175,
                            width: 177,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 53,
                                  child: Container(
                                    height: 20,
                                    width: 70,
                                    color: context.theme.primaryColor,
                                    child: Center(
                                        child: Text(
                                      "NEW",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                ),
                                Positioned(
                                  top:40,
                                  left: 25,
                                  child: Center(
                                    child: Container(
                                      child: Image.asset(
                                          "assets/images/recent1.png",
                                          fit: BoxFit.cover,
                                          height: 120,
                                          width: 120),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Header(
                      headername: 'Hot Sales',
                    ),
                    SizedBox(
                      height: 140,
                      child: detailBody(products, context),
                    ),
                    Header(
                      headername: 'Best Offers',
                    ),
                    BestOffers(),
                    Header(
                      headername: 'Recently Viewed',
                    ),
                    RecentViewed(),
                    Header(
                      headername: 'Categories',
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ProductGridView()),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
      drawer: Drawers(),
    );
  }
}
