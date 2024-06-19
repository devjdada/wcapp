class ContactDetailSchema {
  Soul? soul;
  List<Assigned>? assigned;
  List<Report>? report;

  ContactDetailSchema({this.soul, this.assigned, this.report});

  ContactDetailSchema.fromJson(Map<String, dynamic> json) {
    soul = json['soul'] != null ? Soul.fromJson(json['soul']) : null;
    if (json['assigned'] != null) {
      assigned = <Assigned>[];
      json['assigned'].forEach((v) {
        assigned!.add(Assigned.fromJson(v));
      });
    }
    if (json['report'] != null) {
      report = <Report>[];
      json['report'].forEach((v) {
        report!.add(Report.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (soul != null) {
      data['soul'] = soul!.toJson();
    }
    if (assigned != null) {
      data['assigned'] = assigned!.map((v) => v.toJson()).toList();
    }
    if (report != null) {
      data['report'] = report!.map((v) => v.toJson()).toList();
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
  Winner? winner;

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
      this.updatedAt,
      this.winner});

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
    winner = json['winner'] != null ? Winner.fromJson(json['winner']) : null;
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
    if (winner != null) {
      data['winner'] = winner!.toJson();
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
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['firstname'] = firstname;
    data['marital'] = marital;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['email_verified_at'] = emailVerifiedAt;
    data['two_factor_confirmed_at'] = twoFactorConfirmedAt;
    data['address'] = address;
    data['dob'] = dob;
    data['status'] = status;
    data['current_team_id'] = currentTeamId;
    data['station_id'] = stationId;
    data['profile_photo_path'] = profilePhotoPath;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_photo_url'] = profilePhotoUrl;
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
  Winner? assignTo;

  Assigned(
      {this.id,
      this.stationId,
      this.type,
      this.assignedTo,
      this.contactId,
      this.createdAt,
      this.updatedAt,
      this.assignTo});

  Assigned.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    type = json['type'];
    assignedTo = json['assigned_to'];
    contactId = json['contact_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    assignTo =
        json['assign_to'] != null ? Winner.fromJson(json['assign_to']) : null;
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
    if (assignTo != null) {
      data['assign_to'] = assignTo!.toJson();
    }
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
  Winner? reportBy;

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
      this.updatedAt,
      this.reportBy});

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
    reportBy =
        json['report_by'] != null ? Winner.fromJson(json['report_by']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['station_id'] = stationId;
    data['soul_id'] = soulId;
    data['user_id'] = userId;
    data['report'] = report;
    data['prayer'] = prayer;
    data['homecell'] = homecell;
    data['baptised'] = baptised;
    data['unit'] = unit;
    data['last_service'] = lastService;
    data['foundation_class'] = foundationClass;
    data['exblish'] = exblish;
    data['born_again'] = bornAgain;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (reportBy != null) {
      data['report_by'] = reportBy!.toJson();
    }
    return data;
  }
}
