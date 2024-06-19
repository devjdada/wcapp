class HomecellsSchema {
  List<Data>? data;

  HomecellsSchema({this.data});

  HomecellsSchema.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? stationId;
  int? districtId;
  int? provinceId;
  String? phone;
  String? title;
  String? about;
  String? address;
  String? createdAt;
  String? updatedAt;
  District? district;
  Province? province;
  List<Leaders>? leaders;

  Data(
      {this.id,
      this.stationId,
      this.districtId,
      this.provinceId,
      this.phone,
      this.title,
      this.about,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.district,
      this.province,
      this.leaders});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    districtId = json['district_id'];
    provinceId = json['province_id'];
    phone = json['phone'];
    title = json['title'];
    about = json['about'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    district =
        json['district'] != null ? District.fromJson(json['district']) : null;
    province =
        json['province'] != null ? Province.fromJson(json['province']) : null;
    if (json['leaders'] != null) {
      leaders = <Leaders>[];
      json['leaders'].forEach((v) {
        leaders!.add(Leaders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['station_id'] = stationId;
    data['district_id'] = districtId;
    data['province_id'] = provinceId;
    data['phone'] = phone;
    data['title'] = title;
    data['about'] = about;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (province != null) {
      data['province'] = province!.toJson();
    }
    if (leaders != null) {
      data['leaders'] = leaders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class District {
  int? id;
  int? stationId;
  int? provinceId;
  String? phone;
  String? title;
  String? about;
  String? address;
  String? createdAt;
  String? updatedAt;

  District(
      {this.id,
      this.stationId,
      this.provinceId,
      this.phone,
      this.title,
      this.about,
      this.address,
      this.createdAt,
      this.updatedAt});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    provinceId = json['province_id'];
    phone = json['phone'];
    title = json['title'];
    about = json['about'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['station_id'] = stationId;
    data['province_id'] = provinceId;
    data['phone'] = phone;
    data['title'] = title;
    data['about'] = about;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Province {
  int? id;
  int? stationId;
  String? title;
  String? phone;
  String? about;
  String? address;
  String? createdAt;
  String? updatedAt;

  Province(
      {this.id,
      this.stationId,
      this.title,
      this.phone,
      this.about,
      this.address,
      this.createdAt,
      this.updatedAt});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    title = json['title'];
    phone = json['phone'];
    about = json['about'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['station_id'] = stationId;
    data['title'] = title;
    data['phone'] = phone;
    data['about'] = about;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Leaders {
  int? id;
  int? stationId;
  int? userId;
  int? homecellId;
  String? position;
  int? status;
  String? start;
  String? end;
  String? about;
  String? createdAt;
  String? updatedAt;

  Leaders(
      {this.id,
      this.stationId,
      this.userId,
      this.homecellId,
      this.position,
      this.status,
      this.start,
      this.end,
      this.about,
      this.createdAt,
      this.updatedAt});

  Leaders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    userId = json['user_id'];
    homecellId = json['homecell_id'];
    position = json['position'];
    status = json['status'];
    start = json['start'];
    end = json['end'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['station_id'] = stationId;
    data['user_id'] = userId;
    data['homecell_id'] = homecellId;
    data['position'] = position;
    data['status'] = status;
    data['start'] = start;
    data['end'] = end;
    data['about'] = about;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
