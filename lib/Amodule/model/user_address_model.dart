// // To parse this JSON data, do
// //
// //     final userAddress = userAddressFromJson(jsonString);

// import 'dart:convert';

// UserAddress userAddressFromJson(String str) =>
//     UserAddress.fromJson(json.decode(str));

// String userAddressToJson(UserAddress data) => json.encode(data.toJson());

// class UserAddress {
//   bool success;
//   List<Addressesdatum> addressesdata;

//   UserAddress({
//     required this.success,
//     required this.addressesdata,
//   });

//   factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
//         success: json["success"],
//         addressesdata: List<Addressesdatum>.from(
//             json["addressesdata"].map((x) => Addressesdatum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "addressesdata":
//             List<dynamic>.from(addressesdata.map((x) => x.toJson())),
//       };
// }

// class Addressesdatum {
//   String addressId;
//   String firstname;
//   String lastname;
//   String company;
//   String address1;
//   String address2;
//   String postcode;
//   String city;
//   String zoneId;
//   Zone zone;
//   ZoneCode zoneCode;
//   String countryId;
//   Country country;
//   IsoCode2 isoCode2;
//   IsoCode3 isoCode3;
//   String addressFormat;
//   bool customField;

//   Addressesdatum({
//     required this.addressId,
//     required this.firstname,
//     required this.lastname,
//     required this.company,
//     required this.address1,
//     required this.address2,
//     required this.postcode,
//     required this.city,
//     required this.zoneId,
//     required this.zone,
//     required this.zoneCode,
//     required this.countryId,
//     required this.country,
//     required this.isoCode2,
//     required this.isoCode3,
//     required this.addressFormat,
//     required this.customField,
//   });

//   factory Addressesdatum.fromJson(Map<String, dynamic> json) => Addressesdatum(
//         addressId: json["address_id"],
//         firstname: json["firstname"],
//         lastname: json["lastname"],
//         company: json["company"],
//         address1: json["address_1"],
//         address2: json["address_2"],
//         postcode: json["postcode"],
//         city: json["city"],
//         zoneId: json["zone_id"],
//         zone: zoneValues.map[json["zone"]]!,
//         zoneCode: zoneCodeValues.map[json["zone_code"]]!,
//         countryId: json["country_id"],
//         country: countryValues.map[json["country"]]!,
//         isoCode2: isoCode2Values.map[json["iso_code_2"]]!,
//         isoCode3: isoCode3Values.map[json["iso_code_3"]]!,
//         addressFormat: json["address_format"],
//         customField: json["custom_field"],
//       );

//   Map<String, dynamic> toJson() => {
//         "address_id": addressId,
//         "firstname": firstname,
//         "lastname": lastname,
//         "company": company,
//         "address_1": address1,
//         "address_2": address2,
//         "postcode": postcode,
//         "city": city,
//         "zone_id": zoneId,
//         "zone": zoneValues.reverse[zone],
//         "zone_code": zoneCodeValues.reverse[zoneCode],
//         "country_id": countryId,
//         "country": countryValues.reverse[country],
//         "iso_code_2": isoCode2Values.reverse[isoCode2],
//         "iso_code_3": isoCode3Values.reverse[isoCode3],
//         "address_format": addressFormat,
//         "custom_field": customField,
//       };
// }

// enum Country { ALBANIA, EMPTY }

// final countryValues =
//     EnumValues({"Albania": Country.ALBANIA, "": Country.EMPTY});

// enum IsoCode2 { AL, EMPTY }

// final isoCode2Values = EnumValues({"AL": IsoCode2.AL, "": IsoCode2.EMPTY});

// enum IsoCode3 { ALB, EMPTY }

// final isoCode3Values = EnumValues({"ALB": IsoCode3.ALB, "": IsoCode3.EMPTY});

// enum Zone { BADGHIS, EMPTY }

// final zoneValues = EnumValues({"Badghis": Zone.BADGHIS, "": Zone.EMPTY});

// enum ZoneCode { BDG, EMPTY }

// final zoneCodeValues = EnumValues({"BDG": ZoneCode.BDG, "": ZoneCode.EMPTY});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

// To parse this JSON data, do
//
//     final userAddress = userAddressFromJson(jsonString);

import 'dart:convert';

UserAddress userAddressFromJson(String str) =>
    UserAddress.fromJson(json.decode(str));

String userAddressToJson(UserAddress data) => json.encode(data.toJson());

class UserAddress {
  bool success;
  List<Addressesdatum> addressesdata;

  UserAddress({
    required this.success,
    required this.addressesdata,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
        success: json["success"],
        addressesdata: List<Addressesdatum>.from(
            json["addressesdata"].map((x) => Addressesdatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "addressesdata":
            List<dynamic>.from(addressesdata.map((x) => x.toJson())),
      };
}

class Addressesdatum {
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

  Addressesdatum({
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

  factory Addressesdatum.fromJson(Map<String, dynamic> json) => Addressesdatum(
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
