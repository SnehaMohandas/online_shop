// To parse this JSON data, do
//
//     final banners = bannersFromJson(jsonString);

import 'dart:convert';

Banners bannersFromJson(String str) => Banners.fromJson(json.decode(str));

String bannersToJson(Banners data) => json.encode(data.toJson());

class Banners {
  bool success;
  List<Banner> banners;

  Banners({
    required this.success,
    required this.banners,
  });

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        success: json["success"],
        banners:
            List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
      };
}

class Banner {
  String bannerImageId;
  String bannerId;
  String link;
  String image;
  String sortOrder;
  String languageId;
  String title;

  Banner({
    required this.bannerImageId,
    required this.bannerId,
    required this.link,
    required this.image,
    required this.sortOrder,
    required this.languageId,
    required this.title,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        bannerImageId: json["banner_image_id"],
        bannerId: json["banner_id"],
        link: json["link"],
        image: json["image"],
        sortOrder: json["sort_order"],
        languageId: json["language_id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "banner_image_id": bannerImageId,
        "banner_id": bannerId,
        "link": link,
        "image": image,
        "sort_order": sortOrder,
        "language_id": languageId,
        "title": title,
      };
}
