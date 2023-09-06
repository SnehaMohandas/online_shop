// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  bool success;
  List<PaymentMethod> paymentMethod;

  Payment({
    required this.success,
    required this.paymentMethod,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        success: json["success"],
        paymentMethod: List<PaymentMethod>.from(
            json["PaymentMethod"].map((x) => PaymentMethod.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "PaymentMethod":
            List<dynamic>.from(paymentMethod.map((x) => x.toJson())),
      };
}

class PaymentMethod {
  String extensionId;
  String type;
  String code;

  PaymentMethod({
    required this.extensionId,
    required this.type,
    required this.code,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        extensionId: json["extension_id"],
        type: json["type"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "extension_id": extensionId,
        "type": type,
        "code": code,
      };
}
