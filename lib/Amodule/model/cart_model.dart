// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  bool success;
  List<Cartproduct> cartproduct;

  Cart({
    required this.success,
    required this.cartproduct,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
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
  String productId;
  String name;
  String model;
  String shipping;
  String image;
  String jan;
  List<Option> option;
  List<dynamic> download;
  String quantity;
  String minimum;
  String subtract;
  bool stock;
  String delivery;
  String price;
  String total;
  int reward;
  int points;
  String taxClassId;
  int weight;
  String weightClassId;
  String weightClass;
  String length;
  String width;
  String height;
  String lengthClassId;
  bool recurring;

  Cartproduct({
    required this.cartId,
    required this.productId,
    required this.name,
    required this.model,
    required this.shipping,
    required this.image,
    required this.jan,
    required this.option,
    required this.download,
    required this.quantity,
    required this.minimum,
    required this.subtract,
    required this.stock,
    required this.delivery,
    required this.price,
    required this.total,
    required this.reward,
    required this.points,
    required this.taxClassId,
    required this.weight,
    required this.weightClassId,
    required this.weightClass,
    required this.length,
    required this.width,
    required this.height,
    required this.lengthClassId,
    required this.recurring,
  });

  factory Cartproduct.fromJson(Map<String, dynamic> json) => Cartproduct(
        cartId: json["cart_id"],
        productId: json["product_id"],
        name: json["name"],
        model: json["model"],
        shipping: json["shipping"],
        image: json["image"],
        jan: json["jan"],
        option:
            List<Option>.from(json["option"].map((x) => Option.fromJson(x))),
        download: List<dynamic>.from(json["download"].map((x) => x)),
        quantity: json["quantity"],
        minimum: json["minimum"],
        subtract: json["subtract"],
        stock: json["stock"],
        delivery: json["delivery"],
        price: json["price"],
        total: json["total"],
        reward: json["reward"],
        points: json["points"],
        taxClassId: json["tax_class_id"],
        weight: json["weight"],
        weightClassId: json["weight_class_id"],
        weightClass: json["weight_class"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        lengthClassId: json["length_class_id"],
        recurring: json["recurring"],
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "product_id": productId,
        "name": name,
        "model": model,
        "shipping": shipping,
        "image": image,
        "jan": jan,
        "option": List<dynamic>.from(option.map((x) => x.toJson())),
        "download": List<dynamic>.from(download.map((x) => x)),
        "quantity": quantity,
        "minimum": minimum,
        "subtract": subtract,
        "stock": stock,
        "delivery": delivery,
        "price": price,
        "total": total,
        "reward": reward,
        "points": points,
        "tax_class_id": taxClassId,
        "weight": weight,
        "weight_class_id": weightClassId,
        "weight_class": weightClass,
        "length": length,
        "width": width,
        "height": height,
        "length_class_id": lengthClassId,
        "recurring": recurring,
      };
}

class Option {
  String productOptionId;
  String productOptionValueId;
  String optionId;
  String optionValueId;
  String name;
  String value;
  String type;
  String quantity;
  String subtract;
  String price;
  String pricePrefix;
  String points;
  String pointsPrefix;
  String weight;
  String weightPrefix;

  Option({
    required this.productOptionId,
    required this.productOptionValueId,
    required this.optionId,
    required this.optionValueId,
    required this.name,
    required this.value,
    required this.type,
    required this.quantity,
    required this.subtract,
    required this.price,
    required this.pricePrefix,
    required this.points,
    required this.pointsPrefix,
    required this.weight,
    required this.weightPrefix,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        productOptionId: json["product_option_id"],
        productOptionValueId: json["product_option_value_id"],
        optionId: json["option_id"],
        optionValueId: json["option_value_id"],
        name: json["name"],
        value: json["value"],
        type: json["type"],
        quantity: json["quantity"],
        subtract: json["subtract"],
        price: json["price"],
        pricePrefix: json["price_prefix"],
        points: json["points"],
        pointsPrefix: json["points_prefix"],
        weight: json["weight"],
        weightPrefix: json["weight_prefix"],
      );

  Map<String, dynamic> toJson() => {
        "product_option_id": productOptionId,
        "product_option_value_id": productOptionValueId,
        "option_id": optionId,
        "option_value_id": optionValueId,
        "name": name,
        "value": value,
        "type": type,
        "quantity": quantity,
        "subtract": subtract,
        "price": price,
        "price_prefix": pricePrefix,
        "points": points,
        "points_prefix": pointsPrefix,
        "weight": weight,
        "weight_prefix": weightPrefix,
      };
}
