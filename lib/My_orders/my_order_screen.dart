import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/My_orders/order_details.dart';
import 'package:wayelle/controllers/my_order_controller.dart';
import 'package:wayelle/skelton_drawer/skelton_myorders.dart';
import 'package:intl/intl.dart';

class MyOrders extends StatelessWidget {
  final Function(String) switchLanguage;

  const MyOrders({Key? key, required this.switchLanguage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  var orderController = Get.find<GetOrderController>();
    var myorderController = Get.find<MyOrderController>();
    //  var orderdetailController = Get.put(GetOrderController());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'My orders',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        body: Obx(
          () => myorderController.isLoading.value == true
              ? SkeltonMyorders()
              : myorderController.myOrders == null ||
                      myorderController.emptyOrder == true
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                // color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/emptycart.png"),
                                    fit: BoxFit.cover)),
                          ),
                          Text(
                            "You have no orders yet!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  // Center(
                  //     child: Text("No orders found"),
                  //   )

                  : ListView.builder(
                      itemCount: myorderController.myOrders!.orders.length,
                      itemBuilder: (context, index) {
                        DateTime dateTime = DateTime.parse(myorderController
                            .myOrders!.orders[index].dateAdded
                            .toString());
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(dateTime);
                        print(formattedDate);
                        // var orderdetailController =
                        //     Get.put(GetOrderController());
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 8, bottom: 8),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.20,
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
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Text(
                                        "Order No: ${myorderController.myOrders!.orders[index].orderId}"),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6),
                                        child: Text(
                                            "Quantity : ${myorderController.myOrders!.orders[index].products}",
                                            style: TextStyle(
                                                color: Colors.black45)),
                                      ),
                                      Text(
                                          "\$${myorderController.myOrders!.orders[index].total}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ))
                                    ],
                                  ),
                                  Text("Date: ${formattedDate}"),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => OrderDetailsScreen(
                                                orderId: myorderController
                                                    .myOrders!
                                                    .orders[index]
                                                    .orderId,
                                                date: formattedDate,
                                                status: myorderController
                                                    .myOrders!
                                                    .orders[index]
                                                    .status,
                                                quantity: myorderController
                                                    .myOrders!
                                                    .orders[index]
                                                    .products,
                                              ));
                                          print(myorderController
                                              .myOrders!.orders[index].orderId);
                                          myorderController.getOrders(
                                            myorderController.myOrders!
                                                .orders[index].orderId,
                                          );
                                        },
                                        child: Container(
                                          child: Center(child: Text("Details")),
                                          decoration: BoxDecoration(

                                              // color: Colors.amber,
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.09,
                                        ),
                                      ),
                                      Text(
                                        myorderController
                                            .myOrders!.orders[index].status,
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          // child: Container(
                          //   height:
                          //       MediaQuery.of(context).size.height * 0.16,
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
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(12.0),
                          //     child: Column(
                          //       crossAxisAlignment:
                          //           CrossAxisAlignment.start,
                          //       children: [
                          //         Padding(
                          //           padding:
                          //               const EdgeInsets.only(bottom: 10),
                          //           // child: Text(
                          //           //   "Jan 22, 2022 - Jan 23 2022",
                          //           //   style: TextStyle(color: Colors.green),
                          //           // ),
                          //         ),
                          //         Container(
                          //           height:
                          //               MediaQuery.of(context).size.height *
                          //                   0.1,
                          //           //color: Colors.amber,
                          //           child: Row(
                          //             children: [
                          //               Container(
                          //                 margin:
                          //                     EdgeInsets.only(right: 10),
                          //                 width: MediaQuery.of(context)
                          //                         .size
                          //                         .width *
                          //                     0.23,
                          //                 decoration: BoxDecoration(
                          //                   color: Colors.transparent,
                          //                   image: DecorationImage(
                          //                       image: NetworkImage(
                          //                           "${ImageUrl}${orderController.orders!.ordersproducts[index].images}"),
                          //                       fit: BoxFit.cover),
                          //                 ),
                          //               ),
                          //               Expanded(
                          //                 child: Container(
                          //                   child: Column(
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment
                          //                             .spaceAround,
                          //                     children: [
                          //                       Text(
                          //                         "Order No : ${orderController.orders!.ordersproducts[index].orderProductId}",
                          //                         style: TextStyle(
                          //                             fontWeight:
                          //                                 FontWeight.bold,
                          //                             fontSize: 16),
                          //                       ),
                          //                       Text(
                          //                         orderController
                          //                             .orders!
                          //                             .ordersproducts[index]
                          //                             .name,
                          //                         style: TextStyle(
                          //                             overflow: TextOverflow
                          //                                 .ellipsis,
                          //                             color:
                          //                                 Colors.black45),
                          //                       ),
                          //                       Row(
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment
                          //                                 .spaceBetween,
                          //                         children: [
                          //                           Text(
                          //                             "Qty: ${orderController.orders!.ordersproducts[index].quantity}",
                          //                             style: TextStyle(
                          //                                 color: Colors
                          //                                     .black45),
                          //                           ),
                          //                           Text(
                          //                             "Total: ${orderController.orders!.ordersproducts[index].total}",
                          //                             style: TextStyle(
                          //                                 color:
                          //                                     Colors.green),
                          //                           ),
                          //                         ],
                          //                       )
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        );
                      }),
        ));
  }
}
