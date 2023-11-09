// To parse this JSON data, do
//
//     final similarProducts = similarProductsFromJson(jsonString);

import 'dart:convert';

SimilarProducts similarProductsFromJson(String str) =>
    SimilarProducts.fromJson(json.decode(str));

String similarProductsToJson(SimilarProducts data) =>
    json.encode(data.toJson());

class SimilarProducts {
  bool success;
  List<Relatedproduct> relatedproduct;

  SimilarProducts({
    required this.success,
    required this.relatedproduct,
  });

  factory SimilarProducts.fromJson(Map<String, dynamic> json) =>
      SimilarProducts(
        success: json["success"],
        relatedproduct: List<Relatedproduct>.from(
            json["relatedproduct"].map((x) => Relatedproduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "relatedproduct":
            List<dynamic>.from(relatedproduct.map((x) => x.toJson())),
      };
}

class Relatedproduct {
  String productId;
  String thumb;
  String name;
  String description;
  String price;
  dynamic special;
  bool tax;
  String minimum;
  int rating;
  String href;

  Relatedproduct({
    required this.productId,
    required this.thumb,
    required this.name,
    required this.description,
    required this.price,
    required this.special,
    required this.tax,
    required this.minimum,
    required this.rating,
    required this.href,
  });

  factory Relatedproduct.fromJson(Map<String, dynamic> json) => Relatedproduct(
        productId: json["product_id"],
        thumb: json["thumb"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        special: json["special"],
        tax: json["tax"],
        minimum: json["minimum"],
        rating: json["rating"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "thumb": thumb,
        "name": name,
        "description": description,
        "price": price,
        "special": special,
        "tax": tax,
        "minimum": minimum,
        "rating": rating,
        "href": href,
      };
}
