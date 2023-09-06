class Zone {
  bool? success;
  List<Zones>? zones;

  Zone({this.success, this.zones});

  Zone.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['Zones'] != null) {
      zones = <Zones>[];
      json['Zones'].forEach((v) {
        zones!.add(new Zones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.zones != null) {
      data['Zones'] = this.zones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Zones {
  String? zoneId;
  String? countryId;
  String? name;
  String? code;
  String? status;

  Zones({this.zoneId, this.countryId, this.name, this.code, this.status});

  Zones.fromJson(Map<String, dynamic> json) {
    zoneId = json['zone_id'];
    countryId = json['country_id'];
    name = json['name'];
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zone_id'] = this.zoneId;
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['status'] = this.status;
    return data;
  }
}
