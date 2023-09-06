
class Categories {
  String? categoryId;
  String? name;
  String? image;
  dynamic icon; // Can accept a Map<String, dynamic> or a String
  String? description;
  String? parentId;
  String? status;

  Categories({
    this.categoryId,
    this.name,
    this.image,
    this.icon,
    this.description,
    this.parentId,
    this.status,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    if (json['icon'] is String) {
      icon = json['icon']; // Assign the String value directly
    } else {
      icon = json['icon'] as Map<String, dynamic>; // Assign the Map<String, dynamic> value
    }
    description = json['description'];
    parentId = json['parent_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['name'] = name;
    data['image'] = image;
    data['icon'] = icon;
    data['description'] = description;
    data['parent_id'] = parentId;
    data['status'] = status;
    return data;
  }
}


// class Categories {
//   bool? success;
//   List<CategoryInfo>? categoryInfo;
//
//   Categories({this.success, this.categoryInfo});
//
//   Categories.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     if (json['category_info'] != null) {
//       categoryInfo = <CategoryInfo>[];
//       json['category_info'].forEach((v) {
//         categoryInfo!.add(CategoryInfo.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['success'] = success;
//     if (categoryInfo != null) {
//       data['category_info'] = categoryInfo!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class CategoryInfo {
//   String? categoryId;
//   String? name;
//   String? image;
//   dynamic icon;
//   String? description;
//   String? parentId;
//   String? status;
//
//   CategoryInfo({
//     this.categoryId,
//     this.name,
//     this.image,
//     this.icon,
//     this.description,
//     this.parentId,
//     this.status,
//   });
//
//   CategoryInfo.fromJson(Map<String, dynamic> json) {
//     categoryId = json['category_id'];
//     name = json['name'];
//     image = json['image'];
//     icon = json['icon'];
//     description = json['description'];
//     parentId = json['parent_id'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['category_id'] = categoryId;
//     data['name'] = name;
//     data['image'] = image;
//     data['icon'] = icon;
//     data['description'] = description;
//     data['parent_id'] = parentId;
//     data['status'] = status;
//     return data;
//   }
// }