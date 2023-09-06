import 'package:get/get.dart';
import 'package:wayelle/Amodule/model/my_orders_model.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/My_orders/my_order_screen.dart';
import 'package:http/http.dart' as http;

class MyOrderController extends GetxController {
  MyOrder? myOrders;
  var isLoading = true.obs;
  fetchMyorders() async {
    try {
      isLoading(true);
      var response = await http.post(
          Uri.parse("${baseurl}api/getorderbycus/key/123456789"),
          body: ({"customer_id": customer_id}));
      if (response.statusCode == 200) {
        var data = myOrderFromJson(response.body);
        myOrders = data;
        print(myOrders);
      } else {}
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
