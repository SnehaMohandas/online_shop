// class Country {
//   bool? success;
//   List<Countries>? countries;

//   Country({this.success, this.countries});

//   Country.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     if (json['Countries'] != null) {
//       countries = <Countries>[];
//       json['Countries'].forEach((v) {
//         countries!.add(new Countries.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.countries != null) {
//       data['Countries'] = this.countries!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Countries {
//   String? countryId;
//   String? name;
//   String? isoCode2;
//   String? isoCode3;
//   String? addressFormat;
//   String? postcodeRequired;
//   String? status;

//   Countries(
//       {this.countryId,
//         this.name,
//         this.isoCode2,
//         this.isoCode3,
//         this.addressFormat,
//         this.postcodeRequired,
//         this.status});

//   Countries.fromJson(Map<String, dynamic> json) {
//     countryId = json['country_id'];
//     name = json['name'];
//     isoCode2 = json['iso_code_2'];
//     isoCode3 = json['iso_code_3'];
//     addressFormat = json['address_format'];
//     postcodeRequired = json['postcode_required'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['country_id'] = this.countryId;
//     data['name'] = this.name;
//     data['iso_code_2'] = this.isoCode2;
//     data['iso_code_3'] = this.isoCode3;
//     data['address_format'] = this.addressFormat;
//     data['postcode_required'] = this.postcodeRequired;
//     data['status'] = this.status;
//     return data;
//   }
// }