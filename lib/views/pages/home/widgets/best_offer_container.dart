import 'package:e_commerce/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../models/product.dart';

import '../../dashboard/dashboard.dart';

class BestOfferContainer extends StatelessWidget {
  final index;
  final HomeController _coffeeController = Get.find();
  BestOfferContainer({Key? key, required this.index}) : super(key: key);

  Widget _gridimage(Categorys categorys) {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(
        right: 0,
      ),
      decoration: BoxDecoration(
        color: _coffeeController.coloring[index],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image.asset(
        categorys.images[0],
        width: 150.0,
        height: 100.0,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Categorys cats = controller.filteredProductscat[index];
    return Container(
      height: 170,
      width: 180,
      padding: EdgeInsets.only(left: 0, top: 10),
      child: Column(
        children: [
          Stack(
            children: [
              _gridimage(cats),
              Positioned(
                  top: 135,
                  left: 10,
                  child: Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Free Shipping ",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    )),
                  )),

            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10,right: 10,left: 5,bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cats.name,
                      style: context.theme.textTheme.titleMedium,
                    ),
                    Text(
                      "\$${cats.price}",
                      style: context.theme.textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  cats.about,
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
