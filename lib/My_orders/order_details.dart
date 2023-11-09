import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:wayelle/A_comman_widget/bottom%20navigationbar.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/controllers/my_order_controller.dart';
import 'package:wayelle/skelton_drawer/skelton_myorders.dart';
import 'package:intl/intl.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen(
      {Key? key,
      required this.orderId,
      required this.date,
      required this.status,
      required this.quantity})
      : super(key: key);
  final orderId;
  final date;
  final status;
  final quantity;

  @override
  Widget build(BuildContext context) {
    // DateTime dateTime = DateTime.parse(date);
    // String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    // print(date);
    //var orderdetailController = Get.put(GetOrderController());
    var orderdetailController = Get.find<MyOrderController>();

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Order details',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: Obx(
        () => orderdetailController.isLoading.value == true
            ? SkeltonMyorders()
            : orderdetailController.orders == null
                ? SkeltonMyorders()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order No: ${orderId}",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                date.toString(),
                                style: TextStyle(color: Colors.black45),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                quantity == 1
                                    ? "${quantity} item"
                                    : "${quantity} items",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black45),
                              ),
                              Text(
                                status.toString(),
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          ListView.builder(
                              itemCount: orderdetailController
                                  .orders!.ordersproducts.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  height:
                                      MediaQuery.of(context).size.height * 0.16,
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
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
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
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.23,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${ImageUrl}${orderdetailController.orders!.ordersproducts[index].images}"),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        "Order No : ${orderdetailController.orders!.ordersproducts[index].orderProductId}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                      Text(
                                                        orderdetailController
                                                            .orders!
                                                            .ordersproducts[
                                                                index]
                                                            .name,
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color:
                                                                Colors.black45),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Qty: ${orderdetailController.orders!.ordersproducts[index].quantity}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black45),
                                                          ),
                                                          Text(
                                                            "${orderdetailController.orders!.ordersproducts[index].total}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
