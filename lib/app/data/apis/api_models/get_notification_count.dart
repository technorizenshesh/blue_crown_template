class NotificationCountModel {
  int? count;
  String? message;
  String? status;

  NotificationCountModel({this.count, this.message, this.status});

  NotificationCountModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
