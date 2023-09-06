import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayelle/A_comman_widget/bottom%20navigationbar.dart';
import 'package:wayelle/Amodule/model/user_register_model.dart';
import 'package:http/http.dart' as http;
import 'package:wayelle/Anetwork/api.dart';

class RegisterController extends GetxController {
  Register? userRegister;
  final Function(String) switchLanguage;

  RegisterController(this.switchLanguage);

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
                "postcode": "",
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
          print(userRegister!.userdata.customerId);
          if (userRegister!.success == true) {
            final prefs = await SharedPreferences.getInstance();
            prefs.setString("customer_Id", userRegister!.userdata.customerId);
            customer_id = prefs.getString("customer_Id");
            print("cust id${customer_id}");
            prefs.setString("email", userRegister!.userdata.email);
            userEmail = prefs.getString("email");
            print("user email${userEmail}");
            prefs.setString("password", userRegister!.userdata.password);
            userPassword = prefs.getString("password");
            print("user password${userPassword}");
          }

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
}
