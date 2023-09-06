// To parse this JSON data, do
//
//     final favorites = favoritesFromJson(jsonString);

import 'dart:convert';

Favorites favoritesFromJson(String str) => Favorites.fromJson(json.decode(str));

String favoritesToJson(Favorites data) => json.encode(data.toJson());

class Favorites {
  bool success;
  List<Wishlist> wishlist;

  Favorites({
    required this.success,
    required this.wishlist,
  });

  factory Favorites.fromJson(Map<String, dynamic> json) => Favorites(
        success: json["success"],
        wishlist: List<Wishlist>.from(
            json["wishlist"].map((x) => Wishlist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "wishlist": List<dynamic>.from(wishlist.map((x) => x.toJson())),
      };
}

class Wishlist {
  String productId;
  String thumb;
  String name;
  String stock;
  String price;
  dynamic special;

  Wishlist({
    required this.productId,
    required this.thumb,
    required this.name,
    required this.stock,
    required this.price,
    required this.special,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        productId: json["product_id"],
        thumb: json["thumb"],
        name: json["name"],
        stock: json["stock"],
        price: json["price"],
        special: json["special"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "thumb": thumb,
        "name": name,
        "stock": stock,
        "price": price,
        "special": special,
      };
}
