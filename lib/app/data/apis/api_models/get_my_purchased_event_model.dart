class GetMyPurchasingEventModel {
  List<GetMyPurchasingEventResult>? result;
  String? message;
  String? status;

  GetMyPurchasingEventModel({this.result, this.message, this.status});

  GetMyPurchasingEventModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetMyPurchasingEventResult>[];
      json['result'].forEach((v) {
        result!.add(GetMyPurchasingEventResult.fromJson(v));
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

class GetMyPurchasingEventResult {
  String? id;
  String? userId;
  String? eventId;
  String? amount;
  String? dateTime;
  String? clubId;
  String? fullName;
  String? eventName;
  String? fromDate;
  String? toDate;
  String? fromTime;
  String? image;

  GetMyPurchasingEventResult(
      {this.id,
      this.userId,
      this.eventId,
      this.amount,
      this.dateTime,
      this.clubId,
      this.fullName,
      this.eventName,
      this.fromDate,
      this.toDate,
      this.fromTime,
      this.image});

  GetMyPurchasingEventResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    eventId = json['event_id'];
    amount = json['amount'];
    dateTime = json['date_time'];
    clubId = json['club_id'];
    fullName = json['full_name'];
    eventName = json['event_name'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    fromTime = json['from_time'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['event_id'] = eventId;
    data['amount'] = amount;
    data['date_time'] = dateTime;
    data['club_id'] = clubId;
    data['full_name'] = fullName;
    data['event_name'] = eventName;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['from_time'] = fromTime;
    data['image'] = image;
    return data;
  }
}
