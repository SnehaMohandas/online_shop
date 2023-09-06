import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/Checkout_screen/checkout_screen.dart';
import 'package:wayelle/Get_all_products/all_products.dart';
import 'package:wayelle/controllers/cart_controller.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wayelle/controllers/user_controller.dart';
import 'package:wayelle/skelton_drawer/skelton_cart.dart';

import '../A_comman_widget/bottom navigationbar.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key, required this.switchLanguage}) : super(key: key);
  final Function(String) switchLanguage;
  int quantity = 0;
  int totalAmt = 0;
  var product_option_id;
  var product_option_value_id;

  @override
  Widget build(BuildContext context) {
    //var cartController = Get.put(CartController());

    var cartController = Get.find<CartController>();
    print(customer_id);

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.offAll(
                    () => Bottomnavigation(switchLanguage: switchLanguage));
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          //  toolbarHeight: 90,
          centerTitle: true,
          title: Text(
            'Your cart',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            SizedBox(
              width: 8,
            )
          ],
        ),
        body:
            //  cartController.cart == null
            //     ? Center(
            //         child: CircularProgressIndicator(),
            //       ):cartController.value==false?
            //       Center(
            //       child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //         Text("Your cart is empty!"),
            //         GestureDetector(
            //           onTap: () {
            //             Get.to(
            //                 () => Getallproducts(switchLanguage: switchLanguage));
            //           },
            //           child: Container(
            //             height: MediaQuery.of(context).size.height * 0.12,
            //             width: MediaQuery.of(context).size.width * 0.12,
            //             decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               boxShadow: [
            //                 BoxShadow(
            //                     color: Colors.grey.withOpacity(0.5),
            //                     blurRadius: 5,
            //                     offset: Offset(0, 3))
            //               ],
            //               color: Colors.white,
            //             ),
            //             child: Icon(
            //               Icons.add_shopping_cart,
            //               color: Colors.red,
            //             ),
            //           ),
            //         )
            //       ]))
            //     : Text("data")

            Obx(() {
          if (cartController.isLoading.value == true) {
            return SkeltonCart();
          } else if (cartController.value == false ||
              cartController.cart == null) {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Text("Your cart is empty!"),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                          () => Getallproducts(switchLanguage: switchLanguage));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ],
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.red,
                      ),
                    ),
                  )
                ]));
          } else {
            return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cartController.cart!.cartproduct.length == 1
                            ? "${cartController.cart!.cartproduct.length.toString()} item in your cart"
                            : "${cartController.cart!.cartproduct.length.toString()} items in your cart",
                        style: TextStyle(color: Colors.black38),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      TextButton.icon(
                          onPressed: () {
                            Get.offAll(() =>
                                Getallproducts(switchLanguage: switchLanguage));
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.red,
                          ),
                          label: Text(
                            "Add more",
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () async {
                          for (int i = 0;
                              i < cartController.cart!.cartproduct.length;
                              i++) {
                            quantity = quantity +
                                int.parse(cartController
                                    .cart!.cartproduct[i].quantity);
                          }
                          print(quantity);

                          for (int i = 0;
                              i < cartController.cart!.cartproduct.length;
                              i++) {
                            String ds =
                                cartController.cart!.cartproduct[i].total;
                            double convertedValue =
                                double.parse(ds.replaceAll(',', '').replaceAll(
                                      '\$',
                                      '',
                                    ));

                            int val = convertedValue.toInt();

                            totalAmt = totalAmt + val;
                          }
                          print(totalAmt);

                          await Get.to(() => CheckoutScreen(
                                switchLanguage: switchLanguage,
                                quantity: quantity,
                                totalAmount: totalAmt,
                              ));
                          totalAmt = 0;
                          quantity = 0;
                        },
                        child: Text(
                          cartController.cart!.cartproduct.length == 1
                              ? "Proceed to checkout (${cartController.cart!.cartproduct.length.toString()} item)"
                              : "Proceed to checkout(${cartController.cart!.cartproduct.length.toString()} items)",
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: cartController.cart!.cartproduct.length,
                        itemBuilder: (context, index) {
                          print(cartController.cart!.success);
                          print(cartController.cart!.cartproduct.length);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 9),
                            child: Card(
                                // elevation: 1,
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 98,
                                      width: 85,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(cartController
                                                  .cart!
                                                  .cartproduct[index]
                                                  .image),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.03,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.64,
                                          // color: Colors.amber,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                              ),
                                              Text(
                                                cartController.cart!
                                                    .cartproduct[index].name,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              Row(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment
                                                //         .spaceAround,
                                                children: [
                                                  Text(
                                                    //"size",
                                                    "Size: ${cartController.cart!.cartproduct[index].option[0].value}",
                                                    style: TextStyle(
                                                        color: Colors.black38),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.04,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                // mainAxisAlignment: MainAxisAlignment.start,
                                                // crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          // pdtController.quantityRemove();
                                                        },
                                                        child: GestureDetector(
                                                          onTap: () async {},
                                                          child: Container(
                                                              height: MediaQuery
                                                                          .of(
                                                                              context)
                                                                      .size
                                                                      .height *
                                                                  0.05,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.08,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                            color: Colors.grey.withOpacity(
                                                                                0.5),
                                                                            blurRadius:
                                                                                5,
                                                                            offset:
                                                                                Offset(0, 3))
                                                                      ],
                                                                      color: Colors
                                                                          .white),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  await cartController
                                                                      .addToCart(
                                                                          //  customer_id,
                                                                          cartController
                                                                              .cart!
                                                                              .cartproduct[
                                                                                  index]
                                                                              .productId,
                                                                          "-1",
                                                                          cartController
                                                                              .cart!
                                                                              .cartproduct[
                                                                                  index]
                                                                              .option[
                                                                                  0]
                                                                              .productOptionId,
                                                                          cartController
                                                                              .cart!
                                                                              .cartproduct[index]
                                                                              .option[0]
                                                                              .productOptionValueId);
                                                                  quantity = 0;
                                                                  cartController
                                                                      .fetchCart();
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color:
                                                                        // pdtController.quantity == 1
                                                                        //     ? Colors.black12
                                                                        //     :
                                                                        Colors
                                                                            .black45),
                                                              )),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 7,
                                                      ),
                                                      Text(cartController
                                                          .cart!
                                                          .cartproduct[index]
                                                          .quantity),
                                                      SizedBox(
                                                        width: 7,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () async {
                                                          await cartController
                                                              .addToCart(
                                                                  // customer_id,
                                                                  cartController
                                                                      .cart!
                                                                      .cartproduct[
                                                                          index]
                                                                      .productId,
                                                                  "1",
                                                                  cartController
                                                                      .cart!
                                                                      .cartproduct[
                                                                          index]
                                                                      .option[0]
                                                                      .productOptionId,
                                                                  cartController
                                                                      .cart!
                                                                      .cartproduct[
                                                                          index]
                                                                      .option[0]
                                                                      .productOptionValueId);
                                                          quantity = 0;
                                                          await cartController
                                                              .fetchCart();
                                                          //pdtController.quantityAdd();
                                                        },
                                                        child: Container(
                                                            height: MediaQuery
                                                                        .of(
                                                                            context)
                                                                    .size
                                                                    .height *
                                                                0.05,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.08,
                                                            decoration:
                                                                BoxDecoration(
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.5),
                                                                      blurRadius:
                                                                          5,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              3))
                                                                ],
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .white),
                                                            child: Icon(
                                                              Icons.add,
                                                              color: Colors
                                                                  .black45,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        cartController
                                                            .cart!
                                                            .cartproduct[index]
                                                            .total,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      //),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          child: GestureDetector(
                                            onTap: () {
                                              //               onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                        "Remove",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      content: Text(
                                                        'Are you sure to want to remove this item from cart?',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(); // Close the dialog
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Text(
                                                            'OK',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          onPressed: () async {
                                                            // Do something here when OK is pressed

                                                            await cartController
                                                                .removeCart(
                                                                    cartController
                                                                        .cart!
                                                                        .cartproduct[
                                                                            index]
                                                                        .cartId);
                                                            // Close the dialog
                                                            Navigator.of(
                                                                    context)
                                                                .pop();

                                                            cartController
                                                                .fetchCart();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  });
                                              //               },
                                            },
                                            child: Container(
                                              //  color: Colors.blue,
                                              height: 20,
                                              width: 20,
                                              child: Icon(
                                                Icons.cancel_outlined,
                                                size: 17,
                                                color: Colors.black45,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )),
                          );
                        }),
                  ),
                ])
                //],
                );
            //----------------------------------------
            //return Text("data");
            //);
            //  }
          }
          //--------------------------------------
        }));
  }
}
