class LogUserSchema {
  String? apiToken;
  User? user;
  String? message;
  bool? status;

  LogUserSchema({this.apiToken, this.user, this.message, this.status});

  LogUserSchema.fromJson(Map<String, dynamic> json) {
    apiToken = json['apiToken'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apiToken'] = apiToken;
    if (user != String) {
      data['user'] = user!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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
