class ProfleModel {
  final int? status;
  final String? msg;
  final User? user;

  ProfleModel({
    this.status,
    this.msg,
    this.user,
  });

  ProfleModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        msg = json['msg'] as String?,
        user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'status': status, 'msg': msg, 'user': user?.toJson()};
}

class User {
  final String? id;
  final dynamic fullName;
  final String? licenseNum;
  final String? ssn;
  final String? position;
  final dynamic userImage;
  final String? role;
  final int? v;
  final String? userEmail;

  User({
    this.id,
    this.fullName,
    this.licenseNum,
    this.ssn,
    this.position,
    this.userImage,
    this.role,
    this.v,
    this.userEmail,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        fullName = json['full_name'],
        licenseNum = json['license_num'] as String?,
        ssn = json['ssn'] as String?,
        position = json['position'] as String?,
        userImage = json['user_Image'],
        role = json['role'] as String?,
        v = json['__v'] as int?,
        userEmail = json['user_email'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'full_name': fullName,
        'license_num': licenseNum,
        'ssn': ssn,
        'position': position,
        'user_Image': userImage,
        'role': role,
        '__v': v,
        'user_email': userEmail
      };
}
