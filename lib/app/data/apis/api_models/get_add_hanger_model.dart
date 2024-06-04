class AddHangerModel {
  AddHangerResult? result;
  String? message;
  String? status;

  AddHangerModel({this.result, this.message, this.status});

  AddHangerModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != '0') {
      result = AddHangerResult.fromJson(json['result']);
    } else {
      result = null;
    }
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

class AddHangerResult {
  String? id;
  String? name;
  String? clubId;
  String? qrcode;
  String? status;
  String? booked;
  String? dateTime;

  AddHangerResult(
      {this.id,
      this.name,
      this.clubId,
      this.qrcode,
      this.status,
      this.booked,
      this.dateTime});

  AddHangerResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    clubId = json['club_id'];
    qrcode = json['qrcode'];
    status = json['status'];
    booked = json['booked'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['club_id'] = clubId;
    data['qrcode'] = qrcode;
    data['status'] = status;
    data['booked'] = booked;
    data['date_time'] = dateTime;
    return data;
  }
}
