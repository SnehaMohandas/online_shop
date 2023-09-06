// To parse this JSON data, do
//
//     final productOptions = productOptionsFromJson(jsonString);

import 'dart:convert';

ProductOptions productOptionsFromJson(String str) =>
    ProductOptions.fromJson(json.decode(str));

String productOptionsToJson(ProductOptions data) => json.encode(data.toJson());

class ProductOptions {
  bool success;
  List<ProductsOption> productsOption;

  ProductOptions({
    required this.success,
    required this.productsOption,
  });

  factory ProductOptions.fromJson(Map<String, dynamic> json) => ProductOptions(
        success: json["success"],
        productsOption: List<ProductsOption>.from(
            json["products_option"].map((x) => ProductsOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "products_option":
            List<dynamic>.from(productsOption.map((x) => x.toJson())),
      };
}

class ProductsOption {
  String productOptionId;
  List<ProductOptionValue> productOptionValue;
  String optionId;
  String name;
  String type;
  String value;
  String required;

  ProductsOption({
    required this.productOptionId,
    required this.productOptionValue,
    required this.optionId,
    required this.name,
    required this.type,
    required this.value,
    required this.required,
  });

  factory ProductsOption.fromJson(Map<String, dynamic> json) => ProductsOption(
        productOptionId: json["product_option_id"],
        productOptionValue: List<ProductOptionValue>.from(
            json["product_option_value"]
                .map((x) => ProductOptionValue.fromJson(x))),
        optionId: json["option_id"],
        name: json["name"],
        type: json["type"],
        value: json["value"],
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "product_option_id": productOptionId,
        "product_option_value":
            List<dynamic>.from(productOptionValue.map((x) => x.toJson())),
        "option_id": optionId,
        "name": name,
        "type": type,
        "value": value,
        "required": required,
      };
}

class ProductOptionValue {
  String productOptionValueId;
  String optionValueId;
  String name;
  dynamic image;
  bool price;
  bool priceDis;
  String pricePrefix;
  dynamic optImage;

  ProductOptionValue({
    required this.productOptionValueId,
    required this.optionValueId,
    required this.name,
    required this.image,
    required this.price,
    required this.priceDis,
    required this.pricePrefix,
    required this.optImage,
  });

  factory ProductOptionValue.fromJson(Map<String, dynamic> json) =>
      ProductOptionValue(
        productOptionValueId: json["product_option_value_id"],
        optionValueId: json["option_value_id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        priceDis: json["price_dis"],
        pricePrefix: json["price_prefix"],
        optImage: json["opt_image"],
      );

  Map<String, dynamic> toJson() => {
        "product_option_value_id": productOptionValueId,
        "option_value_id": optionValueId,
        "name": name,
        "image": image,
        "price": price,
        "price_dis": priceDis,
        "price_prefix": pricePrefix,
        "opt_image": optImage,
      };
}
