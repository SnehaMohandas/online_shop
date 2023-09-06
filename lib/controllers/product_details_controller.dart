import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wayelle/Amodule/model/favorite_model.dart';
import 'package:wayelle/Amodule/model/product_details_model.dart';
import 'package:http/http.dart' as http;
import 'package:wayelle/Anetwork/api.dart';

import '../Amodule/model/add_to_cart_model.dart';
import '../Amodule/model/additional_pdt_details_model.dart';
import '../Amodule/model/product_option_model.dart';

class ProductDetailsController extends GetxController {
  ProductDetails? productDetails;
  ProductOptions? productOptions;
  // Favorites? favorites;

  final productId;
  ProductDetailsController(this.productId);
  var isLoading = true.obs;
  RxInt quantity = 1.obs;
  List<String> sizes = [];
  RxString selectedSize = "".obs;
  AdditionalProductDetail? additionalProductDetail;
  AddtoCart? addtoCart;
  double? parsedPrice;
  double? totalAmount;
  var sizeLoading = true.obs;
  var isSuccess = false.obs;
  var product_option_id;
  var product_option_value_id;

  // var selectIndex;

  List PdtImgs = [];

  fetchProductDetails() async {
    if (productId != null) {
      try {
        isLoading(true);
        var response = await http.get(Uri.parse(
            "${baseurl}api/getProduct/p_id/${productId}/key/123456789"));
        if (response.statusCode == 200) {
          var data = productDetailsFromJson(response.body);
          // isLoading(true);

          productDetails = data;
          PdtImgs.add(productDetails!.product.thumb);

          print(PdtImgs);
          // print(productDetails!.product.price);
          //fetchWishList();
          fetchAddDetails();
          // fetchSize();
        } else {
          print("statuscode not 200");
        }
      } catch (e) {
      } finally {
        print(isLoading);
        // isLoading(false);
      }
    }
  }

  fetchAddDetails() async {
    try {
      var response = await http.get(Uri.parse(
          "${baseurl}api/getProdadditional/p_id/${productId}/key/123456789"));
      var data = additionalProductDetailFromJson(response.body);
      if (data.productsProdadditional.addImgs != [] &&
          data.productsProdadditional.addImgs[0].image != "" &&
          data.productsProdadditional.addImgs[0].image.isNotEmpty) {
        print(data.productsProdadditional.addImgs.length);
        print(PdtImgs);
        for (int i = 0; i < data.productsProdadditional.addImgs.length; i++) {
          PdtImgs.addAll(
              ["$ImageUrl${data.productsProdadditional.addImgs[i].image}"]);
        }
        print(PdtImgs);
      }
    } catch (e) {
    } finally {
      isLoading(false);
      print(isLoading);
    }
  }

  quantityAdd() {
    quantity = quantity + 1;
    String price = productDetails!.product.price;
    double parsedValue = parseCurrencyString(price);
    totalAmount = parsedValue * quantity.value;
    print(parsedValue);
  }

  double parseCurrencyString(String currencyString) {
    String numericString = currencyString.replaceAll('\$', '');
    double parsedValue = double.parse(numericString);

    return parsedValue;
  }

  quantityRemove() {
    if (quantity == 1) {
      return null;
    } else {
      quantity = quantity - 1;
      String price = productDetails!.product.price;
      double parsedValue = parseCurrencyString(price);
      totalAmount = parsedValue * quantity.value;
    }
  }

  sizeChange(sizeSelect) {
    selectedSize.value = sizeSelect;
  }

  fetchSize() async {
    try {
      // sizeLoading(true);
      var response = await http.get(Uri.parse(
          "${baseurl}api/getOptionbyid/p_id/${productId}/key/123456789"));
      if (response.statusCode == 200) {
        var data = productOptionsFromJson(response.body);
        productOptions = data;

        if (productOptions!.success == true) {
          isSuccess(true);

          for (var i = 0;
              i < productOptions!.productsOption[0].productOptionValue.length;
              i++) {
            sizes.addAll(
                [productOptions!.productsOption[0].productOptionValue[i].name]);
          }
          //}
          selectedSize.value = productOptions!
              .productsOption[0].productOptionValue[0].name
              .toString();
          product_option_id =
              await productOptions!.productsOption[0].productOptionId;
          product_option_value_id = await productOptions!
              .productsOption[0].productOptionValue[0].productOptionValueId;
          print(sizes);
          print(product_option_id);
          print(product_option_value_id);
        } else {
          sizes = [];
        }
      } else {}
    } catch (e) {
    } finally {}
  }

  // fetchWishList() async {
  //   try {
  //     //isLoading(true);
  //     var response =
  //         await http.post(Uri.parse("${baseurl}api/wishlist/key/123456789"),
  //             body: ({
  //               "customer_id": customer_id,
  //             }));
  //     if (response.statusCode == 200) {
  //       var data = favoritesFromJson(response.body);
  //       favorites = data;
  //       print(favorites);
  //       // print("responsee favvv${response.body}");
  //     } else {
  //       throw "Problem while fetching data from API";
  //     }
  //   } catch (e) {
  //   } finally {
  //     // isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    fetchProductDetails();
    fetchSize();
    // fetchWishList();

    super.onInit();
  }
}
//https://globosoft.org/2023/02/wayelle2/api/getProduct/p_id/43/key/123456789
//globosoft.org/2023/02/wayelle2/api/getLatest/limit/4/key/123456789

