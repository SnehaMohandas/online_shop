// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  bool success;
  List<Searchresult> searchresult;

  Search({
    required this.success,
    required this.searchresult,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        success: json["success"],
        searchresult: List<Searchresult>.from(
            json["searchresult"].map((x) => Searchresult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "searchresult": List<dynamic>.from(searchresult.map((x) => x.toJson())),
      };
}

class Searchresult {
  String productId;
  String name;
  String image;
  String price;
  String? special;
  String stockStatus;
  String quantity;
  String weight;
  String weightClassId;
  String weightClass;
  String grossWeight;

  Searchresult({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.special,
    required this.stockStatus,
    required this.quantity,
    required this.weight,
    required this.weightClassId,
    required this.weightClass,
    required this.grossWeight,
  });

  factory Searchresult.fromJson(Map<String, dynamic> json) => Searchresult(
        productId: json["product_id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        special: json["special"],
        stockStatus: json["stock_status"],
        quantity: json["quantity"],
        weight: json["weight"],
        weightClassId: json["weight_class_id"],
        weightClass: json["weight_class"],
        grossWeight: json["gross_weight"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "image": image,
        "price": price,
        "special": special,
        "stock_status": stockStatus,
        "quantity": quantity,
        "weight": weight,
        "weight_class_id": weightClassId,
        "weight_class": weightClass,
        "gross_weight": grossWeight,
      };
}
