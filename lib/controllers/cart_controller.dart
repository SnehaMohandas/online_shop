import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wayelle/Amodule/model/add_to_cart_model.dart';
import 'package:wayelle/Amodule/model/cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:wayelle/Anetwork/api.dart';

import '../Amodule/model/remove_cart_model.dart';

class CartController extends GetxController {
  Cart? cart;
  CartRemove? cartRemove;
  var isLoading = true.obs;
  bool? value;
  List qnty = [];
  //var emptyCart;
  addToCart(
    product_id,
    quantity,
    product_option_id,
    product_option_value_id,
  ) async {
    var response =
        await http.post(Uri.parse("${baseurl}api/addcart/key/123456789"),
            body: ({
              "customer_id": customer_id,
              "product_id": product_id,
              "quantity": quantity,
              "option[$product_option_id]": product_option_value_id
            }));

    if (response.statusCode == 200) {
      print("add to cart${response.body}");
      var data = addtoCartFromJson(response.body);

      Fluttertoast.showToast(
        msg: "Added to Cart",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
      update();

      return data;
    } else {}
  }

  editCart(
    product_id,
    quantity,
    product_option_id,
    product_option_value_id,
  ) async {
    var response =
        await http.post(Uri.parse("${baseurl}api/addcart/key/123456789"),
            body: ({
              "customer_id": customer_id,
              "product_id": product_id,
              "quantity": quantity,
              "option[$product_option_id]": product_option_value_id
            }));

    if (response.statusCode == 200) {
      print("add to cart${response.body}");
      var data = addtoCartFromJson(response.body);

      update();

      return data;
    } else {}
  }

  fetchCart() async {
    try {
      isLoading(true);
      print(customer_id);
      var response = await http.post(
          Uri.parse("${baseurl}api/cartproduct/key/123456789"),
          body: ({"customer_id": customer_id}));
      var jsonString = json.decode(response.body);
      value = jsonString['success'];

      if (response.statusCode == 200) {
        // var jsonString = json.decode(response.body);
        // if (jsonString['success'] == false) {
        //   emptyCart = true;
        // } else {
        var data = cartFromJson(response.body);
        cart = data;
        print("cart items${response.body}");
        // emptyCart = false;
        //}
      } else {
        print("problem cart");
        throw "Problem while fetching data from API";
      }
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  removeCart(cart_id) async {
    var response = await http.post(
        Uri.parse("${baseurl}api/removecart/key/123456789"),
        body: ({"customer_id": customer_id, "cart_id": cart_id}));
    if (response.statusCode == 200) {
      var data = cartRemoveFromJson(response.body);
      cartRemove = data;
    }
  }

  getOrderDetails() {}

  @override
  void onInit() {
    fetchCart();
    super.onInit();
  }
}
