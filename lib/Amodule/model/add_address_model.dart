// To parse this JSON data, do
//
//     final addAddress = addAddressFromJson(jsonString);

import 'dart:convert';

AddAddress addAddressFromJson(String str) =>
    AddAddress.fromJson(json.decode(str));

String addAddressToJson(AddAddress data) => json.encode(data.toJson());

class AddAddress {
  bool success;
  Addressesdata addressesdata;

  AddAddress({
    required this.success,
    required this.addressesdata,
  });

  factory AddAddress.fromJson(Map<String, dynamic> json) => AddAddress(
        success: json["success"],
        addressesdata: Addressesdata.fromJson(json["addressesdata"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "addressesdata": addressesdata.toJson(),
      };
}

class Addressesdata {
  String addressId;
  String firstname;
  String lastname;
  String company;
  String address1;
  String address2;
  String postcode;
  String city;
  String zoneId;
  String zone;
  String zoneCode;
  String countryId;
  String country;
  String isoCode2;
  String isoCode3;
  String addressFormat;
  bool customField;

  Addressesdata({
    required this.addressId,
    required this.firstname,
    required this.lastname,
    required this.company,
    required this.address1,
    required this.address2,
    required this.postcode,
    required this.city,
    required this.zoneId,
    required this.zone,
    required this.zoneCode,
    required this.countryId,
    required this.country,
    required this.isoCode2,
    required this.isoCode3,
    required this.addressFormat,
    required this.customField,
  });

  factory Addressesdata.fromJson(Map<String, dynamic> json) => Addressesdata(
        addressId: json["address_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        company: json["company"],
        address1: json["address_1"],
        address2: json["address_2"],
        postcode: json["postcode"],
        city: json["city"],
        zoneId: json["zone_id"],
        zone: json["zone"],
        zoneCode: json["zone_code"],
        countryId: json["country_id"],
        country: json["country"],
        isoCode2: json["iso_code_2"],
        isoCode3: json["iso_code_3"],
        addressFormat: json["address_format"],
        customField: json["custom_field"],
      );

  Map<String, dynamic> toJson() => {
        "address_id": addressId,
        "firstname": firstname,
        "lastname": lastname,
        "company": company,
        "address_1": address1,
        "address_2": address2,
        "postcode": postcode,
        "city": city,
        "zone_id": zoneId,
        "zone": zone,
        "zone_code": zoneCode,
        "country_id": countryId,
        "country": country,
        "iso_code_2": isoCode2,
        "iso_code_3": isoCode3,
        "address_format": addressFormat,
        "custom_field": customField,
      };
}
