class Allproducts {
  bool? success;
  List<Products>? products;

  Allproducts({this.success, this.products});

  Allproducts.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? id;
  String? name;
  String? description;
  String? stockStatus;
  // Null? manufacturer;
  String? quantity;
  // int? reviews;
  String? price;
  String? href;
  String? thumb;
  dynamic special;
  int? rating;
  String? weight;
  String? weightClassId;
  String? weightClass;
  String? grossWeight;

  Products(
      {this.id,
        this.name,
        this.description,
        this.stockStatus,
        // this.manufacturer,
        this.quantity,
        // this.reviews,
        this.price,
        this.href,
        this.thumb,
        this.special,
        this.rating,
        this.weight,
        this.weightClassId,
        this.weightClass,
        this.grossWeight});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    stockStatus = json['stock_status'];
    // manufacturer = json['manufacturer'];
    quantity = json['quantity'];
    // reviews = json['reviews'];
    price = json['price'];
    href = json['href'];
    thumb = json['thumb'];
    special = json['special'];
    rating = json['rating'];
    weight = json['weight'];
    weightClassId = json['weight_class_id'];
    weightClass = json['weight_class'];
    grossWeight = json['gross_weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['stock_status'] = this.stockStatus;
    // data['manufacturer'] = this.manufacturer;
    data['quantity'] = this.quantity;
    // data['reviews'] = this.reviews;
    data['price'] = this.price;
    data['href'] = this.href;
    data['thumb'] = this.thumb;
    data['special'] = this.special;
    data['rating'] = this.rating;
    data['weight'] = this.weight;
    data['weight_class_id'] = this.weightClassId;
    data['weight_class'] = this.weightClass;
    data['gross_weight'] = this.grossWeight;
    return data;
  }
}