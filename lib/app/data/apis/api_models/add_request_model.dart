class AddRequestModel {
  AddRequestResult? result;
  String? message;
  String? status;

  AddRequestModel({this.result, this.message, this.status});

  AddRequestModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null
        ? AddRequestResult.fromJson(json['result'])
        : null;
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

class AddRequestResult {
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

  AddRequestResult(
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
      this.status});

  AddRequestResult.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
