class GetRequestModel {
  List<GetRequestResult>? result;
  String? message;
  String? status;

  GetRequestModel({this.result, this.message, this.status});

  GetRequestModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetRequestResult>[];
      json['result'].forEach((v) {
        result!.add(GetRequestResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetRequestResult {
  String? id;
  String? userId;
  String? eventId;
  String? name;
  String? email;
  String? phone;
  String? manual;
  String? dateTime;
  String? people;
  String? type;
  String? status;
  String? eventName;
  String? fromDate;
  String? fromTime;
  String? image;

  GetRequestResult(
      {this.id,
      this.userId,
      this.eventId,
      this.name,
      this.email,
      this.phone,
      this.manual,
      this.dateTime,
      this.people,
      this.type,
      this.status,
      this.eventName,
      this.fromDate,
      this.fromTime,
      this.image});

  GetRequestResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    eventId = json['event_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    manual = json['manual'];
    dateTime = json['date_time'];
    people = json['people'];
    type = json['type'];
    status = json['status'];
    eventName = json['event_name'];
    fromDate = json['from_date'];
    fromTime = json['from_time'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['event_id'] = eventId;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['manual'] = manual;
    data['date_time'] = dateTime;
    data['people'] = people;
    data['type'] = type;
    data['status'] = status;
    data['event_name'] = eventName;
    data['from_date'] = fromDate;
    data['from_time'] = fromTime;
    data['image'] = image;
    return data;
  }
}
