// To parse this JSON data, do
//
//     final shipping = shippingFromJson(jsonString);

import 'dart:convert';

Shipping shippingFromJson(String str) => Shipping.fromJson(json.decode(str));

String shippingToJson(Shipping data) => json.encode(data.toJson());

class Shipping {
  bool success;
  List<ShippingMethod> shippingMethod;

  Shipping({
    required this.success,
    required this.shippingMethod,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        success: json["success"],
        shippingMethod: List<ShippingMethod>.from(
            json["ShippingMethod"].map((x) => ShippingMethod.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "ShippingMethod":
            List<dynamic>.from(shippingMethod.map((x) => x.toJson())),
      };
}

class ShippingMethod {
  String title;
  String cost;
  String text;
  String code;

  ShippingMethod({
    required this.title,
    required this.cost,
    required this.text,
    required this.code,
  });

  factory ShippingMethod.fromJson(Map<String, dynamic> json) => ShippingMethod(
        title: json["title"],
        cost: json["cost"],
        text: json["text"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "cost": cost,
        "text": text,
        "code": code,
      };
}
