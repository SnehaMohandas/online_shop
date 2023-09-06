// To parse this JSON data, do
//
//     final addtoCart = addtoCartFromJson(jsonString);

import 'dart:convert';

AddtoCart addtoCartFromJson(String str) => AddtoCart.fromJson(json.decode(str));

String addtoCartToJson(AddtoCart data) => json.encode(data.toJson());

class AddtoCart {
  bool success;
  List<Cartproduct> cartproduct;

  AddtoCart({
    required this.success,
    required this.cartproduct,
  });

  factory AddtoCart.fromJson(Map<String, dynamic> json) => AddtoCart(
        success: json["success"],
        cartproduct: List<Cartproduct>.from(
            json["cartproduct"].map((x) => Cartproduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "cartproduct": List<dynamic>.from(cartproduct.map((x) => x.toJson())),
      };
}

class Cartproduct {
  String cartId;
  String customerId;
  String sessionId;
  String productId;
  String recurringId;
  String option;
  String quantity;
  DateTime dateAdded;

  Cartproduct({
    required this.cartId,
    required this.customerId,
    required this.sessionId,
    required this.productId,
    required this.recurringId,
    required this.option,
    required this.quantity,
    required this.dateAdded,
  });

  factory Cartproduct.fromJson(Map<String, dynamic> json) => Cartproduct(
        cartId: json["cart_id"],
        customerId: json["customer_id"],
        sessionId: json["session_id"],
        productId: json["product_id"],
        recurringId: json["recurring_id"],
        option: json["option"],
        quantity: json["quantity"],
        dateAdded: DateTime.parse(json["date_added"]),
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "customer_id": customerId,
        "session_id": sessionId,
        "product_id": productId,
        "recurring_id": recurringId,
        "option": option,
        "quantity": quantity,
        "date_added": dateAdded.toIso8601String(),
      };
}
