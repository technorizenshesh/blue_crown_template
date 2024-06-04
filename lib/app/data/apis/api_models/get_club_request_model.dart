class ClubRequestModel {
  ClubRequestResult? result;
  String? message;
  String? status;

  ClubRequestModel({this.result, this.message, this.status});

  ClubRequestModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null
        ? ClubRequestResult.fromJson(json['result'])
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

class ClubRequestResult {
  String? id;
  String? userId;
  String? name;
  String? style;
  String? description;
  String? image;
  String? fromDate;
  String? toDate;
  String? fromTime;
  String? minAge;
  String? maxAge;
  String? points;
  String? entranceCost;
  String? qrCode;
  String? status;
  String? dateTime;
  List<EventReqData>? eventReqData;

  ClubRequestResult(
      {this.id,
      this.userId,
      this.name,
      this.style,
      this.description,
      this.image,
      this.fromDate,
      this.toDate,
      this.fromTime,
      this.minAge,
      this.maxAge,
      this.points,
      this.entranceCost,
      this.qrCode,
      this.status,
      this.dateTime,
      this.eventReqData});

  ClubRequestResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    style = json['style'];
    description = json['description'];
    image = json['image'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    fromTime = json['from_time'];
    minAge = json['min_age'];
    maxAge = json['max_age'];
    points = json['points'];
    entranceCost = json['entrance_cost'];
    qrCode = json['qr_code'];
    status = json['status'];
    dateTime = json['date_time'];
    if (json['event_req_data'] != null) {
      eventReqData = <EventReqData>[];
      json['event_req_data'].forEach((v) {
        eventReqData!.add(EventReqData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['style'] = style;
    data['description'] = description;
    data['image'] = image;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['from_time'] = fromTime;
    data['min_age'] = minAge;
    data['max_age'] = maxAge;
    data['points'] = points;
    data['entrance_cost'] = entranceCost;
    data['qr_code'] = qrCode;
    data['status'] = status;
    data['date_time'] = dateTime;
    if (eventReqData != null) {
      data['event_req_data'] = eventReqData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventReqData {
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

  EventReqData(
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

  EventReqData.fromJson(Map<String, dynamic> json) {
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
