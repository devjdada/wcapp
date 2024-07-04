class BlogsSchema {
  List<Data>? data;

  BlogsSchema({this.data});

  BlogsSchema.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? slug;
  String? content;
  String? image;
  String? status;
  int? stationId;
  int? userId;
  int? posterId;
  String? dated;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.title,
      this.slug,
      this.content,
      this.image,
      this.status,
      this.stationId,
      this.userId,
      this.posterId,
      this.dated,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    content = json['content'];
    image = json['image'];
    status = json['status'];
    stationId = json['station_id'];
    userId = json['user_id'];
    posterId = json['poster_id'];
    dated = json['dated'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['content'] = content;
    data['image'] = image;
    data['status'] = status;
    data['station_id'] = stationId;
    data['user_id'] = userId;
    data['poster_id'] = posterId;
    data['dated'] = dated;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
