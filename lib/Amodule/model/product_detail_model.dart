// class ProductDetail {
//   bool? success;
//   Product? product;

//   ProductDetail({this.success, this.product});

//   ProductDetail.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     product =
//         json['product'] != null ? new Product.fromJson(json['product']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.product != null) {
//       data['product'] = this.product!.toJson();
//     }
//     return data;
//   }
// }

// class Product {
//   String? id;
//   String? name;
//   String? description;
//   String? metaTitle;
//   String? metaDescription;
//   String? metaKeyword;
//   String? tag;
//   String? model;
//   String? sku;
//   String? upc;
//   String? ean;
//   String? jan;
//   String? isbn;
//   String? mpn;
//   String? location;
//   String? quantity;
//   String? stockStatus;
//   Null? manufacturerId;
//   Null? manufacturer;
//   Null? reward;
//   String? points;
//   String? dateAvailable;
//   String? taxClassId;
//   String? weight;
//   String? weightClassId;
//   String? weightClass;
//   String? length;
//   String? width;
//   String? height;
//   String? lengthClassId;
//   String? subtract;
//   int? reviews;
//   String? minimum;
//   String? sortOrder;
//   String? status;
//   String? dateAdded;
//   String? dateModified;
//   String? viewed;
//   String? price;
//   String? href;
//   String? thumb;
//   bool? special;
//   int? rating;

//   Product(
//       {this.id,
//       this.name,
//       this.description,
//       this.metaTitle,
//       this.metaDescription,
//       this.metaKeyword,
//       this.tag,
//       this.model,
//       this.sku,
//       this.upc,
//       this.ean,
//       this.jan,
//       this.isbn,
//       this.mpn,
//       this.location,
//       this.quantity,
//       this.stockStatus,
//       this.manufacturerId,
//       this.manufacturer,
//       this.reward,
//       this.points,
//       this.dateAvailable,
//       this.taxClassId,
//       this.weight,
//       this.weightClassId,
//       this.weightClass,
//       this.length,
//       this.width,
//       this.height,
//       this.lengthClassId,
//       this.subtract,
//       this.reviews,
//       this.minimum,
//       this.sortOrder,
//       this.status,
//       this.dateAdded,
//       this.dateModified,
//       this.viewed,
//       this.price,
//       this.href,
//       this.thumb,
//       this.special,
//       this.rating});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     metaTitle = json['meta_title'];
//     metaDescription = json['meta_description'];
//     metaKeyword = json['meta_keyword'];
//     tag = json['tag'];
//     model = json['model'];
//     sku = json['sku'];
//     upc = json['upc'];
//     ean = json['ean'];
//     jan = json['jan'];
//     isbn = json['isbn'];
//     mpn = json['mpn'];
//     location = json['location'];
//     quantity = json['quantity'];
//     stockStatus = json['stock_status'];
//     manufacturerId = json['manufacturer_id'];
//     manufacturer = json['manufacturer'];
//     reward = json['reward'];
//     points = json['points'];
//     dateAvailable = json['date_available'];
//     taxClassId = json['tax_class_id'];
//     weight = json['weight'];
//     weightClassId = json['weight_class_id'];
//     weightClass = json['weight_class'];
//     length = json['length'];
//     width = json['width'];
//     height = json['height'];
//     lengthClassId = json['length_class_id'];
//     subtract = json['subtract'];
//     reviews = json['reviews'];
//     minimum = json['minimum'];
//     sortOrder = json['sort_order'];
//     status = json['status'];
//     dateAdded = json['date_added'];
//     dateModified = json['date_modified'];
//     viewed = json['viewed'];
//     price = json['price'];
//     href = json['href'];
//     thumb = json['thumb'];
//     special = json['special'];
//     rating = json['rating'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['meta_title'] = this.metaTitle;
//     data['meta_description'] = this.metaDescription;
//     data['meta_keyword'] = this.metaKeyword;
//     data['tag'] = this.tag;
//     data['model'] = this.model;
//     data['sku'] = this.sku;
//     data['upc'] = this.upc;
//     data['ean'] = this.ean;
//     data['jan'] = this.jan;
//     data['isbn'] = this.isbn;
//     data['mpn'] = this.mpn;
//     data['location'] = this.location;
//     data['quantity'] = this.quantity;
//     data['stock_status'] = this.stockStatus;
//     data['manufacturer_id'] = this.manufacturerId;
//     data['manufacturer'] = this.manufacturer;
//     data['reward'] = this.reward;
//     data['points'] = this.points;
//     data['date_available'] = this.dateAvailable;
//     data['tax_class_id'] = this.taxClassId;
//     data['weight'] = this.weight;
//     data['weight_class_id'] = this.weightClassId;
//     data['weight_class'] = this.weightClass;
//     data['length'] = this.length;
//     data['width'] = this.width;
//     data['height'] = this.height;
//     data['length_class_id'] = this.lengthClassId;
//     data['subtract'] = this.subtract;
//     data['reviews'] = this.reviews;
//     data['minimum'] = this.minimum;
//     data['sort_order'] = this.sortOrder;
//     data['status'] = this.status;
//     data['date_added'] = this.dateAdded;
//     data['date_modified'] = this.dateModified;
//     data['viewed'] = this.viewed;
//     data['price'] = this.price;
//     data['href'] = this.href;
//     data['thumb'] = this.thumb;
//     data['special'] = this.special;
//     data['rating'] = this.rating;
//     return data;
//   }
// }
