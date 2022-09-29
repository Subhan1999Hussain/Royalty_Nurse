class forgotModel {
  forgotModel({
    required this.status,
    required this.msg,
    required this.userId,
  });
  late final int status;
  late final String msg;
  late final String userId;
  
  forgotModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['userId'] = userId;
    return _data;
  }
}