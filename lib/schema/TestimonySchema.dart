class TestimonySchema {
  List<Data>? data;

  TestimonySchema({this.data});

  TestimonySchema.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? email;
  String? phone;
  String? title;
  String? testimony;
  String? image;
  String? status;
  int? stationId;
  int? userId;
  int? posterId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.title,
      this.testimony,
      this.image,
      this.status,
      this.stationId,
      this.userId,
      this.posterId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    title = json['title'];
    testimony = json['testimony'];
    image = json['image'];
    status = json['status'];
    stationId = json['station_id'];
    userId = json['user_id'];
    posterId = json['poster_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['title'] = title;
    data['testimony'] = testimony;
    data['image'] = image;
    data['status'] = status;
    data['station_id'] = stationId;
    data['user_id'] = userId;
    data['poster_id'] = posterId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
