class UserSchema {
  Data? data;

  UserSchema({this.data});

  UserSchema.fromJson(Map<String, dynamic> json) {
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
  List<Unit>? unit;
  List<UnitLeader>? unitLeader;
  List<Souls>? souls;
  List<Report>? report;
  List<Assigned>? assigned;
  Homecell? homecell;
  HomecellLeaders? homecellLeaders;
  Station? station;

  Data(
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
      this.profilePhotoUrl,
      this.unit,
      this.unitLeader,
      this.souls,
      this.report,
      this.assigned,
      this.homecell,
      this.homecellLeaders,
      this.station});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['unit'] != null) {
      unit = <Unit>[];
      json['unit'].forEach((v) {
        unit!.add(Unit.fromJson(v));
      });
    }
    if (json['unit_leader'] != null) {
      unitLeader = <UnitLeader>[];
      json['unit_leader'].forEach((v) {
        unitLeader!.add(UnitLeader.fromJson(v));
      });
    }
    if (json['souls'] != null) {
      souls = <Souls>[];
      json['souls'].forEach((v) {
        souls!.add(Souls.fromJson(v));
      });
    }
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
    homecell = json['homecell'] != null
        ? Homecell.fromJson(json['homecell'])
        : null;
    homecellLeaders = json['homecell_leaders'] != null
        ? HomecellLeaders.fromJson(json['homecell_leaders'])
        : null;
    station =
        json['station'] != null ? Station.fromJson(json['station']) : null;
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
    if (unit != null) {
      data['unit'] = unit!.map((v) => v.toJson()).toList();
    }
    if (unitLeader != null) {
      data['unit_leader'] = unitLeader!.map((v) => v.toJson()).toList();
    }
    if (souls != null) {
      data['souls'] = souls!.map((v) => v.toJson()).toList();
    }
    if (report != null) {
      data['report'] = report!.map((v) => v.toJson()).toList();
    }
    if (assigned != null) {
      data['assigned'] = assigned!.map((v) => v.toJson()).toList();
    }
    if (homecell != null) {
      data['homecell'] = homecell!.toJson();
    }
    if (homecellLeaders != null) {
      data['homecell_leaders'] = homecellLeaders!.toJson();
    }
    if (station != null) {
      data['station'] = station!.toJson();
    }
    return data;
  }
}

class Unit {
  int? id;
  int? stationId;
  int? userId;
  int? unitId;
  String? createdAt;
  String? updatedAt;

  Unit(
      {this.id,
      this.stationId,
      this.userId,
      this.unitId,
      this.createdAt,
      this.updatedAt});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    userId = json['user_id'];
    unitId = json['unit_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['station_id'] = stationId;
    data['user_id'] = userId;
    data['unit_id'] = unitId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class UnitLeader {
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

  UnitLeader(
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

  UnitLeader.fromJson(Map<String, dynamic> json) {
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

class Souls {
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

  Souls(
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

  Souls.fromJson(Map<String, dynamic> json) {
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
    data['id'] = id;
    data['station_id'] = stationId;
    data['type'] = type;
    data['assigned_to'] = assignedTo;
    data['contact_id'] = contactId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Homecell {
  int? id;
  int? stationId;
  int? userId;
  int? homecellId;
  String? createdAt;
  String? updatedAt;

  Homecell(
      {this.id,
      this.stationId,
      this.userId,
      this.homecellId,
      this.createdAt,
      this.updatedAt});

  Homecell.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    userId = json['user_id'];
    homecellId = json['homecell_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['station_id'] = stationId;
    data['user_id'] = userId;
    data['homecell_id'] = homecellId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class HomecellLeaders {
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

  HomecellLeaders(
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

  HomecellLeaders.fromJson(Map<String, dynamic> json) {
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

class Station {
  int? id;
  String? phone;
  String? location;
  String? state;
  String? email;
  String? zonal;
  String? area;
  String? district;
  String? category;
  String? about;
  String? address;
  String? capacity;
  String? averageAttendance;
  String? averageIncome;
  String? hallCapacity;
  String? active;
  String? register;
  String? long;
  String? lat;
  String? createdAt;
  String? updatedAt;

  Station(
      {this.id,
      this.phone,
      this.location,
      this.state,
      this.email,
      this.zonal,
      this.area,
      this.district,
      this.category,
      this.about,
      this.address,
      this.capacity,
      this.averageAttendance,
      this.averageIncome,
      this.hallCapacity,
      this.active,
      this.register,
      this.long,
      this.lat,
      this.createdAt,
      this.updatedAt});

  Station.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    location = json['location'];
    state = json['state'];
    email = json['email'];
    zonal = json['zonal'];
    area = json['area'];
    district = json['district'];
    category = json['category'];
    about = json['about'];
    address = json['address'];
    capacity = json['capacity'];
    averageAttendance = json['average_attendance'];
    averageIncome = json['average_income'];
    hallCapacity = json['hall_capacity'];
    active = json['active'];
    register = json['register'];
    long = json['long'];
    lat = json['lat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phone'] = phone;
    data['location'] = location;
    data['state'] = state;
    data['email'] = email;
    data['zonal'] = zonal;
    data['area'] = area;
    data['district'] = district;
    data['category'] = category;
    data['about'] = about;
    data['address'] = address;
    data['capacity'] = capacity;
    data['average_attendance'] = averageAttendance;
    data['average_income'] = averageIncome;
    data['hall_capacity'] = hallCapacity;
    data['active'] = active;
    data['register'] = register;
    data['long'] = long;
    data['lat'] = lat;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
