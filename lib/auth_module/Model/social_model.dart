// class SocialModel {
//   SocialModel({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
//   late final int status;
//   late final String message;
//   late final Data data;

//   SocialModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = Data.fromJson(json['data']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }

// class Data {
//   Data({
//     required this.fullName,
//     required this.licenseNum,
//     required this.ssn,
//     required this.position,
//     required this.userImage,
//     required this.userAuthentication,
//     required this.userSocialToken,
//     required this.userSocialType,
//     required this.userDeviceType,
//     required this.userDeviceToken,
//     required this.userAddress,
//     required this.code,
//     required this.verified,
//     required this.role,
//     required this.isBlocked,
//     required this.id,
//     required this.appliedHospitals,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.V,
//     required this.userEmail,
//   });
//   late final String? fullName;
//   late final int? licenseNum;
//   late final int? ssn;
//   late final String? position;
//   late final String? userImage;
//   late final String? userAuthentication;
//   late final String? userSocialToken;
//   late final String? userSocialType;
//   late final String? userDeviceType;
//   late final String? userDeviceToken;
//   late final String? userAddress;
//   late final int? code;
//   late final int? verified;
//   late final String? role;
//   late final int? isBlocked;
//   late final String? id;
//   late final List<dynamic>? appliedHospitals;
//   late final String? createdAt;
//   late final String? updatedAt;
//   late final int? V;
//   late final String userEmail;

//   Data.fromJson(Map<String, dynamic> json) {
//     fullName = json['full_name'];
//     licenseNum = json['license_num'];
//     ssn = json['ssn'];
//     position = json['position'];
//     userImage = json['user_Image'];
//     userAuthentication = json['user_authentication'];
//     userSocialToken = json['user_social_token'];
//     userSocialType = json['user_social_type'];
//     userDeviceType = json['user_device_type'];
//     userDeviceToken = json['user_device_token'];
//     userAddress = json['user_address'];
//     code = null;
//     verified = json['verified'];
//     role = json['role'];
//     isBlocked = json['is_blocked'];
//     id = json['_id'];
//     appliedHospitals =
//         List.castFrom<dynamic, dynamic>(json['appliedHospitals']);
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     V = json['__v'];
//     userEmail = json['user_email'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['full_name'] = fullName;
//     _data['license_num'] = licenseNum;
//     _data['ssn'] = ssn;
//     _data['position'] = position;
//     _data['user_Image'] = userImage;
//     _data['user_authentication'] = userAuthentication;
//     _data['user_social_token'] = userSocialToken;
//     _data['user_social_type'] = userSocialType;
//     _data['user_device_type'] = userDeviceType;
//     _data['user_device_token'] = userDeviceToken;
//     _data['user_address'] = userAddress;
//     _data['code'] = code;
//     _data['verified'] = verified;
//     _data['role'] = role;
//     _data['is_blocked'] = isBlocked;
//     _data['_id'] = id;
//     _data['appliedHospitals'] = appliedHospitals;
//     _data['createdAt'] = createdAt;
//     _data['updatedAt'] = updatedAt;
//     _data['__v'] = V;
//     _data['user_email'] = userEmail;
//     return _data;
//   }
// }


class SocialModel {
  final int? status;
  final String? message;
  final Data? data;

  SocialModel({
    this.status,
    this.message,
    this.data,
  });

  SocialModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final dynamic fullName;
  final dynamic licenseNum;
  final dynamic ssn;
  final String? position;
  final String? userEmail;
  final dynamic userImage;
  final String? userAuthentication;
  final String? userSocialToken;
  final String? userSocialType;
  final String? userDeviceType;
  final String? userDeviceToken;
  final dynamic userAddress;
  final dynamic code;
  final int? verified;
  final String? role;
  final int? isBlocked;
  final String? id;
  final List<dynamic>? appliedHospitals;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Data({
    this.fullName,
    this.licenseNum,
    this.ssn,
    this.position,
    this.userEmail,
    this.userImage,
    this.userAuthentication,
    this.userSocialToken,
    this.userSocialType,
    this.userDeviceType,
    this.userDeviceToken,
    this.userAddress,
    this.code,
    this.verified,
    this.role,
    this.isBlocked,
    this.id,
    this.appliedHospitals,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Data.fromJson(Map<String, dynamic> json)
    : fullName = json['full_name'],
      licenseNum = json['license_num'],
      ssn = json['ssn'],
      position = json['position'] as String?,
      userEmail = json['user_email'] as String?,
      userImage = json['user_Image'],
      userAuthentication = json['user_authentication'] as String?,
      userSocialToken = json['user_social_token'] as String?,
      userSocialType = json['user_social_type'] as String?,
      userDeviceType = json['user_device_type'] as String?,
      userDeviceToken = json['user_device_token'] as String?,
      userAddress = json['user_address'],
      code = json['code'],
      verified = json['verified'] as int?,
      role = json['role'] as String?,
      isBlocked = json['is_blocked'] as int?,
      id = json['_id'] as String?,
      appliedHospitals = json['appliedHospitals'] as List?,
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    'full_name' : fullName,
    'license_num' : licenseNum,
    'ssn' : ssn,
    'position' : position,
    'user_email' : userEmail,
    'user_Image' : userImage,
    'user_authentication' : userAuthentication,
    'user_social_token' : userSocialToken,
    'user_social_type' : userSocialType,
    'user_device_type' : userDeviceType,
    'user_device_token' : userDeviceToken,
    'user_address' : userAddress,
    'code' : code,
    'verified' : verified,
    'role' : role,
    'is_blocked' : isBlocked,
    '_id' : id,
    'appliedHospitals' : appliedHospitals,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}