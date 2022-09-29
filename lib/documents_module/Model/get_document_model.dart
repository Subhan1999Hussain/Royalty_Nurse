
class DocumentModel {
  final int? status;
  final String? message;
  final List<Documents>? data;

  DocumentModel({
    this.status,
    this.message,
    this.data,
  });

  DocumentModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?,
      data = (json['data'] as List?)?.map((dynamic e) => Documents.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Documents {
  final String? document;
  final int? status;
  final String? name;
  final String? model;

  Documents({
    this.document,
    this.status,
    this.name,
    this.model,
  });

  Documents.fromJson(Map<String, dynamic> json)
    : document = json['document'] as String?,
      status = json['status'] as int?,
      name = json['name'] as String?,
      model = json['model'] as String?;

  Map<String, dynamic> toJson() => {
    'document' : document,
    'status' : status,
    'name' : name,
    'model' : model
  };
}