// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  bool success;
  List<Ordersproduct> ordersproducts;

  Orders({
    required this.success,
    required this.ordersproducts,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        success: json["success"],
        ordersproducts: List<Ordersproduct>.from(
            json["ordersproducts"].map((x) => Ordersproduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "ordersproducts":
            List<dynamic>.from(ordersproducts.map((x) => x.toJson())),
      };
}

class Ordersproduct {
  String orderProductId;
  String orderId;
  String productId;
  String name;
  String model;
  String quantity;
  String price;
  String total;
  String tax;
  String reward;
  String images;

  Ordersproduct({
    required this.orderProductId,
    required this.orderId,
    required this.productId,
    required this.name,
    required this.model,
    required this.quantity,
    required this.price,
    required this.total,
    required this.tax,
    required this.reward,
    required this.images,
  });

  factory Ordersproduct.fromJson(Map<String, dynamic> json) => Ordersproduct(
        orderProductId: json["order_product_id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        name: json["name"],
        model: json["model"],
        quantity: json["quantity"],
        price: json["price"],
        total: json["total"],
        tax: json["tax"],
        reward: json["reward"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "order_product_id": orderProductId,
        "order_id": orderId,
        "product_id": productId,
        "name": name,
        "model": model,
        "quantity": quantity,
        "price": price,
        "total": total,
        "tax": tax,
        "reward": reward,
        "images": images,
      };
}
