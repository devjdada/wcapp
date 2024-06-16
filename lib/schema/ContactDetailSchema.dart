class ContactDetailSchema {
  Data? data;

  ContactDetailSchema({this.data});

  ContactDetailSchema.fromJson(json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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
  Winner? winner;
  List<Report>? report;
  List<Assigned>? assigned;

  Data(
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
      this.updatedAt,
      this.winner,
      this.report,
      this.assigned});

  Data.fromJson(Map<String, dynamic> json) {
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
    winner = json['winner'] != null ? Winner.fromJson(json['winner']) : null;
    if (json['report'] != null) {
      report = <Report>[];
      json['report'].forEach((v) {
        report!.add(Report.fromJson(v));
      });
    }
    if (json['assigned'] != null) {
      assigned = <Assigned>[];
      json['assigned'].forEach((v) {
        assigned!.add(Assigned.fromJson(v));
      });
    }
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
    if (this.winner != null) {
      data['winner'] = this.winner!.toJson();
    }
    if (this.report != null) {
      data['report'] = this.report!.map((v) => v.toJson()).toList();
    }
    if (this.assigned != null) {
      data['assigned'] = this.assigned!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Winner {
  int? id;
  String? name;
  String? surname;
  String? firstname;
  String? marital;
  String? gender;
  String? email;
  String? phone;
  String? emailVerifiedAt;
  String? twoFactorConfirmedAt;
  String? address;
  String? dob;
  String? status;
  String? currentTeamId;
  int? stationId;
  String? profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? profilePhotoUrl;

  Winner(
      {this.id,
      this.name,
      this.surname,
      this.firstname,
      this.marital,
      this.gender,
      this.email,
      this.phone,
      this.emailVerifiedAt,
      this.twoFactorConfirmedAt,
      this.address,
      this.dob,
      this.status,
      this.currentTeamId,
      this.stationId,
      this.profilePhotoPath,
      this.createdAt,
      this.updatedAt,
      this.profilePhotoUrl});

  Winner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    firstname = json['firstname'];
    marital = json['marital'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    address = json['address'];
    dob = json['dob'];
    status = json['status'];
    currentTeamId = json['current_team_id'];
    stationId = json['station_id'];
    profilePhotoPath = json['profile_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['firstname'] = this.firstname;
    data['marital'] = this.marital;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['two_factor_confirmed_at'] = this.twoFactorConfirmedAt;
    data['address'] = this.address;
    data['dob'] = this.dob;
    data['status'] = this.status;
    data['current_team_id'] = this.currentTeamId;
    data['station_id'] = this.stationId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}

class Report {
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

  Report(
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
      this.updatedAt});

  Report.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Assigned {
  int? id;
  int? stationId;
  String? type;
  int? assignedTo;
  int? contactId;
  String? createdAt;
  String? updatedAt;

  Assigned(
      {this.id,
      this.stationId,
      this.type,
      this.assignedTo,
      this.contactId,
      this.createdAt,
      this.updatedAt});

  Assigned.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    type = json['type'];
    assignedTo = json['assigned_to'];
    contactId = json['contact_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['station_id'] = this.stationId;
    data['type'] = this.type;
    data['assigned_to'] = this.assignedTo;
    data['contact_id'] = this.contactId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
