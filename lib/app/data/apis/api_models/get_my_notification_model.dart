class MyNotificationModel {
  List<MyNotificationResult>? result;
  String? message;
  String? status;

  MyNotificationModel({this.result, this.message, this.status});

  MyNotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <MyNotificationResult>[];
      json['result'].forEach((v) {
        result!.add(MyNotificationResult.fromJson(v));
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

class MyNotificationResult {
  String? id;
  String? userId;
  String? title;
  String? body;
  String? datetime;

  MyNotificationResult(
      {this.id, this.userId, this.title, this.body, this.datetime});

  MyNotificationResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    body = json['body'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['body'] = body;
    data['datetime'] = datetime;
    return data;
  }
}
