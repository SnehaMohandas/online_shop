// To parse this JSON data, do
//
//     final additionalProductDetail = additionalProductDetailFromJson(jsonString);

import 'dart:convert';

AdditionalProductDetail additionalProductDetailFromJson(String str) =>
    AdditionalProductDetail.fromJson(json.decode(str));

String additionalProductDetailToJson(AdditionalProductDetail data) =>
    json.encode(data.toJson());

class AdditionalProductDetail {
  bool success;
  ProductsProdadditional productsProdadditional;

  AdditionalProductDetail({
    required this.success,
    required this.productsProdadditional,
  });

  factory AdditionalProductDetail.fromJson(Map<String, dynamic> json) =>
      AdditionalProductDetail(
        success: json["success"],
        productsProdadditional:
            ProductsProdadditional.fromJson(json["products_prodadditional"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "products_prodadditional": productsProdadditional.toJson(),
      };
}

class ProductsProdadditional {
  List<AddImg> addImgs;
  List<dynamic> reviewsdata;
  List<dynamic> discountsdata;

  ProductsProdadditional({
    required this.addImgs,
    required this.reviewsdata,
    required this.discountsdata,
  });

  factory ProductsProdadditional.fromJson(Map<String, dynamic> json) =>
      ProductsProdadditional(
        addImgs:
            List<AddImg>.from(json["add_imgs"].map((x) => AddImg.fromJson(x))),
        reviewsdata: List<dynamic>.from(json["reviewsdata"].map((x) => x)),
        discountsdata: List<dynamic>.from(json["discountsdata"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "add_imgs": List<dynamic>.from(addImgs.map((x) => x.toJson())),
        "reviewsdata": List<dynamic>.from(reviewsdata.map((x) => x)),
        "discountsdata": List<dynamic>.from(discountsdata.map((x) => x)),
      };
}

class AddImg {
  String productImageId;
  String productId;
  String image;
  String sortOrder;

  AddImg({
    required this.productImageId,
    required this.productId,
    required this.image,
    required this.sortOrder,
  });

  factory AddImg.fromJson(Map<String, dynamic> json) => AddImg(
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
