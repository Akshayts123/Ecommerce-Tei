import 'package:e_commerce/models/product_size_type.dart';



class   Recent {
  String name;
  int price;
  String about;
  String? description;
  bool isAvailable;
  int quantity;
  ProductSizeType? sizes;
  List<String> images;
  bool isLiked;
  double rating;

  Recent(
      {required this.name,
        this.description,
        this.sizes,
        required this.isAvailable,
        required this.quantity,
        required this.price,
        required this.about,
        required this.images,
        required this.isLiked,
        required this.rating,
      });
}
