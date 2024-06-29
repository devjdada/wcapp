class UserSchema {
  Homecell? homecell;
  List<Units>? units;
  Me? me;

  UserSchema({this.homecell, this.units, this.me});

  UserSchema.fromJson(Map<String, dynamic> json) {
    homecell =
        json['homecell'] != null ? Homecell.fromJson(json['homecell']) : null;
    if (json['units'] != null) {
      units = <Units>[];
      json['units'].forEach((v) {
        units!.add(Units.fromJson(v));
      });
    }
    me = json['me'] != null ? Me.fromJson(json['me']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (homecell != null) {
      data['homecell'] = homecell!.toJson();
    }
    if (units != null) {
      data['units'] = units!.map((v) => v.toJson()).toList();
    }
    if (me != null) {
      data['me'] = me!.toJson();
    }
    return data;
  }
}

class Homecell {
  int? id;
  int? stationId;
  int? districtId;
  int? provinceId;
  String? phone;
  String? title;
  String? about;
  String? address;
  String? createdAt;
  String? updatedAt;
  District? district;
  Province? province;
  List<Leaders>? leaders;

  Homecell(
      {this.id,
      this.stationId,
      this.districtId,
      this.provinceId,
      this.phone,
      this.title,
      this.about,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.district,
      this.province,
      this.leaders});

  Homecell.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    districtId = json['district_id'];
    provinceId = json['province_id'];
    phone = json['phone'];
    title = json['title'];
    about = json['about'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    district =
        json['district'] != null ? District.fromJson(json['district']) : null;
    province =
        json['province'] != null ? Province.fromJson(json['province']) : null;
    if (json['leaders'] != null) {
      leaders = <Leaders>[];
      json['leaders'].forEach((v) {
        leaders!.add(Leaders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['station_id'] = stationId;
    data['district_id'] = districtId;
    data['province_id'] = provinceId;
    data['phone'] = phone;
    data['title'] = title;
    data['about'] = about;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (province != null) {
      data['province'] = province!.toJson();
    }
    if (leaders != null) {
      data['leaders'] = leaders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class District {
  int? id;
  int? stationId;
  int? provinceId;
  String? phone;
  String? title;
  String? about;
  String? address;
  String? createdAt;
  String? updatedAt;

  District(
      {this.id,
      this.stationId,
      this.provinceId,
      this.phone,
      this.title,
      this.about,
      this.address,
      this.createdAt,
      this.updatedAt});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    provinceId = json['province_id'];
    phone = json['phone'];
    title = json['title'];
    about = json['about'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['station_id'] = stationId;
    data['province_id'] = provinceId;
    data['phone'] = phone;
    data['title'] = title;
    data['about'] = about;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Province {
  int? id;
  int? stationId;
  String? title;
  String? phone;
  String? about;
  String? address;
  String? createdAt;
  String? updatedAt;

  Province(
      {this.id,
      this.stationId,
      this.title,
      this.phone,
      this.about,
      this.address,
      this.createdAt,
      this.updatedAt});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    title = json['title'];
    phone = json['phone'];
    about = json['about'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['station_id'] = stationId;
    data['title'] = title;
    data['phone'] = phone;
    data['about'] = about;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Leaders {
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

  Leaders(
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

  Leaders.fromJson(Map<String, dynamic> json) {
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

class Units {
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

  Units(
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

  Units.fromJson(Map<String, dynamic> json) {
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

class Me {
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
  List<AsUnitLeader>? asUnitLeader;
  List<Souls>? souls;
  List<Report>? report;
  List<Assigned>? assigned;
  Leaders? homecellLeaders;
  Station? station;

  Me(
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
      this.asUnitLeader,
      this.souls,
      this.report,
      this.assigned,
      this.homecellLeaders,
      this.station});

  Me.fromJson(Map<String, dynamic> json) {
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
    if (json['as_unit_leader'] != null) {
      asUnitLeader = <AsUnitLeader>[];
      json['as_unit_leader'].forEach((v) {
        asUnitLeader!.add(AsUnitLeader.fromJson(v));
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
    homecellLeaders = json['homecell_leaders'] != null
        ? Leaders.fromJson(json['homecell_leaders'])
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
    if (asUnitLeader != null) {
      data['as_unit_leader'] = asUnitLeader!.map((v) => v.toJson()).toList();
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
    if (homecellLeaders != null) {
      data['homecell_leaders'] = homecellLeaders!.toJson();
    }
    if (station != null) {
      data['station'] = station!.toJson();
    }
    return data;
  }
}

class AsUnitLeader {
  int? id;
  String? name;

  AsUnitLeader({this.id, this.name});

  AsUnitLeader.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
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
  String? occupation;
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
      this.occupation,
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
    occupation = json['occupation'];
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
    data['occupation'] = occupation;
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
