class UnitSchema {
  List<Data>? data;

  UnitSchema({this.data});

  UnitSchema.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? phone;
  String? coverImagePath;
  String? email;
  String? about;
  String? createdAt;
  String? updatedAt;
  List<Leadership>? leadership;

  Data(
      {this.id,
      this.stationId,
      this.title,
      this.phone,
      this.coverImagePath,
      this.email,
      this.about,
      this.createdAt,
      this.updatedAt,
      this.leadership});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    title = json['title'];
    phone = json['phone'];
    coverImagePath = json['cover_image_path'];
    email = json['email'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['leadership'] != null) {
      leadership = <Leadership>[];
      json['leadership'].forEach((v) {
        leadership!.add(Leadership.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['station_id'] = stationId;
    data['title'] = title;
    data['phone'] = phone;
    data['cover_image_path'] = coverImagePath;
    data['email'] = email;
    data['about'] = about;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (leadership != null) {
      data['leadership'] = leadership!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leadership {
  int? id;
  int? stationId;
  int? userId;
  int? unitId;
  String? position;
  int? status;
  String? start;
  String? end;
  String? about;
  String? createdAt;
  String? updatedAt;

  Leadership(
      {this.id,
      this.stationId,
      this.userId,
      this.unitId,
      this.position,
      this.status,
      this.start,
      this.end,
      this.about,
      this.createdAt,
      this.updatedAt});

  Leadership.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    userId = json['user_id'];
    unitId = json['unit_id'];
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
    data['unit_id'] = unitId;
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
// here