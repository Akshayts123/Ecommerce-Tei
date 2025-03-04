import 'package:e_commerce/models/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/bottom_navy_bar_item.dart';
import '../models/categorical.dart';
import '../models/numerical.dart';
import '../models/product.dart';
import '../models/product_category.dart';
import '../models/product_size_type.dart';
import '../models/recent.dart';
import '../models/recommended_product.dart';

class AppData {
  const AppData._();

  static String dummyText =
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      ' industry. Lorem Ipsum has been the industry\'s standard dummy text'
      ' ever since the 1500s, when an unknown printer took a galley of type'
      ' and scrambled it to make a type specimen book.';
  static List<Recent> recent = [
    Recent(
      name: 'Laptop Hp risen 4',
      price: 20,
      description: dummyText,
      about: 'Lorem Ipsum is simply dummy text of the printing',
      images: ["assets/images/recent1.png","assets/images/chair1.png","assets/images/chair2.png"],
      isLiked: true,
      rating: 1,
      isAvailable: true,
      quantity: 0,
    ),
    Recent(
        name: 'Apple iphone 14 pro max ',
        price: 200,
        description: dummyText,
        about: 'Lorem Ipsum is simply dummy text of the printing',
        images: ["assets/images/recent2.png","assets/images/lamp1.png","assets/images/lamp2.png",],
        isLiked: true,
        isAvailable: true,
        quantity: 0,
        rating: 1),
    Recent(
        name: 'BSA turbodrive sprint bike ',
        price: 200,
        description: dummyText,
        about: 'Lorem Ipsum is simply dummy text of the printing',
        images: ["assets/images/recent3.png","assets/images/sofa1.png","assets/images/sofa2.png"],
        isLiked: true,
        isAvailable: true,
        quantity: 0,
        rating: 1),
    Recent(
        name: 'scoda rapid ',
        price: 200,
        description: dummyText,
        about: 'Lorem Ipsum is simply dummy text of the printing',
        images: ["assets/images/recent4.png","assets/images/table1.png","assets/images/table2.png"],
        isLiked: true,
        isAvailable: true,
        quantity: 0,
        rating: 1),
    Recent(
        name: 'AGV headphone ',
        price: 200,
        description: dummyText,
        about: 'Lorem Ipsum is simply dummy text of the printing',
        images: ["assets/images/recent5.png","assets/images/dining1.png","assets/images/dining2.png"],
        isLiked: true,
        isAvailable: true,
        quantity: 0,
        rating: 1),
  ];

  static List<Categorys> cat = [
    Categorys(
        name: 'Chair',
        price: 200,
        description: dummyText,
        about: 'Lorem Ipsum is simply dummy text of the printing',
        images: ["assets/images/chair.png","assets/images/chair1.png","assets/images/chair2.png"],
        isLiked: true,
        rating: 1,
        isAvailable: true,
        quantity: 0,
    ),
    Categorys(
        name: 'Car',
        price: 200,
        description: dummyText,
        about: 'Lorem Ipsum is simply dummy text of the printing',
        images: ["assets/images/lamp.png","assets/images/lamp1.png","assets/images/lamp2.png",],
        isLiked: true,
        isAvailable: true,
        quantity: 0,
        rating: 1),
    Categorys(
        name: 'Table',
        price: 200,
        description: dummyText,
        about: 'Lorem Ipsum is simply dummy text of the printing',
        images: ["assets/images/sofa.png","assets/images/sofa1.png","assets/images/sofa2.png"],
        isLiked: true,
        isAvailable: true,
        quantity: 0,
        rating: 1),
    Categorys(
        name: 'Lamp',
        price: 200,
        description: dummyText,
        about: 'Lorem Ipsum is simply dummy text of the printing',
        images: ["assets/images/table.png","assets/images/table1.png","assets/images/table2.png"],
        isLiked: true,
        isAvailable: true,
        quantity: 0,
        rating: 1),
    Categorys(
        name: 'Sofa',
        price: 200,
        description: dummyText,
        about: 'Lorem Ipsum is simply dummy text of the printing',
        images: ["assets/images/table_1.png","assets/images/dining1.png","assets/images/dining2.png"],
        isLiked: true,
        isAvailable: true,
        quantity: 0,
        rating: 1),
  ];
  static List<Product> products = [
    Product(
        name: 'Samsung Galaxy A53 5G',
        price: 460,
        about: dummyText,
        isAvailable: true,
        off: 300,
        quantity: 0,
        images: [
          'assets/images/a53_1.png',
          'assets/images/a53_2.png',
          'assets/images/a53_3.png'
        ],
        isLiked: true,
        rating: 1,
        type: ProductType.mobile),
    Product(
        name: 'Samsung Galaxy Tab S7 FE',
        price: 380,
        about: dummyText,
        isAvailable: false,
        off: 220,
        quantity: 0,
        images: [
          'assets/images/tab_s7_fe_1.png',
          'assets/images/tab_s7_fe_2.png',
          'assets/images/tab_s7_fe_3.png'
        ],
        isLiked: false,
        rating: 4,
        type: ProductType.tablet),
    Product(
        name: 'Samsung Galaxy Tab S8+',
        price: 650,
        about: dummyText,
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'assets/images/tab_s8_1.png',
          'assets/images/tab_s8_2.png',
          'assets/images/tab_s8_3.png',
        ],
        isLiked: false,
        rating: 3,
        type: ProductType.tablet),
    Product(
        name: 'Samsung Galaxy Watch 4',
        price: 229,
        about: dummyText,
        isAvailable: true,
        off: 200,
        quantity: 0,
        images: [
          'assets/images/galaxy_watch_4_1.png',
          'assets/images/galaxy_watch_4_2.png',
          'assets/images/galaxy_watch_4_3.png',
        ],
        isLiked: false,
        rating: 5,
        sizes: ProductSizeType(categorical: [
          Categorical(CategoricalType.small, true),
          Categorical(CategoricalType.medium, false),
          Categorical(CategoricalType.large, false),
        ]),
        type: ProductType.watch),
    Product(
        name: 'Apple Watch 7',
        price: 330,
        about: dummyText,
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'assets/images/apple_watch_series_7_1.png',
          'assets/images/apple_watch_series_7_2.png',
          'assets/images/apple_watch_series_7_3.png',
        ],
        isLiked: false,
        rating: 4,
        sizes: ProductSizeType(
            numerical: [Numerical('41', true), Numerical('45', false)]),
        type: ProductType.watch),
    Product(
        name: 'Beats studio 3',
        price: 230,
        about: dummyText,
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'assets/images/beats_studio_3-1.png',
          'assets/images/beats_studio_3-2.png',
          'assets/images/beats_studio_3-3.png',
          'assets/images/beats_studio_3-4.png',
        ],
        isLiked: false,
        rating: 2,
        type: ProductType.headphone),
    Product(
        name: 'Samsung Q60 A',
        price: 497,
        about: dummyText,
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'assets/images/samsung_q_60_a_1.png',
          'assets/images/samsung_q_60_a_2.png',
        ],
        isLiked: false,
        rating: 3,
        sizes: ProductSizeType(numerical: [
          Numerical('43', true),
          Numerical('50', false),
          Numerical('55', false)
        ]),
        type: ProductType.tv),
    Product(
        name: 'Sony x 80 J',
        price: 498,
        about: dummyText,
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'assets/images/sony_x_80_j_1.png',
          'assets/images/sony_x_80_j_2.png',
        ],
        isLiked: false,
        sizes: ProductSizeType(numerical: [
          Numerical('50', true),
          Numerical('65', false),
          Numerical('85', false)
        ]),
        rating: 2,
        type: ProductType.tv),
  ];

  static List<ProductCategory> categories = [
    ProductCategory(ProductType.all, true, Icons.all_inclusive),
    ProductCategory(
        ProductType.mobile, false, FontAwesomeIcons.mobileScreenButton),
    ProductCategory(ProductType.watch, false, Icons.watch),
    ProductCategory(ProductType.tablet, false, FontAwesomeIcons.tablet),
    ProductCategory(ProductType.headphone, false, Icons.headphones),
    ProductCategory(ProductType.tv, false, Icons.tv),
  ];

  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];

  static List<BottomNavyBarItem> bottomNavyBarItems = [
    BottomNavyBarItem(
        "Home", const Icon(Icons.home), Color(0xFFEC6813), Colors.grey),
    BottomNavyBarItem("Favorite", const Icon(Icons.favorite),
        const Color(0xFFEC6813), Colors.grey),
    BottomNavyBarItem("Cart", const Icon(Icons.shopping_cart),
        const Color(0xFFEC6813), Colors.grey),
    BottomNavyBarItem("Profile", const Icon(Icons.person),
        const Color(0xFFEC6813), Colors.grey),
  ];

  static List<RecommendedProduct> recommendedProducts = [
    RecommendedProduct(
        imagePath: "", cardBackgroundColor: const Color(0xFFEC6813)),
    RecommendedProduct(
        imagePath: "",
        cardBackgroundColor: const Color(0xFF3081E1),
        buttonBackgroundColor: const Color(0xFF9C46FF),
    ),
  ];
}
