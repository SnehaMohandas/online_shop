// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
  bool success;
  List<CountryElement> countries;

  Country({
    required this.success,
    required this.countries,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        success: json["success"],
        countries: List<CountryElement>.from(
            json["Countries"].map((x) => CountryElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "Countries": List<dynamic>.from(countries.map((x) => x.toJson())),
      };
}

class CountryElement {
  String countryId;
  String name;
  String isoCode2;
  String isoCode3;
  String addressFormat;
  String postcodeRequired;
  String status;

  CountryElement({
    required this.countryId,
    required this.name,
    required this.isoCode2,
    required this.isoCode3,
    required this.addressFormat,
    required this.postcodeRequired,
    required this.status,
  });

  factory CountryElement.fromJson(Map<String, dynamic> json) => CountryElement(
        countryId: json["country_id"],
        name: json["name"],
        isoCode2: json["iso_code_2"],
        isoCode3: json["iso_code_3"],
        addressFormat: json["address_format"],
        postcodeRequired: json["postcode_required"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "country_id": countryId,
        "name": name,
        "iso_code_2": isoCode2,
        "iso_code_3": isoCode3,
        "address_format": addressFormat,
        "postcode_required": postcodeRequired,
        "status": status,
      };
}
