class NotificationModel {
  final int? status;
  final String? msg;
  final List<Notification>? notification;

  NotificationModel({
    this.status,
    this.msg,
    this.notification,
  });

  NotificationModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      msg = json['msg'] as String?,
      notification = (json['notification'] as List?)?.map((dynamic e) => Notification.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'msg' : msg,
    'notification' : notification?.map((e) => e.toJson()).toList()
  };
}

class Notification {
  final String? id;
  final dynamic userDeviceToken;
  final String? title;
  final String? body;
  final String? notificationType;
  final String? senderId;
  final String? senderName;
  final String? senderImage;
  final String? receiverId;
  final String? date;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Notification({
    this.id,
    this.userDeviceToken,
    this.title,
    this.body,
    this.notificationType,
    this.senderId,
    this.senderName,
    this.senderImage,
    this.receiverId,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Notification.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      userDeviceToken = json['user_device_token'],
      title = json['title'] as String?,
      body = json['body'] as String?,
      notificationType = json['notification_type'] as String?,
      senderId = json['sender_id'] as String?,
      senderName = json['sender_name'] as String?,
      senderImage = json['sender_image'] as String?,
      receiverId = json['receiver_id'] as String?,
      date = json['date'] as String?,
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'user_device_token' : userDeviceToken,
    'title' : title,
    'body' : body,
    'notification_type' : notificationType,
    'sender_id' : senderId,
    'sender_name' : senderName,
    'sender_image' : senderImage,
    'receiver_id' : receiverId,
    'date' : date,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}