class Headings {
  List<Featured>? featured;

  Headings({this.featured});

  Headings.fromJson(Map<String, dynamic> json) {
    if (json['featured'] != null) {
      featured = <Featured>[];
      json['featured'].forEach((v) {
        featured!.add(new Featured.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.featured != null) {
      data['featured'] = this.featured!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Featured {
  String? moduleId;
  String? name;
  String? code;
  String? setting;

  Featured({this.moduleId, this.name, this.code, this.setting});

  Featured.fromJson(Map<String, dynamic> json) {
    moduleId = json['module_id'];
    name = json['name'];
    code = json['code'];
    setting = json['setting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['module_id'] = this.moduleId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['setting'] = this.setting;
    return data;
  }
}
