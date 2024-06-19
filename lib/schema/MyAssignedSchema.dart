class MyAssignedSchema {
  List<Data>? data;

  MyAssignedSchema({this.data});

  MyAssignedSchema.fromJson(Map<String, dynamic> json) {
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
  String? type;
  int? assignedTo;
  int? contactId;
  String? createdAt;
  String? updatedAt;
  Contact? contact;

  Data(
      {this.id,
      this.stationId,
      this.type,
      this.assignedTo,
      this.contactId,
      this.createdAt,
      this.updatedAt,
      this.contact});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    type = json['type'];
    assignedTo = json['assigned_to'];
    contactId = json['contact_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    contact =
        json['contact'] != null ? Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['station_id'] = stationId;
    data['type'] = type;
    data['assigned_to'] = assignedTo;
    data['contact_id'] = contactId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (contact != null) {
      data['contact'] = contact!.toJson();
    }
    return data;
  }
}

class Contact {
  int? id;
  int? stationId;
  int? soulWinner;
  String? surname;
  String? firstname;
  String? location;
  String? phone;
  String? marital;
  String? gender;
  String? ocupation;
  String? address;
  String? email;
  String? busStop;
  String? bornAgain;
  String? bornAgainOn;
  String? prayerPoint;
  String? type;
  String? fc;
  String? wb;
  String? exblish;
  String? createdAt;
  String? updatedAt;

  Contact(
      {this.id,
      this.stationId,
      this.soulWinner,
      this.surname,
      this.firstname,
      this.location,
      this.phone,
      this.marital,
      this.gender,
      this.ocupation,
      this.address,
      this.email,
      this.busStop,
      this.bornAgain,
      this.bornAgainOn,
      this.prayerPoint,
      this.type,
      this.fc,
      this.wb,
      this.exblish,
      this.createdAt,
      this.updatedAt});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    soulWinner = json['soul_winner'];
    surname = json['surname'];
    firstname = json['firstname'];
    location = json['location'];
    phone = json['phone'];
    marital = json['marital'];
    gender = json['gender'];
    ocupation = json['ocupation'];
    address = json['address'];
    email = json['email'];
    busStop = json['bus_stop'];
    bornAgain = json['born_again'];
    bornAgainOn = json['born_again_on'];
    prayerPoint = json['prayer_point'];
    type = json['type'];
    fc = json['fc'];
    wb = json['wb'];
    exblish = json['exblish'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['station_id'] = stationId;
    data['soul_winner'] = soulWinner;
    data['surname'] = surname;
    data['firstname'] = firstname;
    data['location'] = location;
    data['phone'] = phone;
    data['marital'] = marital;
    data['gender'] = gender;
    data['ocupation'] = ocupation;
    data['address'] = address;
    data['email'] = email;
    data['bus_stop'] = busStop;
    data['born_again'] = bornAgain;
    data['born_again_on'] = bornAgainOn;
    data['prayer_point'] = prayerPoint;
    data['type'] = type;
    data['fc'] = fc;
    data['wb'] = wb;
    data['exblish'] = exblish;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
