class ClubInfoModel {
  ClubInfoResult? result;
  String? message;
  String? status;

  ClubInfoModel({this.result, this.message, this.status});

  ClubInfoModel.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? ClubInfoResult.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class ClubInfoResult {
  String? id;
  String? fullName;
  String? dob;
  String? email;
  String? password;
  String? image;
  String? registerId;
  String? socialId;
  String? type;
  String? userCategory;
  String? status;
  String? token;
  String? expiredAt;
  String? lastLogin;
  String? dateTime;
  String? mobile;
  String? wallet;
  String? iosRegisterId;
  String? lat;
  String? lon;
  String? address;
  String? otp;
  String? request;
  String? hostMember;
  List<Images>? images;

  ClubInfoResult(
      {this.id,
      this.fullName,
      this.dob,
      this.email,
      this.password,
      this.image,
      this.registerId,
      this.socialId,
      this.type,
      this.userCategory,
      this.status,
      this.token,
      this.expiredAt,
      this.lastLogin,
      this.dateTime,
      this.mobile,
      this.wallet,
      this.iosRegisterId,
      this.lat,
      this.lon,
      this.address,
      this.otp,
      this.request,
      this.hostMember,
      this.images});

  ClubInfoResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    dob = json['dob'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    registerId = json['register_id'];
    socialId = json['social_id'];
    type = json['type'];
    userCategory = json['user_category'];
    status = json['status'];
    token = json['token'];
    expiredAt = json['expired_at'];
    lastLogin = json['last_login'];
    dateTime = json['date_time'];
    mobile = json['mobile'];
    wallet = json['wallet'];
    iosRegisterId = json['ios_register_id'];
    lat = json['lat'];
    lon = json['lon'];
    address = json['address'];
    otp = json['otp'];
    request = json['request'];
    hostMember = json['host_member'];
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
    data['full_name'] = fullName;
    data['dob'] = dob;
    data['email'] = email;
    data['password'] = password;
    data['image'] = image;
    data['register_id'] = registerId;
    data['social_id'] = socialId;
    data['type'] = type;
    data['user_category'] = userCategory;
    data['status'] = status;
    data['token'] = token;
    data['expired_at'] = expiredAt;
    data['last_login'] = lastLogin;
    data['date_time'] = dateTime;
    data['mobile'] = mobile;
    data['wallet'] = wallet;
    data['ios_register_id'] = iosRegisterId;
    data['lat'] = lat;
    data['lon'] = lon;
    data['address'] = address;
    data['otp'] = otp;
    data['request'] = request;
    data['host_member'] = hostMember;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? id;
  String? userId;
  String? image;
  String? dateTime;

  Images({this.id, this.userId, this.image, this.dateTime});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['image'] = image;
    data['date_time'] = dateTime;
    return data;
  }
}
