// To parse this JSON data, do
//
//     final cartRemove = cartRemoveFromJson(jsonString);

import 'dart:convert';

CartRemove cartRemoveFromJson(String str) =>
    CartRemove.fromJson(json.decode(str));

String cartRemoveToJson(CartRemove data) => json.encode(data.toJson());

class CartRemove {
  bool success;
  String msg;

  CartRemove({
    required this.success,
    required this.msg,
  });

  factory CartRemove.fromJson(Map<String, dynamic> json) => CartRemove(
        success: json["success"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
      };
}
