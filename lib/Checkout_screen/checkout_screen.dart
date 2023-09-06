import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/Cart_screen/cart_screen.dart';
import 'package:wayelle/Checkout_screen/payment_method_screen.dart';
import 'package:wayelle/Checkout_screen/shiiping_address_screen.dart';
import 'package:wayelle/controllers/cart_controller.dart';
import 'package:wayelle/controllers/place_order_controller.dart';
import 'package:wayelle/controllers/user_controller.dart';
import 'package:wayelle/skelton_drawer/skelton_checkout.dart';

import '../A_comman_widget/bottom navigationbar.dart';

class CheckoutScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CheckoutScreen(
      {Key? key,
      required this.switchLanguage,
      required this.quantity,
      required this.totalAmount})
      : super(key: key);
  final Function(String) switchLanguage;
  int quantity;
  int totalAmount;
  int discount = 3;
  int? subtotal;
  TextEditingController couponController = TextEditingController();
  String? paymentMethod;
  String? result;
  // String _selectedItem = '';
  // List<String> _dropdownItems = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    subtotal = totalAmount - discount;
    var userController = Get.put(UserController());
    var cartController = Get.find<CartController>();
    var orderController = Get.put(OrderController(switchLanguage));
    print(customer_id);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.offAll(() => CartScreen(switchLanguage: switchLanguage));
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
          'Checkout',
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
      body: Obx(
        () => userController.isLoading.value || quantity == null
            ? SkeltonCheckout()
            : userController.userAddress == null
                ? Center(
                    child: Text("data"),
                  )
                :
                // Text(userController.userAddress!.addressesdata[0].address1
                //     .toString())
                //   Text(userController.isLoading.value.toString())
                SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      orderController.placeOrder(
                                          subtotal,
                                          userController.selectedItem.value,
                                          userController.shippingAddress);

                                      // Form is valid, perform necessary actions
                                    }
                                  },
                                  child: Text("Place your order")),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                                '''By placing your order, you agree to Wayelle’s privacy policy and terms of use'''),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 22, bottom: 18),
                              child: Text(
                                "Apply coupon",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 5,
                                      offset: Offset(0, 3))
                                ],
                                color: Colors.white70,
                              ),
                              child: ListTile(
                                title: Text(
                                  "View coupons",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                ),
                                onTap: () {
                                  _showBottomSheet(context, userController,
                                      couponController);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 5,
                                      offset: Offset(0, 3))
                                ],
                                color: Colors.white70,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child:
                                    // GetBuilder<UserController>(
                                    // builder: (controller) {
                                    //   return
                                    Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userController.userAddress == null
                                          ? ""
                                          : userController.userAddress!
                                              .addressesdata[0].firstname
                                              .toString(),
                                      //  "",

                                      // "Shipping to:${userController.userAddress!.addressesdata[0].firstname},10 Medace sthhhhhhhhhhjjjjjj",
                                      //  "ioo",
                                      maxLines: 1,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 17),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            quantity == 1
                                                ? "Order (${quantity} item):"
                                                : "Order (${quantity} items):",
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                          Text(
                                            totalAmount.toString(),
                                            style: TextStyle(
                                                color: Colors.black45),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Delivery charge:",
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                          Text(
                                            userController.shipping!
                                                .shippingMethod[0].cost
                                                .toString(),
                                            //"10",
                                            style: TextStyle(
                                                color: Colors.black45),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Promotin discount:",
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                          Text(
                                            discount.toString(),
                                            style: TextStyle(
                                                color: Colors.black45),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Sub total:",
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                          Text(
                                            // "12",
                                            (subtotal).toString(),
                                            style: TextStyle(
                                                color: Colors.black45),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Order Total:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          // "90",
                                          (totalAmount - discount).toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        )
                                      ],
                                    ),
                                  ],
                                  //);
                                  //},
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 22, bottom: 18),
                              child: Text(
                                "Shipping Address",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                Get.to(() => Shippingaddress(
                                      userController: userController,
                                    ));
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.079,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 5,
                                        offset: Offset(0, 3))
                                  ],
                                  color: Colors.white70,
                                ),
                                //   child: ListTile(
                                //     title: Text(
                                //       "Add your address",
                                //       style: TextStyle(color: Colors.black45),
                                //     ),
                                //     trailing: Icon(
                                //       Icons.navigate_next,
                                //       color: Colors.black,
                                //     ),
                                //   ),
                                // )
                                // ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      // Obx(
                                      //   () =>
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GetBuilder<UserController>(
                                              builder: (controller) {
                                                return Text(
                                                  userController.shippingName
                                                              .value !=
                                                          ""
                                                      ? userController
                                                          .shippingName.value
                                                          .toString()
                                                      : "",
                                                  //  "",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            Text(
                                              userController.shippingAddress
                                                  .toString(),
                                              //  "",
                                              maxLines: 1,
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //),
                                      Expanded(child: Icon(Icons.navigate_next))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //
                            //  ,
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 22, bottom: 18),
                              child: Text(
                                "Payment Method",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),

                            // Container(
                            //   height: MediaQuery.of(context).size.height * 0.06,
                            //   width: double.infinity,
                            //   decoration: BoxDecoration(
                            //     boxShadow: [
                            //       BoxShadow(
                            //           color: Colors.grey.withOpacity(0.3),
                            //           blurRadius: 5,
                            //           offset: Offset(0, 3))
                            //     ],
                            //     color: Colors.white70,
                            //   ),
                            //   child:
                            Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: DropdownButtonFormField<String>(
                                value: userController.selectedItem == ""
                                    ? null
                                    : userController.selectedItem.toString(),
                                onChanged: (newValue) {
                                  userController.selectedItem.value =
                                      newValue.toString();
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select an option';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Select payment method",
                                    border: InputBorder.none),
                                items: userController.dropdownItems
                                    .map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            // ),
                            //-------------------------------------------------------

                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 22, bottom: 18),
                              child: Text(
                                "Order details:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    //2,
                                    cartController.cart!.cartproduct.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 9),
                                    height: MediaQuery.of(context).size.height *
                                        0.17,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            // child: Text(
                                            //   "Jan 22, 2022 - Jan 23 2022",
                                            //   style: TextStyle(color: Colors.green),
                                            // ),
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            //color: Colors.amber,
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.23,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            cartController
                                                                .cart!
                                                                .cartproduct[
                                                                    index]
                                                                .image),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text("Pull over"),
                                                        Text(
                                                          "Size: ${cartController.cart!.cartproduct[index].option[0].value} ",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45),
                                                        ),
                                                        // DropdownButton(
                                                        //     // value: 'option 1',
                                                        //     hint: Text(cartController
                                                        //         .cart!
                                                        //         .cartproduct[index]
                                                        //         .quantity),
                                                        //     items: [
                                                        //       'Option 1',
                                                        //       'Option 2',
                                                        //       'Option 3'
                                                        //     ]
                                                        //         .map<
                                                        //             DropdownMenuItem<
                                                        //                 String>>(
                                                        //           (String value) =>
                                                        //               DropdownMenuItem<
                                                        //                   String>(
                                                        //             value: value,
                                                        //             child:
                                                        //                 Text(value),
                                                        //           ),
                                                        //         )
                                                        //         .toList(),
                                                        //     onChanged: (value) {})
                                                        Text(
                                                            "Qty: ${cartController.cart!.cartproduct[index].quantity}")
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                    ),
                                                    Text(
                                                      //  "90",
                                                      cartController
                                                          .cart!
                                                          .cartproduct[index]
                                                          .total,
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      orderController.placeOrder(
                                          subtotal,
                                          userController.selectedItem.value,
                                          userController.shippingAddress);

                                      // Form is valid, perform necessary actions
                                    }
                                  },
                                  child: Text("Place your order")),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '''If you’re not around when the courier arrives, they’ll leave your order at the door. By placing your order, you agree  to take full responsibilty for it once it’s delivered. also agree to Wayelle’s privacy policy and terms of use.''',
                                style: TextStyle(color: Colors.black45),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, UserController userController,
      TextEditingController controller) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 120),
          child: Container(
              height: 200,
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      // onFieldSubmitted: (value) {
                      //   couponController.text = value;
                      // },
                      controller: couponController,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () async {
                              print("code touch");
                              await userController
                                  .fetchCoupon(couponController.text);
                            },
                            child: Icon(
                              Icons.arrow_circle_right,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Enter your promo code",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 0.5),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    Obx(() => userController.isCouponApply == false
                        ? Center(
                            child: Visibility(
                                child: Text("Add coupon"), visible: false),
                          )
                        : Center(
                            child: Text(
                                userController.coupon!.success.toString())))
                  ],
                ),
              )),
        );
      },
    );
  }
}
