import 'dart:convert';

import 'package:get/get.dart';
import 'package:wayelle/Amodule/model/favorite_model.dart';
import 'package:wayelle/Amodule/model/product_details_model.dart';
import 'package:http/http.dart' as http;
import 'package:wayelle/Amodule/model/similar_products_model.dart';
import 'package:wayelle/Anetwork/api.dart';

import '../Amodule/model/add_to_cart_model.dart';
import '../Amodule/model/additional_pdt_details_model.dart';
import '../Amodule/model/product_option_model.dart';

class ProductDetailsController extends GetxController {
  ProductDetails? productDetails;
  ProductOptions? productOptions;
  SimilarProducts? similarProducts;
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
  var emptySimilarpdts = "".obs;
  RxInt activePage = 0.obs;

  // var selectIndex;

  List PdtImgs = [];

  fetchProductDetails() async {
    if (productId != null) {
      print(productId);
      try {
        isLoading(true);
        var response = await http.get(Uri.parse(
            "${baseurl}api/getProduct/p_id/${productId}/key/123456789"));

        if (response.statusCode == 200) {
          var data = productDetailsFromJson(response.body);

          productDetails = data;
          print(PdtImgs);
          //  print("dddddd${productDetails!.product.thumb.toString()}");
          PdtImgs.add(productDetails!.product.thumb.toString());
          print(PdtImgs);
          if (productDetails!.product.extraimage != []) {
            for (int i = 0;
                i < productDetails!.product.extraimage.length;
                i++) {
              PdtImgs.addAll(
                  ["$ImageUrl${productDetails!.product.extraimage[i].image}"]);
            }
          } else {}

          await fetchSimilarProducts();
        } else {
          print("statuscode not 200");
        }
      } catch (e) {
      } finally {
        print("loading valuee${isLoading}");
      }
    }
  }

  fetchAddDetails() async {
    print("worked");
    try {
      var response = await http.get(Uri.parse(
          "${baseurl}api/getProduct/p_id/${productId}/key/123456789"));
      print("add res${response.body}");
      var data = productDetailsFromJson(response.body);
      if (data.product.extraimage != [] &&
          data.product.extraimage[0].image != "" &&
          data.product.extraimage[0].image.isNotEmpty) {
        for (int i = 0; i < data.product.extraimage.length; i++) {
          PdtImgs.addAll(["$ImageUrl${data.product.extraimage[i].image}"]);
        }
      }
    } catch (e) {
    } finally {
      // isLoading(false);
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
        } else {
          sizes = [];
        }
      } else {}
    } catch (e) {
    } finally {}
  }

  fetchSimilarProducts() async {
    print("similr");
    try {
      var response = await http.get(Uri.parse(
          "${baseurl}api/getrelaProduct/p_id/${productId}/key/123456789"));
      if (response.statusCode == 200) {
        var jsonString = json.decode(response.body);
        if (jsonString["success"] == false) {
          emptySimilarpdts.value = "true";
        } else {
          var data = similarProductsFromJson(response.body);
          similarProducts = data;
          print("simil ar pdyts${similarProducts}");
          emptySimilarpdts.value = "false";
          print(emptySimilarpdts);
        }
      } else {}
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchProductDetails();
    fetchSize();

    super.onInit();
  }
}
//https://globosoft.org/2023/02/wayelle2/api/getProduct/p_id/43/key/123456789
//globosoft.org/2023/02/wayelle2/api/getLatest/limit/4/key/123456789

