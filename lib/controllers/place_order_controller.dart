import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayelle/Amodule/model/cart_model.dart';
import 'package:wayelle/Amodule/model/order_model.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/Sucess_screen/sucessscreen.dart';
import 'package:wayelle/controllers/cart_controller.dart';
import 'package:wayelle/controllers/order_controller.dart';
import 'package:wayelle/controllers/order_controller.dart';

import '../Amodule/model/order_details_model.dart';
import 'order_controller.dart';

class OrderController extends GetxController {
  // final customer_Id;
  final Function(String) switchLanguage;

  var Cus_id;
  var email;
  var cus_group_id;
  var firstName;
  var lastname;
  var telephone;
  var address;
  var city;
  var postcode;
  var pdtLength;
  var productarrayfetch = [];
  var orderId;
  Orders? order;
  final GetOrdercontroller = Get.find<GetOrderController>();
  final cartcontroller = Get.find<CartController>();

  OrderController(this.switchLanguage);

  Future<void> placeOrder(subTotal, paymentMethod, address1) async {
    print(subTotal);
    print(paymentMethod);
    print(customer_id);
    print(cus_group_id);
    print(firstName);
    print(lastname);
    print(email);
    print(telephone);
    print(address1);
    print(city);
    print(postcode);
    //print(productarrayfetch);
    var response = await http
        .post(Uri.parse('${baseurl}api/addorder/key/123456789'), body: {
      'addorder': json.encode(<String, dynamic>{
        'totals': [
          {
            "code": "sub_total",
            "title": "Sub-Total",
            "value": subTotal.toString(),
            "sort_order": "1"
          },
          {
            "code": "coupon",
            "title": "Coupon (WEBCOD)",
            "value": "${3}",
            "sort_order": "2"
          },
          {
            "code": "shipping",
            "title": paymentMethod,
            "value": "0",
            "sort_order": "3"
          },
          {
            "code": "total",
            "title": "Total",
            "value": subTotal.toString(),
            "sort_order": "9"
          }
        ],
        "invoice_prefix": "INV-2021-00",
        "store_id": 0,
        "store_name": "Mansharcart",
        "store_url": "https://Mansharcart.com/final",
        "customer_id": customer_id,
        "customer_group_id": cus_group_id,
        "firstname": firstName,
        "lastname": lastname,
        "email": email,
        "telephone": telephone,
        "fax": "0",
        "custom_field": false,
        "payment_firstname": firstName,
        "payment_lastname": lastname,
        "payment_company": "",
        "payment_address_1": address1.toString(),
        "payment_address_2": "",
        "payment_city": city,
        "payment_postcode": postcode,
        "payment_zone": "Kerala",
        "payment_zone_id": "1485",
        "payment_country": "India",
        "payment_country_id": "99",
        "payment_address_format": "",
        "payment_custom_field": false,
        "payment_method": "cod",
        "payment_code": "cod",
        "shipping_firstname": firstName,
        "shipping_lastname": lastname,
        "shipping_company": "",
        "shipping_address_1": address1.toString(),
        "shipping_address_2": "",
        "shipping_postcode": postcode,
        "shipping_zone": "Kerala",
        "shipping_zone_id": "1490",
        "shipping_country": "India",
        "shipping_country_id": "99",
        "shipping_address_format": "",
        "shipping_custom_field": false,
        "shipping_method": "Cash on Devilery",
        "shipping_code": "flat",
        "products": productarrayfetch,
        "vouchers": [],
        "comment": "TimeSlot",
        "total": subTotal.toString(),
        "affiliate_id": 0,
        "commission": 0,
        "marketing_id": 0,
        "tracking": "",
        "language_id": "1",
        "currency_id": "2",
        "currency_code": "INR",
        "currency_value": "1.00000000",
        "ip": "127.0.0.1",
        "forwarded_ip": "",
        "user_agent":
            "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0",
        "accept_language": "en-US,en;q=0.5"
      })
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      //orderId = data["order"]["order_id"];
      await saveToSharedPreferences(data["order"]["order_id"]);

      //print(orderId);
      await GetOrdercontroller.loadFromSharedPreferences();
      // await GetOrdercontroller.getOrders();
      // await cartcontroller.fetchCart();
      print(response.body);

      Get.offAll(() => Sucess(
            switchLanguage: switchLanguage,
          ));
    } else {
      print("status code not 200");
    }
  }

  Future<void> saveToSharedPreferences(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('orderId', value);
    orderId = value; // Update the observable variable
    print("orderid${orderId}");
  }

  fetchUserInfo() async {
    print(userEmail);
    print(userPassword);
    var response = await http.post(
        Uri.parse("${baseurl}api/login/key/123456789"),
        body: ({"email": userEmail, "password": "4444"}));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      Cus_id = data["userdata"]["customer_id"];
      cus_group_id = data["userdata"]["customer_group_id"];
      email = data["userdata"]["email"];
      firstName = data["userdata"]["firstname"];
      lastname = data["userdata"]["lastname"];
      telephone = data["userdata"]["telephone"];
      address = data["userdata"]["address"]["address_1"];
      city = data["userdata"]["address"]["city"];
      postcode = data["userdata"]["address"]["postcode"];
      print(response.body);
      print(
          "${Cus_id},${email},${firstName},${lastname},${telephone},${address},${city},${postcode},${cus_group_id}");
    } else {
      print("not 200");
    }
  }

  fetchCart() async {
    //  print(customer_Id);
    var response = await http.post(
        Uri.parse("${baseurl}api/cartproduct/key/123456789"),
        body: ({"customer_id": customer_id}));

    if (response.statusCode == 200) {
      var d = cartFromJson(response.body);

      pdtLength = d.cartproduct.length;
      print("cart items${response.body}");
      await List.generate(
          pdtLength,
          (index) => productarrayfetch.addAll([
                {
                  "product_id": d.cartproduct[index].productId,
                  "name": d.cartproduct[index].name,
                  "model": d.cartproduct[index].model,
                  //"option": d.cartproduct[index].option,
                  "option": [
                    {
                      "product_option_id": cartcontroller
                          .cart!.cartproduct[index].option[0].productOptionId,
                      "product_option_value_id": cartcontroller.cart!
                          .cartproduct[index].option[0].productOptionValueId,
                      "option_id": cartcontroller
                          .cart!.cartproduct[index].option[0].optionId,
                      "option_value_id": cartcontroller
                          .cart!.cartproduct[index].option[0].optionValueId,
                      "name": cartcontroller
                          .cart!.cartproduct[index].option[0].name,
                      "value": cartcontroller
                          .cart!.cartproduct[index].option[0].value,
                      "type":
                          cartcontroller.cart!.cartproduct[index].option[0].type
                    }
                  ],
                  "download": [],
                  "quantity": d.cartproduct[index].quantity,
                  "subtract": "1",
                  "price": d.cartproduct[index].price,
                  "total": d.cartproduct[index].total,
                  "tax": 0,
                  "reward": 0
                }
              ]));
      //print("array${productarrayfetch}");
    } else {
      print("problem cart");
      throw "Problem while fetching data from API";
    }
  }

  @override
  void onInit() {
    fetchUserInfo();
    fetchCart();
    // loadFromSharedPreferences();
    // if (orderId != null) {
    //   getOrders();
    // }
    super.onInit();
  }

  // @override
  // void onClose() {
  //   fetchCart();
  //   super.onClose();
  // }
}
