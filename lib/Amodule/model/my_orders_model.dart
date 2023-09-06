// To parse this JSON data, do
//
//     final myOrder = myOrderFromJson(jsonString);

import 'dart:convert';

MyOrder myOrderFromJson(String str) => MyOrder.fromJson(json.decode(str));

String myOrderToJson(MyOrder data) => json.encode(data.toJson());

class MyOrder {
  bool success;
  List<Order> orders;

  MyOrder({
    required this.success,
    required this.orders,
  });

  factory MyOrder.fromJson(Map<String, dynamic> json) => MyOrder(
        success: json["success"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  String orderId;
  String name;
  String status;
  String timeslot;
  DateTime dateAdded;
  String subTotal;
  dynamic discount;
  int products;
  String total;
  String currencyCode;
  String currencyValue;

  Order({
    required this.orderId,
    required this.name,
    required this.status,
    required this.timeslot,
    required this.dateAdded,
    required this.subTotal,
    required this.discount,
    required this.products,
    required this.total,
    required this.currencyCode,
    required this.currencyValue,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        name: json["name"],
        status: json["status"],
        timeslot: json["timeslot"],
        dateAdded: DateTime.parse(json["date_added"]),
        subTotal: json["sub_total"],
        discount: json["discount"],
        products: json["products"],
        total: json["total"],
        currencyCode: json["currency_code"],
        currencyValue: json["currency_value"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "name": name,
        "status": status,
        "timeslot": timeslot,
        "date_added": dateAdded.toIso8601String(),
        "sub_total": subTotal,
        "discount": discount,
        "products": products,
        "total": total,
        "currency_code": currencyCode,
        "currency_value": currencyValue,
      };
}
