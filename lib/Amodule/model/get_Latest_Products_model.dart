class Latestproduct {
  bool? success;
  List<Latest>? latest;

  Latestproduct({this.success, this.latest});

  Latestproduct.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['Latest'] != null) {
      latest = <Latest>[];
      json['Latest'].forEach((v) {
        latest!.add(new Latest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.latest != null) {
      data['Latest'] = this.latest!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Latest {
  String? productId;
  String? thumb;
  String? name;
  String? description;
  String? price;
  bool? special;
  bool? tax;
  String? stockStatus;
  Null? manufacturer;
  int? rating;
  String? quantity;
  int? reviews;
  String? weight;
  String? weightClassId;
  String? weightClass;
  String? grossWeight;

  Latest(
      {this.productId,
        this.thumb,
        this.name,
        this.description,
        this.price,
        this.special,
        this.tax,
        this.stockStatus,
        this.manufacturer,
        this.rating,
        this.quantity,
        this.reviews,
        this.weight,
        this.weightClassId,
        this.weightClass,
        this.grossWeight});

  Latest.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    thumb = json['thumb'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    special = json['special'];
    tax = json['tax'];
    stockStatus = json['stock_status'];
    manufacturer = json['manufacturer'];
    rating = json['rating'];
    quantity = json['quantity'];
    reviews = json['reviews'];
    weight = json['weight'];
    weightClassId = json['weight_class_id'];
    weightClass = json['weight_class'];
    grossWeight = json['gross_weight'];
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
    data['manufacturer'] = this.manufacturer;
    data['rating'] = this.rating;
    data['quantity'] = this.quantity;
    data['reviews'] = this.reviews;
    data['weight'] = this.weight;
    data['weight_class_id'] = this.weightClassId;
    data['weight_class'] = this.weightClass;
    data['gross_weight'] = this.grossWeight;
    return data;
  }
}