// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  bool success;
  Userdata userdata;

  Register({
    required this.success,
    required this.userdata,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        success: json["success"],
        userdata: Userdata.fromJson(json["userdata"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "userdata": userdata.toJson(),
      };
}

class Userdata {
  String customerId;
  String customerGroupId;
  String storeId;
  String firstname;
  String lastname;
  String email;
  String telephone;
  String fax;
  String password;
  String salt;
  dynamic cart;
  dynamic wishlist;
  String newsletter;
  String addressId;
  String customField;
  String ip;
  String status;
  String approved;
  String safe;
  String token;
  DateTime dateAdded;
  String customerGroup;

  Userdata({
    required this.customerId,
    required this.customerGroupId,
    required this.storeId,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.telephone,
    required this.fax,
    required this.password,
    required this.salt,
    required this.cart,
    required this.wishlist,
    required this.newsletter,
    required this.addressId,
    required this.customField,
    required this.ip,
    required this.status,
    required this.approved,
    required this.safe,
    required this.token,
    required this.dateAdded,
    required this.customerGroup,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        customerId: json["customer_id"],
        customerGroupId: json["customer_group_id"],
        storeId: json["store_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        telephone: json["telephone"],
        fax: json["fax"],
        password: json["password"],
        salt: json["salt"],
        cart: json["cart"],
        wishlist: json["wishlist"],
        newsletter: json["newsletter"],
        addressId: json["address_id"],
        customField: json["custom_field"],
        ip: json["ip"],
        status: json["status"],
        approved: json["approved"],
        safe: json["safe"],
        token: json["token"],
        dateAdded: DateTime.parse(json["date_added"]),
        customerGroup: json["customer_group"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "customer_group_id": customerGroupId,
        "store_id": storeId,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "telephone": telephone,
        "fax": fax,
        "password": password,
        "salt": salt,
        "cart": cart,
        "wishlist": wishlist,
        "newsletter": newsletter,
        "address_id": addressId,
        "custom_field": customField,
        "ip": ip,
        "status": status,
        "approved": approved,
        "safe": safe,
        "token": token,
        "date_added": dateAdded.toIso8601String(),
        "customer_group": customerGroup,
      };
}
