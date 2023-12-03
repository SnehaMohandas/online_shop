// // To parse this JSON data, do
// //
// //     final productDetails = productDetailsFromJson(jsonString);

// import 'dart:convert';

// ProductDetails productDetailsFromJson(String str) =>
//     ProductDetails.fromJson(json.decode(str));

// String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

// class ProductDetails {
//   bool success;
//   Product product;

//   ProductDetails({
//     required this.success,
//     required this.product,
//   });

//   factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
//         success: json["success"],
//         product: Product.fromJson(json["product"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "product": product.toJson(),
//       };
// }

// class Product {
//   String id;
//   String name;
//   String description;
//   String metaTitle;
//   String metaDescription;
//   String metaKeyword;
//   String tag;
//   String model;
//   String sku;
//   String upc;
//   String ean;
//   String jan;
//   String isbn;
//   String mpn;
//   String location;
//   String quantity;
//   String stockStatus;
//   dynamic manufacturerId;
//   dynamic manufacturer;
//   dynamic reward;
//   String points;
//   DateTime dateAvailable;
//   String taxClassId;
//   String weight;
//   String weightClassId;
//   String weightClass;
//   String length;
//   String width;
//   String height;
//   String lengthClassId;
//   String subtract;
//   dynamic reviews;
//   String minimum;
//   String sortOrder;
//   String status;
//   DateTime dateAdded;
//   DateTime dateModified;
//   String viewed;
//   String price;
//   String href;
//   String thumb;
//   dynamic special;
//   int rating;

//   Product({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.metaTitle,
//     required this.metaDescription,
//     required this.metaKeyword,
//     required this.tag,
//     required this.model,
//     required this.sku,
//     required this.upc,
//     required this.ean,
//     required this.jan,
//     required this.isbn,
//     required this.mpn,
//     required this.location,
//     required this.quantity,
//     required this.stockStatus,
//     required this.manufacturerId,
//     required this.manufacturer,
//     required this.reward,
//     required this.points,
//     required this.dateAvailable,
//     required this.taxClassId,
//     required this.weight,
//     required this.weightClassId,
//     required this.weightClass,
//     required this.length,
//     required this.width,
//     required this.height,
//     required this.lengthClassId,
//     required this.subtract,
//     required this.reviews,
//     required this.minimum,
//     required this.sortOrder,
//     required this.status,
//     required this.dateAdded,
//     required this.dateModified,
//     required this.viewed,
//     required this.price,
//     required this.href,
//     required this.thumb,
//     required this.special,
//     required this.rating,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         metaTitle: json["meta_title"],
//         metaDescription: json["meta_description"],
//         metaKeyword: json["meta_keyword"],
//         tag: json["tag"],
//         model: json["model"],
//         sku: json["sku"],
//         upc: json["upc"],
//         ean: json["ean"],
//         jan: json["jan"],
//         isbn: json["isbn"],
//         mpn: json["mpn"],
//         location: json["location"],
//         quantity: json["quantity"],
//         stockStatus: json["stock_status"],
//         manufacturerId: json["manufacturer_id"],
//         manufacturer: json["manufacturer"],
//         reward: json["reward"],
//         points: json["points"],
//         dateAvailable: DateTime.parse(json["date_available"]),
//         taxClassId: json["tax_class_id"],
//         weight: json["weight"],
//         weightClassId: json["weight_class_id"],
//         weightClass: json["weight_class"],
//         length: json["length"],
//         width: json["width"],
//         height: json["height"],
//         lengthClassId: json["length_class_id"],
//         subtract: json["subtract"],
//         reviews: json["reviews"],
//         minimum: json["minimum"],
//         sortOrder: json["sort_order"],
//         status: json["status"],
//         dateAdded: DateTime.parse(json["date_added"]),
//         dateModified: DateTime.parse(json["date_modified"]),
//         viewed: json["viewed"],
//         price: json["price"],
//         href: json["href"],
//         thumb: json["thumb"],
//         special: json["special"],
//         rating: json["rating"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "meta_title": metaTitle,
//         "meta_description": metaDescription,
//         "meta_keyword": metaKeyword,
//         "tag": tag,
//         "model": model,
//         "sku": sku,
//         "upc": upc,
//         "ean": ean,
//         "jan": jan,
//         "isbn": isbn,
//         "mpn": mpn,
//         "location": location,
//         "quantity": quantity,
//         "stock_status": stockStatus,
//         "manufacturer_id": manufacturerId,
//         "manufacturer": manufacturer,
//         "reward": reward,
//         "points": points,
//         "date_available":
//             "${dateAvailable.year.toString().padLeft(4, '0')}-${dateAvailable.month.toString().padLeft(2, '0')}-${dateAvailable.day.toString().padLeft(2, '0')}",
//         "tax_class_id": taxClassId,
//         "weight": weight,
//         "weight_class_id": weightClassId,
//         "weight_class": weightClass,
//         "length": length,
//         "width": width,
//         "height": height,
//         "length_class_id": lengthClassId,
//         "subtract": subtract,
//         "reviews": reviews,
//         "minimum": minimum,
//         "sort_order": sortOrder,
//         "status": status,
//         "date_added": dateAdded.toIso8601String(),
//         "date_modified": dateModified.toIso8601String(),
//         "viewed": viewed,
//         "price": price,
//         "href": href,
//         "thumb": thumb,
//         "special": special,
//         "rating": rating,
//       };
// }

// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

OrgProductDetails OrgProductDetailsFromJson(String str) =>
    OrgProductDetails.fromJson(json.decode(str));

String OrgProductDetailsToJson(OrgProductDetails data) =>
    json.encode(data.toJson());

class OrgProductDetails {
  bool success;
  Product product;

  OrgProductDetails({
    required this.success,
    required this.product,
  });

  factory OrgProductDetails.fromJson(Map<String, dynamic> json) =>
      OrgProductDetails(
        success: json["success"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "product": product.toJson(),
      };
}

class Product {
  String id;
  String name;
  String description;
  String metaTitle;
  String metaDescription;
  String metaKeyword;
  String tag;
  String model;
  String sku;
  String upc;
  String ean;
  String jan;
  String isbn;
  String mpn;
  String location;
  String quantity;
  String stockStatus;
  dynamic manufacturerId;
  dynamic manufacturer;
  dynamic reward;
  String points;
  DateTime dateAvailable;
  String taxClassId;
  String weight;
  String weightClassId;
  String weightClass;
  String length;
  String width;
  String height;
  String lengthClassId;
  String subtract;
  dynamic reviews;
  String minimum;
  String sortOrder;
  String status;
  DateTime dateAdded;
  DateTime dateModified;
  String viewed;
  String price;
  String href;
  String thumb;
  List<Extraimage> extraimage;
  dynamic special;
  int rating;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeyword,
    required this.tag,
    required this.model,
    required this.sku,
    required this.upc,
    required this.ean,
    required this.jan,
    required this.isbn,
    required this.mpn,
    required this.location,
    required this.quantity,
    required this.stockStatus,
    required this.manufacturerId,
    required this.manufacturer,
    required this.reward,
    required this.points,
    required this.dateAvailable,
    required this.taxClassId,
    required this.weight,
    required this.weightClassId,
    required this.weightClass,
    required this.length,
    required this.width,
    required this.height,
    required this.lengthClassId,
    required this.subtract,
    required this.reviews,
    required this.minimum,
    required this.sortOrder,
    required this.status,
    required this.dateAdded,
    required this.dateModified,
    required this.viewed,
    required this.price,
    required this.href,
    required this.thumb,
    required this.extraimage,
    required this.special,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeyword: json["meta_keyword"],
        tag: json["tag"],
        model: json["model"],
        sku: json["sku"],
        upc: json["upc"],
        ean: json["ean"],
        jan: json["jan"],
        isbn: json["isbn"],
        mpn: json["mpn"],
        location: json["location"],
        quantity: json["quantity"],
        stockStatus: json["stock_status"],
        manufacturerId: json["manufacturer_id"],
        manufacturer: json["manufacturer"],
        reward: json["reward"],
        points: json["points"],
        dateAvailable: DateTime.parse(json["date_available"]),
        taxClassId: json["tax_class_id"],
        weight: json["weight"],
        weightClassId: json["weight_class_id"],
        weightClass: json["weight_class"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        lengthClassId: json["length_class_id"],
        subtract: json["subtract"],
        reviews: json["reviews"],
        minimum: json["minimum"],
        sortOrder: json["sort_order"],
        status: json["status"],
        dateAdded: DateTime.parse(json["date_added"]),
        dateModified: DateTime.parse(json["date_modified"]),
        viewed: json["viewed"],
        price: json["price"],
        href: json["href"],
        thumb: json["thumb"],
        extraimage: List<Extraimage>.from(
            json["extraimage"].map((x) => Extraimage.fromJson(x))),
        special: json["special"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keyword": metaKeyword,
        "tag": tag,
        "model": model,
        "sku": sku,
        "upc": upc,
        "ean": ean,
        "jan": jan,
        "isbn": isbn,
        "mpn": mpn,
        "location": location,
        "quantity": quantity,
        "stock_status": stockStatus,
        "manufacturer_id": manufacturerId,
        "manufacturer": manufacturer,
        "reward": reward,
        "points": points,
        "date_available":
            "${dateAvailable.year.toString().padLeft(4, '0')}-${dateAvailable.month.toString().padLeft(2, '0')}-${dateAvailable.day.toString().padLeft(2, '0')}",
        "tax_class_id": taxClassId,
        "weight": weight,
        "weight_class_id": weightClassId,
        "weight_class": weightClass,
        "length": length,
        "width": width,
        "height": height,
        "length_class_id": lengthClassId,
        "subtract": subtract,
        "reviews": reviews,
        "minimum": minimum,
        "sort_order": sortOrder,
        "status": status,
        "date_added": dateAdded.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "viewed": viewed,
        "price": price,
        "href": href,
        "thumb": thumb,
        "extraimage": List<dynamic>.from(extraimage.map((x) => x.toJson())),
        "special": special,
        "rating": rating,
      };
}

class Extraimage {
  String productImageId;
  String productId;
  String image;
  String sortOrder;

  Extraimage({
    required this.productImageId,
    required this.productId,
    required this.image,
    required this.sortOrder,
  });

  factory Extraimage.fromJson(Map<String, dynamic> json) => Extraimage(
        productImageId: json["product_image_id"],
        productId: json["product_id"],
        image: json["image"],
        sortOrder: json["sort_order"],
      );

  Map<String, dynamic> toJson() => {
        "product_image_id": productImageId,
        "product_id": productId,
        "image": image,
        "sort_order": sortOrder,
      };
}
