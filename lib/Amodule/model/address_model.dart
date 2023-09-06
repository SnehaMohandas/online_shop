// To parse this JSON data, do
//
//     final addressChange = addressChangeFromJson(jsonString);

import 'dart:convert';

AddressChange addressChangeFromJson(String str) =>
    AddressChange.fromJson(json.decode(str));

String addressChangeToJson(AddressChange data) => json.encode(data.toJson());

class AddressChange {
  bool success;
  String addressesdata;

  AddressChange({
    required this.success,
    required this.addressesdata,
  });

  factory AddressChange.fromJson(Map<String, dynamic> json) => AddressChange(
        success: json["success"],
        addressesdata: json["addressesdata"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "addressesdata": addressesdata,
      };
}
