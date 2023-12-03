import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayelle/A_comman_widget/bottom%20navigationbar.dart';
import 'package:wayelle/Amodule/model/cart_model.dart';
import 'package:wayelle/Amodule/model/order_details_model.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/Sucess_screen/sucessscreen.dart';
import 'package:wayelle/controllers/cart_controller.dart';
import 'package:wayelle/controllers/my_order_controller.dart';

import '../Amodule/model/order_det_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PlaceOrderController extends GetxController {
  // final customer_Id;
  final Function(String) switchLanguage;

  var Cus_id;

  var pdtLength;
  var productarrayfetch = [];
  var orderId;
  Map<String, dynamic>? paymentIntentData;

  final cartcontroller = Get.find<CartController>();
  final myorderController = Get.find<MyOrderController>();

  PlaceOrderController(this.switchLanguage);

  Future<void> placeOrder(
      subTotal, paymentMethod, address1, city, postcode) async {
    if (paymentMethod == "Online payment") {
      await makePayment(
          subTotal.toString(), paymentMethod, address1, city, postcode);
      // print("online payment true");
    }
    print(subTotal);
    print(paymentMethod);
    print(customer_id);
    print(usercustomerGrpId);
    print(userfirstName);
    print(userlatName);
    print(userEmail);
    print(usertelePhone);
    print(address1);
    print(city);
    print(postcode);
    // print(usercity);
    // print(userpostCode);
    //print(productarrayfetch);

    //place order function

    //============================================================

    //==================================================================================
  }

  Future<void> orderPlace(
      subtotal, paymentMethod, address1, city, postcode) async {
    print("worked");
    var response = await http
        .post(Uri.parse('${baseurl}api/addorder/key/123456789'), body: {
      'addorder': json.encode(<String, dynamic>{
        'totals': [
          {
            "code": "sub_total",
            "title": "Sub-Total",
            "value": subtotal,
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
            "value": subtotal,
            "sort_order": "9"
          }
        ],
        "invoice_prefix": "INV-2021-00",
        "store_id": 0,
        "store_name": "Mansharcart",
        "store_url": "https://Mansharcart.com/final",
        "customer_id": customer_id,
        "customer_group_id": usercustomerGrpId,
        "firstname": userfirstName,
        "lastname": userlatName,
        "email": userEmail,
        "telephone": usertelePhone,
        "fax": "0",
        "custom_field": false,
        "payment_firstname": userfirstName,
        "payment_lastname": userlatName,
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
        "shipping_firstname": userfirstName,
        "shipping_lastname": userlatName,
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
        "shipping_method": "paymentMethod",
        "shipping_code": "flat",
        "products": productarrayfetch,
        "vouchers": [],
        "comment": "TimeSlot",
        "total": subtotal,
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
      Get.offAll(() => Bottomnavigation(
            switchLanguage: switchLanguage,
          ));
      //  Map<String, dynamic> data = json.decode(response.body);

      // if (paymentMethod == "Online payment") {
      //   await makePayment(subtotal.toString());
      // }
      // print(response.body);

      myorderController.fetchMyorders();
    } else {
      print("status code not 200");
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

  Future<void> makePayment(
      subtotal, paymentMethod, address1, city, postcode) async {
    print(subtotal);
    try {
      paymentIntentData = await createPaymentIntent(
          subtotal, 'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');

      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  setupIntentClientSecret:
                      'pk_test_51M28KDKTgJy3KTxXuYHSEgSxGX4CpchDHPJPIot4THCChnrbU8J4dVmrsd14ugUKOtMt1TZiUBUJkoknm5NQ0VIe00zihLBz9D',
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  //applePay: PaymentSheetApplePay.,
                  //googlePay: true,
                  //testEnv: true,
                  customFlow: true,
                  style: ThemeMode.dark,
                  // merchantCountryCode: 'US',
                  merchantDisplayName: 'Kashif'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet(subtotal, paymentMethod, address1, city, postcode);
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
  }

  displayPaymentSheet(subtotal, paymentMethod, address1, city, postcode) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) {
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        //============================================================
        Fluttertoast.showToast(
          msg: "Paid successfully",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
        );
        orderPlace(subtotal, paymentMethod, address1, city, postcode);
        // Get.offAll(() => Bottomnavigation(
        //       switchLanguage: switchLanguage,
        //     ));

        // ScaffoldMessenger.of(context)
        //     .showSnackBar(const SnackBar(content: Text("paid successfully")));
        //===================================================================

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        // print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print("failed");
      Fluttertoast.showToast(
        msg: "Cancelled",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
      // print('Exception/DISPLAYPAYMENTSHEET==> $e');
      //========================================================
      // showDialog(
      //     context: context,
      //     builder: (_) => const AlertDialog(
      //           content: Text("Cancelled "),
      //         ));
      //===================================================
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    print(amount);
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                "Bearer sk_test_51M28KDKTgJy3KTxXrYJpxUyF8R68Xj0HkCGRHALHAgZYL1rpVtFomid9pv7gXfNCO15aBIDtUat0Bw8pXTjWOkRg00fVMcv3Fi",
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  // calculateAmount(String amount) {
  //   final a = (int.parse(amount)) * 100;
  //   return a.toString();
  // }

  @override
  void onInit() {
    // fetchUserInfo();
    fetchCart();

    super.onInit();
  }
}
