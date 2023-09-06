class Addresslist {
  bool? success;
  List<Addressesdata>? addressesdata;

  Addresslist({this.success, this.addressesdata});

  Addresslist.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['addressesdata'] != null) {
      addressesdata = <Addressesdata>[];
      json['addressesdata'].forEach((v) {
        addressesdata!.add(new Addressesdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.addressesdata != null) {
      data['addressesdata'] =
          this.addressesdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addressesdata {
  String? addressId;
  String? firstname;
  String? lastname;
  String? company;
  String? address1;
  String? address2;
  String? postcode;
  String? city;
  String? zoneId;
  String? zone;
  String? zoneCode;
  String? countryId;
  String? country;
  String? isoCode2;
  String? isoCode3;
  String? addressFormat;
  bool? customField;

  Addressesdata(
      {this.addressId,
        this.firstname,
        this.lastname,
        this.company,
        this.address1,
        this.address2,
        this.postcode,
        this.city,
        this.zoneId,
        this.zone,
        this.zoneCode,
        this.countryId,
        this.country,
        this.isoCode2,
        this.isoCode3,
        this.addressFormat,
        this.customField});

  Addressesdata.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    postcode = json['postcode'];
    city = json['city'];
    zoneId = json['zone_id'];
    zone = json['zone'];
    zoneCode = json['zone_code'];
    countryId = json['country_id'];
    country = json['country'];
    isoCode2 = json['iso_code_2'];
    isoCode3 = json['iso_code_3'];
    addressFormat = json['address_format'];
    customField = json['custom_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['company'] = this.company;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['postcode'] = this.postcode;
    data['city'] = this.city;
    data['zone_id'] = this.zoneId;
    data['zone'] = this.zone;
    data['zone_code'] = this.zoneCode;
    data['country_id'] = this.countryId;
    data['country'] = this.country;
    data['iso_code_2'] = this.isoCode2;
    data['iso_code_3'] = this.isoCode3;
    data['address_format'] = this.addressFormat;
    data['custom_field'] = this.customField;
    return data;
  }
}
