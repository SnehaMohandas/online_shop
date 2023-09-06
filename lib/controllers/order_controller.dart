import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayelle/Amodule/model/order_model.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:http/http.dart' as http;

class GetOrderController extends GetxController {
  Orders? orders;
  var orderId;
  var isLoading = true.obs;
  var isId = false.obs;

  Future<void> checkKeyExists(orderid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool containsKey = prefs.containsKey(orderid);

    if (containsKey) {
      isId(true);
      loadFromSharedPreferences();
      // print('Key "$orderid" exists in SharedPreferences.');
    } else {
      print('Key "$orderid" does not exist in SharedPreferences.');
    }
  }

  Future<void> loadFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    orderId = prefs.getString('orderId') ?? "";
    print("stored id ...${orderId}");
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
    // getOrders();
    // loadFromSharedPreferences();
    // checkKeyExists("orderId");
    //print("idddddd${orderId.toString()}");
    // if (orderId != null || orderId != "") {
    //   getOrders();
    // }
    super.onInit();
  }
}
