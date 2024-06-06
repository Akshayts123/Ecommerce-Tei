import 'package:e_commerce/consts/extensions.dart';
import 'package:e_commerce/models/category.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../consts/app_data.dart';
import '../models/numerical.dart';
import '../models/product.dart';
import '../models/product_category.dart';
import '../models/product_size_type.dart';
import '../models/recent.dart';
import 'home_controller.dart';

class ProductController extends GetxController {
  RxList<Product> allProducts = AppData.products.obs;
  RxList<Product> filteredProducts = AppData.products.obs;
  RxList<Categorys> allProductscat = AppData.cat.obs;
  RxList<Categorys> filteredProductscat = AppData.cat.obs;
  RxList<Recent> allProductsrecent = AppData.recent.obs;
  RxList<Recent> filteredProductsrecent = AppData.recent.obs;
  RxList<Product> cartProducts = <Product>[].obs;
  RxList<Categorys> cartProductscat = <Categorys>[].obs;
  RxList<Recent> cartProductsrecent = <Recent>[].obs;
  RxList<ProductCategory> categories = AppData.categories.obs;
  int length = ProductType.values.length;
  RxDouble totalPrice = 0.0.obs;
  RxInt currentBottomNavItemIndex = 0.obs;
  RxInt productImageDefaultIndex = 0.obs;

  void filterItemsByCategory(int index) {
    for (ProductCategory element in categories) {
      element.isSelected = false;
    }
    categories[index].isSelected = true;

    if (categories[index].type == ProductType.all) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(allProducts.where((item) {
        return item.type == categories[index].type;
      }).toList());

    }
    if (categories[index].type == ProductType.all) {
      filteredProductscat.assignAll(allProductscat);
    }


  }

  void isLiked(int index) {
    filteredProducts[index].isLiked = !filteredProducts[index].isLiked;
    filteredProductscat[index].isLiked = !filteredProductscat[index].isLiked;
    filteredProductsrecent[index].isLiked = !filteredProductsrecent[index].isLiked;
    filteredProducts.refresh();
    filteredProductscat.refresh();
    filteredProductsrecent.refresh();
  }

  void addToCart(Product product,) {
    product.quantity++;
    cartProducts.add(product);
    cartProducts.assignAll(cartProducts.distinctBy((item) => item));
    calculateTotalPrice();
  }
  void addToCartcat(Categorys cats) {
    cats.quantity++;
    cartProductscat.add(cats);
    cartProductscat.assignAll(cartProductscat.distinctBy((item) => item));
    calculateTotalPrice();
  }
  void addToCartrecent(Recent recent) {
    recent.quantity++;
    cartProductsrecent.add(recent);
    cartProductsrecent.assignAll(cartProductsrecent.distinctBy((item) => item));
    calculateTotalPrice();
  }

  void increaseItem(int index) {
    Product product = cartProducts[index];
    product.quantity++;
    calculateTotalPrice();
    update();
  }
  void increaseItemcat(int index) {
    Categorys cats = cartProductscat[index];
    cats.quantity++;
    calculateTotalPrice();
    update();
  }
  void increaseItemrecent(int index) {
    Recent recent = cartProductsrecent[index];
    recent.quantity++;
    calculateTotalPrice();
    update();
  }
  bool get isZeroQuantity2 {
    return cartProductsrecent.any(
          (element) {
        return element.price.compareTo(0) == 0 ? true : false;

      },
    );

  }
  bool get isZeroQuantity {
    return cartProductscat.any(
      (element) {
        return element.price.compareTo(0) == 0 ? true : false;

      },
    );

  }
  bool get isZeroQuantity1 {
    return cartProducts.any(
          (element) {
        return element.price.compareTo(0) == 0 ? true : false;

      },
    );

  }

  bool isPriceOff(Product product) {
    if (product.off != null) {
      return true;
    } else {
      return false;
    }
  }
  // bool isPriceOffcat(Categorys cats) {
  //   // if (cats.off != null) {
  //   //   return true;
  //   // } else {
  //   //   return false;
  //   // }
  // }

  bool get isEmptyCart {
    if (cartProductsrecent.isEmpty && isZeroQuantity2 && cartProductscat.isEmpty && isZeroQuantity && cartProducts.isEmpty && isZeroQuantity1 ) {
      return true;
    }
   else {
      return false;
    }
  }

  bool isNominal(Product product) {
    if (product.sizes?.numerical != null) {
      return true;
    } else {
      return false;
    }
  }
  bool isNominalcat(Categorys cats) {
    if (cats.sizes?.numerical != null) {
      return true;
    } else {
      return false;
    }
  }

  void decreaseItem(int index) {
    Product product = cartProducts[index];
    if (product.quantity > 0) {
      product.quantity--;
    }



    calculateTotalPrice();
    update();
  }
  void decreaseItemcat(int index) {
    Categorys cats = cartProductscat[index];
    if (cats.quantity > 0) {
      cats.quantity--;
    }
    calculateTotalPrice();
    update();
  }
  void decreaseItemrecent(int index) {
    Recent recent = cartProductsrecent[index];
    if (recent.quantity > 0) {
      recent.quantity--;
    }
    calculateTotalPrice();
    update();
  }

  void calculateTotalPrice() {
    totalPrice.value = 0;
    for (var element in cartProducts) {
      if (isPriceOff(element)) {
        totalPrice.value += element.quantity * element.off!;
      } else {
        totalPrice.value += element.quantity * element.price;
      }
    }
    for (var element in cartProductscat) {
      totalPrice.value += element.quantity * element.price;
    }
    for (var element in cartProductsrecent) {
      totalPrice.value += element.quantity * element.price;
    }
  }

  void switchBetweenBottomNavigationItems(int index) {
    switch (index) {
      case 0:
        filteredProducts.assignAll(allProducts);
        break;
      case 1:
        getLikedItems();
        break;
      case 2:
        cartProducts.assignAll(allProducts.where((item) => item.quantity > 0));
        cartProductscat.assignAll(allProductscat.where((item) => item.quantity > 0));
        cartProductsrecent.assignAll(allProductsrecent .where((item) => item.quantity > 0));
    }
    currentBottomNavItemIndex.value = index;
  }

  void switchBetweenProductImages(int index) {
    productImageDefaultIndex.value = index;
  }

  void getLikedItems() {
    filteredProducts.assignAll(allProducts.where((item) => item.isLiked));
  }

  List<Numerical> sizeType(Product product) {
    ProductSizeType? productSize = product.sizes;
    List<Numerical> numericalList = [];

    if (productSize?.numerical != null) {
      for (var element in productSize!.numerical!) {
        numericalList.add(Numerical(element.numerical, element.isSelected));
      }
    }

    if (productSize?.categorical != null) {
      for (var element in productSize!.categorical!) {
        numericalList
            .add(Numerical(element.categorical.name, element.isSelected));
      }
    }

    return numericalList;
  }
  List<Numerical> sizeTypecat(Categorys cats) {
    ProductSizeType? productSize = cats.sizes;
    List<Numerical> numericalList = [];

    if (productSize?.numerical != null) {
      for (var element in productSize!.numerical!) {
        numericalList.add(Numerical(element.numerical, element.isSelected));
      }
    }

    if (productSize?.categorical != null) {
      for (var element in productSize!.categorical!) {
        numericalList
            .add(Numerical(element.categorical.name, element.isSelected));
      }
    }

    return numericalList;
  }
  List<Numerical> sizeTyperecent(Recent recent) {
    ProductSizeType? productSize = recent.sizes;
    List<Numerical> numericalList = [];

    if (productSize?.numerical != null) {
      for (var element in productSize!.numerical!) {
        numericalList.add(Numerical(element.numerical, element.isSelected));
      }
    }

    if (productSize?.categorical != null) {
      for (var element in productSize!.categorical!) {
        numericalList
            .add(Numerical(element.categorical.name, element.isSelected));
      }
    }

    return numericalList;
  }

  void switchBetweenProductSizes(Product product, int index) {
    sizeType(product).forEach((element) {
      element.isSelected = false;
    });

    if (product.sizes?.categorical != null) {
      for (var element in product.sizes!.categorical!) {
        element.isSelected = false;
      }

      product.sizes?.categorical![index].isSelected = true;
    }

    if (product.sizes?.numerical != null) {
      for (var element in product.sizes!.numerical!) {
        element.isSelected = false;
      }

      product.sizes?.numerical![index].isSelected = true;
    }

    update();
  }
  void switchBetweenProductSizescat(Categorys cats, int index) {
    sizeTypecat(cats).forEach((element) {
      element.isSelected = false;
    });

    if (cats.sizes?.categorical != null) {
      for (var element in cats.sizes!.categorical!) {
        element.isSelected = false;
      }

      cats.sizes?.categorical![index].isSelected = true;
    }

    if (cats.sizes?.numerical != null) {
      for (var element in cats.sizes!.numerical!) {
        element.isSelected = false;
      }

      cats.sizes?.numerical![index].isSelected = true;
    }

    update();
  }
  void switchBetweenProductSizesrecent(Recent recent, int index) {
    sizeTyperecent(recent).forEach((element) {
      element.isSelected = false;
    });

    if (recent.sizes?.categorical != null) {
      for (var element in recent.sizes!.categorical!) {
        element.isSelected = false;
      }

      recent.sizes?.categorical![index].isSelected = true;
    }

    if (recent.sizes?.numerical != null) {
      for (var element in recent.sizes!.numerical!) {
        element.isSelected = false;
      }

      recent.sizes?.numerical![index].isSelected = true;
    }

    update();
  }

  String getCurrentSize(Product product) {
    String currentSize = "";
    if (product.sizes?.categorical != null) {
      for (var element in product.sizes!.categorical!) {
        if (element.isSelected) {
          currentSize = "Size: ${element.categorical.name}";
        }
      }
    }


    if (product.sizes?.numerical != null) {
      for (var element in product.sizes!.numerical!) {
        if (element.isSelected) {
          currentSize = "Size: ${element.numerical}";
        }
      }
    }
    return currentSize;
  }
  String getCurrentSizecat(Categorys cats) {
    String currentSize = "";
    if (cats.sizes?.categorical != null) {
      for (var element in cats.sizes!.categorical!) {
        if (element.isSelected) {
          currentSize = "Size: ${element.categorical.name}";
        }
      }
    }


    if (cats.sizes?.numerical != null) {
      for (var element in cats.sizes!.numerical!) {
        if (element.isSelected) {
          currentSize = "Size: ${element.numerical}";
        }
      }
    }
    return currentSize;

  }
  String getCurrentSizerecent(Recent recent) {
    String currentSize = "";
    if (recent.sizes?.categorical != null) {
      for (var element in recent.sizes!.categorical!) {
        if (element.isSelected) {
          currentSize = "Size: ${element.categorical.name}";
        }
      }
    }


    if (recent.sizes?.numerical != null) {
      for (var element in recent.sizes!.numerical!) {
        if (element.isSelected) {
          currentSize = "Size: ${element.numerical}";
        }
      }
    }
    return currentSize;
  }
}
