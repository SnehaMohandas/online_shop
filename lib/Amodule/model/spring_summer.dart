class Springsummer {
  bool? success;
  List<Feature>? feature;

  Springsummer({this.success, this.feature});

  Springsummer.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['Feature'] != null) {
      feature = <Feature>[];
      json['Feature'].forEach((v) {
        feature!.add(new Feature.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.feature != null) {
      data['Feature'] = this.feature!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Feature {
  String? productId;
  String? thumb;
  String? name;
  String? description;
  String? price;
  dynamic? special;
  bool? tax;
  String? stockStatus;
  String? stockTitle;
  Null? manufacturer;
  int? rating;
  String? weight;
  String? weightClassId;
  String? weightClass;
  String? quantity;
  int? reviews;
  String? grossWeight;
  String? href;

  Feature(
      {this.productId,
        this.thumb,
        this.name,
        this.description,
        this.price,
        this.special,
        this.tax,
        this.stockStatus,
        this.stockTitle,
        this.manufacturer,
        this.rating,
        this.weight,
        this.weightClassId,
        this.weightClass,
        this.quantity,
        this.reviews,
        this.grossWeight,
        this.href});

  Feature.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    thumb = json['thumb'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    special = json['special'];
    tax = json['tax'];
    stockStatus = json['stock_status'];
    stockTitle = json['stock_title'];
    manufacturer = json['manufacturer'];
    rating = json['rating'];
    weight = json['weight'];
    weightClassId = json['weight_class_id'];
    weightClass = json['weight_class'];
    quantity = json['quantity'];
    reviews = json['reviews'];
    grossWeight = json['gross_weight'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['thumb'] = this.thumb;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['special'] = this.special;
    data['tax'] = this.tax;
    data['stock_status'] = this.stockStatus;
    data['stock_title'] = this.stockTitle;
    data['manufacturer'] = this.manufacturer;
    data['rating'] = this.rating;
    data['weight'] = this.weight;
    data['weight_class_id'] = this.weightClassId;
    data['weight_class'] = this.weightClass;
    data['quantity'] = this.quantity;
    data['reviews'] = this.reviews;
    data['gross_weight'] = this.grossWeight;
    data['href'] = this.href;
    return data;
  }
}
