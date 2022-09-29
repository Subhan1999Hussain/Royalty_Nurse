class ResendModel {
  ResendModel({
    required this.status,
    required this.msg,
    required this.code,
  });
  late final int status;
  late final String msg;
  late final int code;

  ResendModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['code'] = code;
    return _data;
  }
}
