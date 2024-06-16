class StationBasicSchema {
  List<Data>? data;

  StationBasicSchema({this.data});

  StationBasicSchema.fromJson(Map<String, dynamic> json) {
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
  String? location;
  String? phone;
  String? email;

  Data({this.id, this.location, this.phone, this.email});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['location'] = location;
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}
