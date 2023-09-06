// To parse this JSON data, do
//
//     final coupon = couponFromJson(jsonString);

import 'dart:convert';

Coupon couponFromJson(String str) => Coupon.fromJson(json.decode(str));

String couponToJson(Coupon data) => json.encode(data.toJson());

class Coupon {
  String success;

  Coupon({
    required this.success,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
