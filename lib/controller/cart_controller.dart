
import 'package:e_commerce/models/category.dart';
import 'package:get/get.dart';

import '../models/product.dart';

class   CartController extends GetxController{
  var numofitems = 1.obs;
  var totalqty = 0.obs;
  var cartitems = <Categorys>[].obs;
  var cartitemsproduct = <Product>[].obs;

  void removeitems(){
    if(numofitems.value > 1){
      numofitems.value --;
    }
  }
  void additem(){
    numofitems.value++;
  }

  void additemincart(Categorys cats) {
    cartitems.add(cats);
    totalqty.value =totalqty.value + numofitems.value;
    numofitems.value = 1;
  }
  void additemincartproduct(Product product) {
    cartitemsproduct.add(product);
    totalqty.value =totalqty.value + numofitems.value;
    numofitems.value = 1;
  }
}