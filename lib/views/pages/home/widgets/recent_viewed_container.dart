

import 'package:e_commerce/models/recent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../product_details/cat_products.dart';

class RecentViewedContainer extends StatelessWidget {
  final index;
  final HomeController _coffeeController = Get.find();
   RecentViewedContainer({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Recent recent = controller.filteredProductsrecent[index];
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          padding: EdgeInsets.only(top: 10),

          height: 150,
          width: 200,
          child: Column(
            children: [
              Stack(
                children: [

                  Container(
                    padding: EdgeInsets.all(30),
                    margin:
                    EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(
                      color: _coffeeController.coloring2[index],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      recent.images[0],
                      width: 150.0,
                      height: 120.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recent.name,
                      style:
                      context.theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Lorem Ipsum is simply a dummy text of the printing ',
                      style:GoogleFonts.poppins(
                          color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),

                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${recent.price}",style:  context.theme.textTheme.headlineSmall,),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: context.theme.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 0.5, color: context.theme.selectedRowColor)),
                          child: Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
