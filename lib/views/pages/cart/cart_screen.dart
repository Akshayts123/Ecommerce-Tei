

import 'package:e_commerce/consts/extensions.dart';
import 'package:e_commerce/models/category.dart';
import 'package:e_commerce/views/pages/cart/widgets/animated_switcher_wrapper.dart';
import 'package:e_commerce/views/pages/cart/widgets/empty_cart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../controller/cart_controller.dart';
import '../../../controller/product_controller.dart';
import '../../../models/product.dart';
import '../../../models/recent.dart';
import '../payment/credentials.dart' as razorCredentials;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

final ProductController controller = Get.put(ProductController());
final CartController cartController =Get.put(CartController());
class CartScreen extends StatefulWidget {
  CartController cartController = Get.find();

   CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ProductController productController = Get.find();
  late final Product product;
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "My cart",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }

  Widget cartList(context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          Column(
            children: controller.cartProducts.mapWithIndex((index, _) {
              Product product = controller.cartProducts[index];
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).bottomAppBarColor,
                  borderRadius: BorderRadius.circular(10),
                 ),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorExtension.randomColor,
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Image.asset(
                                      product.images[0],
                                      width: 90,
                                      height: 90,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 3,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name.nextLine,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  'Size : medium',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  controller.isPriceOff(product)
                                      ? "\$${product.off}"
                                      : "\$${product.price}",
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                splashRadius: 10.0,
                                onPressed: () => controller.decreaseItem(index),
                                icon: const Icon(
                                  Icons.remove,
                                  color: Color(0xFFEC6813),
                                ),
                              ),
                              GetBuilder<ProductController>(
                                builder: (ProductController controller) {
                                  return AnimatedSwitcherWrapper(
                                    child: Text(
                                      '${controller.cartProducts[index].quantity}',
                                      key: ValueKey<int>(
                                          controller.cartProducts[index].quantity),
                                      style: const TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.w700),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                splashRadius: 10.0,
                                onPressed: () => controller.increaseItem(index),
                                icon: const Icon(
                                  Icons.add,
                                  color: Color(0xFFEC6813),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),


                  ],
                ),
              );
            }).toList(),
          ),
          Column(
            children: controller.cartProductscat.mapWithIndex((index, _) {
              Categorys cats = controller.cartProductscat[index];
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).bottomAppBarColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorExtension.randomColor,
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Image.asset(
                                      cats.images[0],
                                      width: 90,
                                      height: 90,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 3,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cats.name.nextLine,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  'Size : medium',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  "\$${cats.price}",
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                splashRadius: 10.0,
                                onPressed: () => controller.decreaseItemcat(index),
                                icon: const Icon(
                                  Icons.remove,
                                  color: Color(0xFFEC6813),
                                ),
                              ),
                              GetBuilder<ProductController>(
                                builder: (ProductController controller) {
                                  return AnimatedSwitcherWrapper(
                                    child: Text(
                                      '${controller.cartProductscat[index].quantity}',
                                      key: ValueKey<int>(
                                          controller.cartProductscat[index].quantity),
                                      style: const TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.w700),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                splashRadius: 10.0,
                                onPressed: () => controller.increaseItemcat(index),
                                icon: const Icon(
                                  Icons.add,
                                  color: Color(0xFFEC6813),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),


                  ],
                ),
              );
            }).toList(),
          ),
          Column(
            children: controller.cartProductsrecent.mapWithIndex((index, _) {
              Recent recent = controller.cartProductsrecent[index];
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).bottomAppBarColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorExtension.randomColor,
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Image.asset(
                                      recent.images[0],
                                      width: 90,
                                      height: 90,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 3,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recent.name.nextLine,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  'Size : medium',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "\$${recent.price}",
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                splashRadius: 10.0,
                                onPressed: () => controller.decreaseItemrecent(index),
                                icon: const Icon(
                                  Icons.remove,
                                  color: Color(0xFFEC6813),
                                ),
                              ),
                              GetBuilder<ProductController>(
                                builder: (ProductController controller) {
                                  return AnimatedSwitcherWrapper(
                                    child: Text(
                                      '${controller.cartProductsrecent[index].quantity}',
                                      key: ValueKey<int>(
                                          controller.cartProductsrecent[index].quantity),
                                      style: const TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.w700),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                splashRadius: 10.0,
                                onPressed: () => controller.increaseItemrecent(index),
                                icon: const Icon(
                                  Icons.add,
                                  color: Color(0xFFEC6813),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),


                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: ()  async{
          productController.cartProducts.assignAll(productController.allProducts.where((item) => item.quantity > 0));
          productController.cartProductscat.assignAll(productController.allProductscat.where((item) => item.quantity > 0));
          productController.cartProductsrecent.assignAll(productController.allProductsrecent .where((item) => item.quantity > 0));
      return true;
    },
    child: NotificationListener<OverscrollIndicatorNotification>(
    onNotification: (overscroll) {
    overscroll.disallowGlow();
    return true;
    },
    child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: context.theme.primaryColor,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: !controller.isEmptyCart ? cartList(context) :  EmptyCart(),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5,top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style:context.theme.textTheme.headlineMedium ,
                ),
                Obx(
                      () {
                    return AnimatedSwitcherWrapper(
                      child: Text(
                        "\$${controller.totalPrice.value}",
                        key: ValueKey<double>(controller.totalPrice.value),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFEC6813),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding:  EdgeInsets.all(15),backgroundColor:context.theme.primaryColor, textStyle:context.theme.textTheme.headlineSmall ),
                onPressed: controller.isEmptyCart ? null : () async {
                  createOrder();
                },
                child: const Text("Buy Now"),
              ),
            ),
          )
        ],
      ),
    )
    ,),);
  }

  //RazorPay Payment Gateway

  final _razorpay = Razorpay();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print(response);
    verifySignature(
      signature: response.signature,
      paymentId: response.paymentId,
      orderId: response.orderId,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response);
    // Do something when payment fails
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.message ?? ''),
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(response);
    // Do something when an external wallet is selected
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.walletName ?? ''),
      ),
    );
  }

// create order
  void createOrder() async {
    String username = razorCredentials.keyId;
    String password = razorCredentials.keySecret;
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    Map<String, dynamic> body = {
      "amount": controller.totalPrice.value * 100,
      "currency": "INR",
      "receipt": "rcptid_11"

    };
    var res = await http.post(
      Uri.https(
          "api.razorpay.com", "v1/orders"), //https://api.razorpay.com/v1/orders
      headers: <String, String>{
        "Content-Type": "application/json",
        'authorization': basicAuth,
      },
      body: jsonEncode(body),
    );

    if (res.statusCode == 200) {
      openGateway(jsonDecode(res.body)['id']);
    }
    print(res.body);
  }

  openGateway(String orderId) {
    var options = {
      'key': razorCredentials.keyId,
      'amount': controller.totalPrice.value * 100, //in the smallest currency sub-unit.
      'name': 'E Commerce',
      'order_id': orderId, // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 60 * 5, // in seconds // 5 minutes
      'prefill': {
        'contact': '8606872355',
        'email': 'tsakshay126@gmail.com',
      }
    };
    _razorpay.open(options);
  }

  verifySignature({
    String? signature,
    String? paymentId,
    String? orderId,
  }) async {
    Map<String, dynamic> body = {
      'razorpay_signature': signature,
      'razorpay_payment_id': paymentId,
      'razorpay_order_id': orderId,
    };

    var parts = [];
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    var res = await http.post(
      Uri.https(
        "10.0.2.2", // my ip address , localhost
        "razorpay_signature_verify.php",
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded", // urlencoded
      },
      body: formData,
    );

    print(res.body);
    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.body),
        ),
      );
    }
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners

    super.dispose();
  }


}
