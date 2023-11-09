import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayelle/A_comman_widget/bottom%20navigationbar.dart';
import 'package:wayelle/Amodule/model/country_model.dart';
import 'package:wayelle/Amodule/model/user_register_model.dart';
import 'package:http/http.dart' as http;
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/controllers/all_products_controller.dart';
import 'package:wayelle/controllers/cart_controller.dart';
import 'package:wayelle/controllers/favorite_controller.dart';
import 'package:wayelle/controllers/home_controller.dart';
import 'package:wayelle/controllers/my_order_controller.dart';

class RegisterController extends GetxController {
  Register? userRegister;
  Country? country;
  final Function(String) switchLanguage;

  RegisterController(this.switchLanguage);
  var favController = Get.put(FavoriteController());
  var cartController = Get.put(CartController());
  // var orderController = Get.put(GetOrderController());
  var myorderController = Get.put(MyOrderController());

  var homeontrolller = Get.put(HomeController());
  var allproductController = Get.put(AllproductController());

  getCountries() async {
    try {
      var response =
          await http.get(Uri.parse("${baseurl}api/getCountries/key/123456789"));
      if (response.statusCode == 200) {
        var data = countryFromJson(response.body);
        country = data;
      } else {}
    } catch (e) {
    } finally {}
  }

  registerNewUser(
      firstName,
      lastName,
      email,
      telephone,
      fax,
      company,
      address_1,
      address_2,
      city,
      postcode,
      country_id,
      zone_id,
      password,
      newsLetter) async {
    try {
      //isLoading(true);
      var response =
          await http.post(Uri.parse("${baseurl}api/new_register/key/123456789"),
              body: ({
                "customer_group_id": "1",
                "firstname": firstName,
                "lastname": lastName,
                "email": email,
                "telephone": telephone,
                "fax": "",
                "company": "",
                "address_1": address_1,
                "address_2": "",
                "city": city,
                "postcode": postcode,
                "country_id": "",
                "zone_id": "",
                "password": password,
                "newsletter": "1"
              }));
      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body);
        if (jsondata['userdata'] == "email / contact exist") {
          Fluttertoast.showToast(
            msg: "This e-mail already exist",
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_SHORT,
          );
        } else {
          var data = registerFromJson(response.body);
          userRegister = data;
          print("reg new user${response.body}");
          print(userRegister!.userdata.customerId);
          if (userRegister!.success == true) {
            final prefs = await SharedPreferences.getInstance();
            prefs.setString("customer_Id", userRegister!.userdata.customerId);
            customer_id = prefs.getString("customer_Id");
            print("cust id${customer_id}");
            prefs.setString("email", userRegister!.userdata.email);
            userEmail = prefs.getString("email");
            print("user email${userEmail}");
            // prefs.setString("password", userRegister!.userdata.password);
            prefs.setString("cus_grp_id",
                userRegister!.userdata.customerGroupId.toString());
            usercustomerGrpId = prefs.getString("cus_grp_id");
            print(usercustomerGrpId);
            prefs.setString("user_firstname", firstName);
            userfirstName = prefs.getString("user_firstname");
            print(userfirstName);
            prefs.setString("user_lastname", lastName);
            userlatName = prefs.getString("user_lastname");
            print(userlatName);
            prefs.setString("user_telephone", telephone);
            usertelePhone = prefs.getString("user_telephone");
            print(usertelePhone);
            //prefs.setString("user_address", address_1);
            // useraddress = prefs.getString("user_address");
            // print(useraddress);
            // prefs.setString("user_city", city);
            // usercity = prefs.getString("user_city");
            // print(usercity);
            // prefs.setString("user_postcode", postcode);
            // userpostCode = prefs.getString("user_postcode");
            // print(userpostCode);

            // userPassword = prefs.getString("password");
            // print("user password${userPassword}");
          }
          await favController.fetchWishList();
          await myorderController.fetchMyorders();
          await cartController.fetchCart();

          //  print(userRegister);
          Get.offAll(() => Bottomnavigation(switchLanguage: switchLanguage));
        }

        // print(banner!.banners[0].bannerImageId);
      } else {
        print(response.body);
      }
    } catch (e) {
    } finally {
      // isLoading(false);
    }
  }

  var obscureText = true.obs;
  var confrirmobscure = true.obs;

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void toggleconfirmPasswordVisibility() {
    confrirmobscure.value = !confrirmobscure.value;
  }

  @override
  void onInit() {
    getCountries();
    super.onInit();
  }
}

//reg new user{"success":true,"userdata":{"customer_id":"33","customer_group_id":"1","store_id":"0","firstname":"rinu","lastname":"","email":"r@gmail.com","telephone":"4444555555","fax":"","password":"c0910b530520abc18b85c6afae54b2300f8171e3","salt":"dUGdVKly9","cart":null,"wishlist":null,"newsletter":"1","address_id":"908","custom_field":"","ip":"111.92.79.104","status":"1","approved":"1","safe":"0","token":"","date_added":"2023-09-06 13:43:20","customer_group":"Default"}}