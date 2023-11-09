import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wayelle/Amodule/model/add_address_model.dart';
import 'package:wayelle/Amodule/model/address_model.dart';
import 'package:wayelle/Amodule/model/coupon_model.dart';
import 'package:wayelle/Amodule/model/payment_model.dart';
import 'package:wayelle/Amodule/model/shipping_model.dart';
import 'package:wayelle/Amodule/model/user_address_model.dart';
import 'package:http/http.dart' as http;
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/Login_screen/login_screen.dart';

import '../Amodule/model/order_det_model.dart';

class UserController extends GetxController {
  UserAddress? userAddress;
  //OrderDetails? orderDetails;
  Shipping? shipping;
  Payment? payment;
  Coupon? coupon;
  AddressChange? addressChange;
  AddAddress? addaddress;
  var isLoading = true.obs;
  var isCouponApply = false.obs;
  final isChecked = false.obs;
  var isPaymentSelect = false.obs;
  //final isTickVisible = false.obs;
  RxString selectedItem = ''.obs;
  List<String> dropdownItems = [];
  //RxList<bool> isCheckedList = <bool>[].obs;
  RxList<bool> checkboxStates = <bool>[].obs;
  // var selectedIndexes = <int>[].obs;

  var shippingName = ''.obs;
  var shippingAddress = ''.obs;
  var shippingCity = ''.obs;
  var shippingPostcode = ''.obs;
  // var cus_id = "14";

  // toggleCheckbox(int index) async {
  //   isCheckedList[index] = await !isCheckedList[index];
  // }

//----------------------------
  toggleCheckbox(int index) {
    // Unselect all checkboxes
    for (int i = 0; i < checkboxStates.length; i++) {
      checkboxStates[i] = false;
    }
    // Select the clicked checkbox
    checkboxStates[index] = true;
  }
  //-------------------------------

  // void toggleCheckbox(int index) {
  //   if (selectedIndexes.contains(index)) {
  //     selectedIndexes.remove(index);
  //   } else {
  //     selectedIndexes.add(index);
  //   }
  // }

  fetchUserAddress() async {
    try {
      isLoading(true);
      print(isLoading.value.toString());
      print("cus_id is${customer_id}");
      var response = await http.post(
          Uri.parse("${baseurl}api/getaddress/key/123456789"),
          body: ({"customer_id": customer_id}));
      if (response.statusCode == 200) {
        print("200");
        var data = userAddressFromJson(response.body);
        userAddress = data;

        shippingName.value = userAddress!.addressesdata[0].firstname;
        shippingAddress.value = userAddress!.addressesdata[0].address1;
        shippingCity.value = userAddress!.addressesdata[0].city;
        shippingPostcode.value = userAddress!.addressesdata[0].postcode;
        print(shippingName.value);
        for (int i = 0; i < userAddress!.addressesdata.length; i++) {
          checkboxStates.add(false);
        }

        // isCheckedList.assignAll(
        //     List.generate(userAddress!.addressesdata.length, (_) => false));
        await fetchShippingDetails();
        await fetchPaymentDetails();
        update();
        print("adressss${userAddress}");
      } else {
        print("statscode not 200");
      }
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  deleteaddress(addressId) async {
    var response = await http.post(
        Uri.parse("${baseurl}api/deleteaddress/key/123456789"),
        body: ({"address_id": addressId, "customer_id": customer_id}));
    if (response.statusCode == 200) {
      print(response.body);
      Fluttertoast.showToast(
        msg: "Address deleted",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
      fetchUserAddress();
      update();
    }
  }

  fetchShippingDetails() async {
    var response = await http
        .get(Uri.parse("${baseurl}api/shippingmethod//key/123456789"));
    if (response.statusCode == 200) {
      var data = shippingFromJson(response.body);
      shipping = data;
      print("${shipping!.shippingMethod[0].title}");
    } else {
      print("shippig code not 200");
    }
  }

  fetchPaymentDetails() async {
    var response =
        await http.get(Uri.parse("${baseurl}api/paymentmethod//key/123456789"));
    if (response.statusCode == 200) {
      var data = paymentFromJson(response.body);
      payment = data;
      for (int i = 0; i < payment!.paymentMethod.length; i++) {
        dropdownItems.addAll([payment!.paymentMethod[i].code]);
      }
      print(dropdownItems);
      // dropdownItems.addAll([payment!.paymentMethod[0].code]);
      //  print(dropdownItems);

      // print("${payment!.paymentMethod[0].code}");
    } else {
      print("payment code not 200");
    }
  }

  fetchCoupon(coupons) async {
    var response = await http.post(
        Uri.parse("${baseurl}api/getCoupon/key/123456789"),
        body: ({"customer_id": customer_id, "coupon": coupons}));
    if (response.statusCode == 200) {
      var data = couponFromJson(response.body);
      coupon = data;
      isCouponApply(true);
      print(coupon!.success);
    } else {
      print("payment code not 200");
    }
  }

  updateAddress(firstname, address, city, pincode, address_id) async {
    var response =
        await http.post(Uri.parse("${baseurl}api/editaddress/key/123456789"),
            body: ({
              "customer_id": customer_id,
              "address_id": address_id.toString(),
              "firstname": firstname.toString(),
              "lastname": "",
              "company": "",
              "address_1": address.toString(),
              "address_2": "",
              "city": city.toString(),
              "postcode": pincode.toString(),
              "country_id": "",
              "zone_id": "",
              "set_default": ""
            }));
    if (response.statusCode == 200) {
      var data = addressChangeFromJson(response.body);
      addressChange = data;
      print(addressChange!.addressesdata);

      // print("${payment!.paymentMethod[0].code}");
    } else {
      print("payment code not 200");
    }
  }

  addAddress(firstname, address, city, pincode) async {
    print(customer_id);
    print(firstname);
    print(address);
    print(city);
    print(pincode);
    var response =
        await http.post(Uri.parse("${baseurl}api/addaddress/key/123456789"),
            body: ({
              "customer_id": customer_id,
              "firstname": firstname.toString(),
              "lastname": "",
              "company": "",
              "address_1": address.toString(),
              "address_2": "",
              "city": city.toString(),
              "postcode": pincode.toString(),
              "country_id": "",
              "zone_id": "",
              "set_default": ""
            }));
    print(response.body);
    if (response.statusCode == 200) {
      print(response.statusCode);
      var data = addAddressFromJson(response.body);
      addaddress = data;
      print(addaddress);
      //  print(addressChange!.addressesdata);

      // print("${payment!.paymentMethod[0].code}");
    } else {
      print("payment code not 200");
    }
  }

  @override
  void onInit() {
    fetchUserAddress();
    super.onInit();
  }
}
