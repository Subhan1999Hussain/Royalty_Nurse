  class SignupModel {
  SignupModel({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final int status;
  late final String msg;
  late final Data data;
  
  SignupModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.token,
    required this.id,
    required this.code,
  });
  late final String token;
  late final String id;
  late final int code;
  
  Data.fromJson(Map<String, dynamic> json){
    token = json['token'];
    id = json['_id'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['_id'] = id;
    _data['code'] = code;
    return _data;
  }
}