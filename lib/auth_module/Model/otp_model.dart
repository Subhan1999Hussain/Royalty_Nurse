
 class OtpModel {
  OtpModel({
    required this.status,
    required this.msg,
    required this.token,
  });
  late final int? status;
  late final String? msg;
  late final String? token;
  
  OtpModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['token'] = token;
    return _data;
  }
}
