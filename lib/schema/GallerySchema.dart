class GallerySchema {
  List<Data>? data;

  GallerySchema({this.data});

  GallerySchema.fromJson(Map<String, dynamic> json) {
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
  String? image;
  String? title;
  String? description;
  String? status;
  int? stationId;
  int? posterId;
  String? createdAt;
  String? updatedAt;
  List<Images>? images;

  Data(
      {this.id,
      this.image,
      this.title,
      this.description,
      this.status,
      this.stationId,
      this.posterId,
      this.createdAt,
      this.updatedAt,
      this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    stationId = json['station_id'];
    posterId = json['poster_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    data['status'] = status;
    data['station_id'] = stationId;
    data['poster_id'] = posterId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  String? image;
  Null? title;
  int? galleriesId;
  String? createdAt;
  String? updatedAt;

  Images(
      {this.id,
      this.image,
      this.title,
      this.galleriesId,
      this.createdAt,
      this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    galleriesId = json['galleries_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['galleries_id'] = galleriesId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
