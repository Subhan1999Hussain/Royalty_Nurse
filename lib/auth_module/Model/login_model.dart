// class LoginModel {
//   LoginModel({
//     required this.status,
//     required this.msg,
//     required this.data,
//   });
//   late final int status;
//   late final String msg;
//   late final Data data;
  
//   LoginModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     msg = json['msg'];
//     data = Data.fromJson(json['data']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['msg'] = msg;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }

// class Data {
//   Data({
//     required this.id,
//     required this.code,
//     required this.verified,
//     required this.token,
//     required this.fullName,
//     required this.userImage,
//     required this.userEmail,
//     required this.ssn,
//     required this.licenseNum,
//     required this.position,
//   });
//   late final String? id;
//   late final int? code;
//   late final int? verified;
//   late final String? token;
//   late final String? fullName;
//   late final String? userImage;
//   late final String? userEmail;
//   late final String? ssn;
//   late final String? licenseNum;
//   late final String? position;
  
//   Data.fromJson(Map<String, dynamic> json){
//     id = json['_id'];
//     code = null;
//     verified = json['verified'];
//     token = json['token'];
//     fullName = json['full_name'];
//     userImage = json['user_Image'];
//     userEmail = json['user_email'];
//     ssn = json['ssn'];
//     licenseNum = json['license_num'];
//     position = json['position'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['_id'] = id;
//     _data['code'] = code;
//     _data['verified'] = verified;
//     _data['token'] = token;
//     _data['full_name'] = fullName;
//     _data['user_Image'] = userImage;
//     _data['user_email'] = userEmail;
//     _data['ssn'] = ssn;
//     _data['license_num'] = licenseNum;
//     _data['position'] = position;
//     return _data;
//   }
// }


class LoginModel {
  final int? status;
  final String? msg;
  final Data? data;

  LoginModel({
    this.status,
    this.msg,
    this.data,
  });

  LoginModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      msg = json['msg'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'msg' : msg,
    'data' : data?.toJson()
  };
}

class Data {
  final String? id;
  final int? code;
  final int? verified;
  final String? token;
  final dynamic fullName;
  final dynamic userImage;
  final String? userEmail;
  final dynamic ssn;
  final dynamic licenseNum;
  final String? position;

  Data({
    this.id,
    this.code,
    this.verified,
    this.token,
    this.fullName,
    this.userImage,
    this.userEmail,
    this.ssn,
    this.licenseNum,
    this.position,
  });

  Data.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      code = json['code'] as int?,
      verified = json['verified'] as int?,
      token = json['token'] as String?,
      fullName = json['full_name'],
      userImage = json['user_Image'],
      userEmail = json['user_email'] as String?,
      ssn = json['ssn'],
      licenseNum = json['license_num'],
      position = json['position'] as String?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'code' : code,
    'verified' : verified,
    'token' : token,
    'full_name' : fullName,
    'user_Image' : userImage,
    'user_email' : userEmail,
    'ssn' : ssn,
    'license_num' : licenseNum,
    'position' : position
  };
}