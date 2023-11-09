import 'dart:convert';

import 'package:get/get.dart';
import 'package:wayelle/Amodule/model/my_orders_model.dart';
import 'package:wayelle/Amodule/model/order_details_model.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/My_orders/my_order_screen.dart';
import 'package:http/http.dart' as http;

class MyOrderController extends GetxController {
  MyOrder? myOrders;
  Orders? orders;
  var emptyOrder;

  var isLoading = true.obs;
  fetchMyorders() async {
    print("fetch my order");
    print(customer_id);
    try {
      isLoading(true);
      var response = await http.post(
          Uri.parse("${baseurl}api/getorderbycus/key/123456789"),
          body: ({"customer_id": customer_id}));

      // print();
      if (response.statusCode == 200) {
        var jsonstring = json.decode(response.body);
        if (jsonstring["success"] == false) {
          emptyOrder = true;
          print("successfalse${emptyOrder}");
        } else {
          var data = myOrderFromJson(response.body);
          myOrders = data;
          print(myOrders);
          emptyOrder = false;
          print("successtrue${emptyOrder}");
        }
      } else {}
    } catch (e) {
    } finally {
      isLoading(false);
      print(emptyOrder);
    }
  }

  getOrders(orderid) async {
    try {
      isLoading(true);
      var response = await http.post(
          Uri.parse("${baseurl}api/getorderproduct/key/123456789"),
          body: ({"order_id": orderid}));
      if (response.statusCode == 200) {
        var data = ordersFromJson(response.body);
        orders = data;
        //print(orders!.ordersproducts[0].);
        // print("orderlength${data.ordersproducts.length}");
        //order = data;
      } else {
        print("not 200");
      }
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchMyorders();
    super.onInit();
  }
}
