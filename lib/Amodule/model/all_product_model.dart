// To parse this JSON data, do
//
//     final allproduct = allproductFromJson(jsonString);

import 'dart:convert';

Allproduct allproductFromJson(String str) =>
    Allproduct.fromJson(json.decode(str));

String allproductToJson(Allproduct data) => json.encode(data.toJson());

class Allproduct {
  bool success;
  List<Product> products;

  Allproduct({
    required this.success,
    required this.products,
  });

  factory Allproduct.fromJson(Map<String, dynamic> json) => Allproduct(
        success: json["success"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  String id;
  String name;
  String description;
  StockStatus stockStatus;
  String? manufacturer;
  String quantity;
  dynamic reviews;
  String price;
  String href;
  String thumb;
  dynamic special;
  int rating;
  String weight;
  String weightClassId;
  WeightClass weightClass;
  String grossWeight;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.stockStatus,
    required this.manufacturer,
    required this.quantity,
    required this.reviews,
    required this.price,
    required this.href,
    required this.thumb,
    required this.special,
    required this.rating,
    required this.weight,
    required this.weightClassId,
    required this.weightClass,
    required this.grossWeight,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        stockStatus: stockStatusValues.map[json["stock_status"]]!,
        manufacturer: json["manufacturer"],
        quantity: json["quantity"],
        reviews: json["reviews"],
        price: json["price"],
        href: json["href"],
        thumb: json["thumb"],
        special: json["special"],
        rating: json["rating"],
        weight: json["weight"],
        weightClassId: json["weight_class_id"],
        weightClass: weightClassValues.map[json["weight_class"]]!,
        grossWeight: json["gross_weight"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "stock_status": stockStatusValues.reverse[stockStatus],
        "manufacturer": manufacturer,
        "quantity": quantity,
        "reviews": reviews,
        "price": price,
        "href": href,
        "thumb": thumb,
        "special": special,
        "rating": rating,
        "weight": weight,
        "weight_class_id": weightClassId,
        "weight_class": weightClassValues.reverse[weightClass],
        "gross_weight": grossWeight,
      };
}

enum StockStatus { IN_STOCK, OUT_OF_STOCK, TOMORROW }

final stockStatusValues = EnumValues({
  "In Stock": StockStatus.IN_STOCK,
  "Out Of Stock": StockStatus.OUT_OF_STOCK,
  "Tomorrow": StockStatus.TOMORROW
});

enum WeightClass { G, KG }

final weightClassValues =
    EnumValues({"g": WeightClass.G, "kg": WeightClass.KG});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
