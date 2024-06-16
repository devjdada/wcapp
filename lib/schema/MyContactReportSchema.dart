class MyContactReportSchema {
  List<Data>? data;

  MyContactReportSchema({this.data});

  MyContactReportSchema.fromJson(json) {
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
  int? soulId;
  int? userId;
  String? report;
  String? prayer;
  int? homecell;
  int? baptised;
  int? unit;
  int? lastService;
  int? foundationClass;
  String? exblish;
  int? bornAgain;
  String? createdAt;
  String? updatedAt;
  Soul? soul;

  Data(
      {this.id,
      this.stationId,
      this.soulId,
      this.userId,
      this.report,
      this.prayer,
      this.homecell,
      this.baptised,
      this.unit,
      this.lastService,
      this.foundationClass,
      this.exblish,
      this.bornAgain,
      this.createdAt,
      this.updatedAt,
      this.soul});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    soulId = json['soul_id'];
    userId = json['user_id'];
    report = json['report'];
    prayer = json['prayer'];
    homecell = json['homecell'];
    baptised = json['baptised'];
    unit = json['unit'];
    lastService = json['last_service'];
    foundationClass = json['foundation_class'];
    exblish = json['exblish'];
    bornAgain = json['born_again'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    soul = json['soul'] != null ? Soul.fromJson(json['soul']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['station_id'] = this.stationId;
    data['soul_id'] = this.soulId;
    data['user_id'] = this.userId;
    data['report'] = this.report;
    data['prayer'] = this.prayer;
    data['homecell'] = this.homecell;
    data['baptised'] = this.baptised;
    data['unit'] = this.unit;
    data['last_service'] = this.lastService;
    data['foundation_class'] = this.foundationClass;
    data['exblish'] = this.exblish;
    data['born_again'] = this.bornAgain;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.soul != null) {
      data['soul'] = this.soul!.toJson();
    }
    return data;
  }
}

class Soul {
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

  Soul(
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

  Soul.fromJson(Map<String, dynamic> json) {
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
    data['id'] = this.id;
    data['station_id'] = this.stationId;
    data['soul_winner'] = this.soulWinner;
    data['surname'] = this.surname;
    data['firstname'] = this.firstname;
    data['location'] = this.location;
    data['phone'] = this.phone;
    data['marital'] = this.marital;
    data['gender'] = this.gender;
    data['ocupation'] = this.ocupation;
    data['address'] = this.address;
    data['email'] = this.email;
    data['bus_stop'] = this.busStop;
    data['born_again'] = this.bornAgain;
    data['born_again_on'] = this.bornAgainOn;
    data['prayer_point'] = this.prayerPoint;
    data['type'] = this.type;
    data['fc'] = this.fc;
    data['wb'] = this.wb;
    data['exblish'] = this.exblish;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
