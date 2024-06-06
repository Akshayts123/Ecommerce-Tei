import 'package:e_commerce/consts/extensions.dart';
import 'package:e_commerce/models/category.dart';
import 'package:e_commerce/views/pages/cart/cart_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/product_controller.dart';
import '../../models/product.dart';
import '../widgets/snackbar.dart';

final ProductController controller = Get.put(ProductController());

class CatProducts extends StatefulWidget {
  final Categorys cats;

  CatProducts(this.cats, {Key? key}) : super(key: key);

  @override
  State<CatProducts> createState() => _CatProductsState();
}

class _CatProductsState extends State<CatProducts> {
  int counter = 0;

  final PageController _pageController = PageController(initialPage: 0);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          controller.productImageDefaultIndex.value = 0;
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      actions: <Widget>[
        new Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.to(CartScreen());
                    setState(() {
                      counter = 0;
                    });
                  }),
            ),
            counter != 0
                ? new Positioned(
                    right: 15,
                    top: 11,
                    child: new Container(
                      padding: EdgeInsets.all(2),
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 17,
                        minHeight: 17,
                      ),
                      child: Text(
                        '$counter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : new Container()
          ],
        ),
      ],
    );
  }

  Widget productPageView(double width, double height, context) {
    return Container(
      height: height * 0.42,
      width: width,
      decoration: const BoxDecoration(
        color: Color(0xFFE5E6E8),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.32,
            child: PageView.builder(
              itemCount: widget.cats.images.length,
              controller: _pageController,
              onPageChanged: controller.switchBetweenProductImages,
              itemBuilder: (_, index) {
                return FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset(widget.cats.images[index],
                      fit: BoxFit.contain, scale: 3),
                );
              },
            ),
          ),
          Obx(
            () => SmoothIndicator(
              effect: WormEffect(
                  dotColor: Colors.white,
                  activeDotColor: Theme.of(context).primaryColor),
              offset: controller.productImageDefaultIndex.value.toDouble(),
              count: widget.cats.images.length,
            ),
          )
        ],
      ),
    );
  }

  Widget _ratingBar(BuildContext context) {
    return Wrap(
      spacing: 30,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: widget.cats.rating,
          direction: Axis.horizontal,
          itemSize: 30,
          itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: (_) {},
        ),
        Text(
          "(4500 Reviews)",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w300),
        )
      ],
    );
  }

  Widget productSizesListView(context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.sizeTypecat(widget.cats).length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () =>
              controller.switchBetweenProductSizescat(widget.cats, index),
          child: Container(
            margin: const EdgeInsets.only(right: 5, left: 5),
            alignment: Alignment.center,
            width: controller.isNominalcat(widget.cats) ? 40 : 70,
            decoration: BoxDecoration(
              color:
                  controller.sizeTypecat(widget.cats)[index].isSelected == false
                      ? Colors.white
                      : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 0.4),
            ),
            child: FittedBox(
              child: Text(
                controller.sizeTypecat(widget.cats)[index].numerical,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productPageView(width, height, context),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cats.name,
                      style: context.theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 10),
                    _ratingBar(context),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "\$${widget.cats.price}",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          "\$${widget.cats.price}",
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          widget.cats.isAvailable
                              ? "Available in stock"
                              : "Not available",
                          style: context.textTheme.titleSmall,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "About",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.cats.description ?? "",
                      style: context.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      child: GetBuilder<ProductController>(
                        builder: (_) => productSizesListView(context),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: context.theme.primaryColor,
                  textStyle: context.theme.textTheme.headlineSmall),
              onPressed: widget.cats.isAvailable
                  ? () {
                      showSnackBar(context, 'Successfully added to cart');
                      controller.addToCartcat(widget.cats);
                      setState(() {
                        counter++;
                      });
                    }
                  : null,
              child: const Text("Add to cart"),
            ),
          ),
        ),
      ),
    );
  }
}
