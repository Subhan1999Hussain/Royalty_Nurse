class UploadDocumentModel {
  final int? status;
  final String? msg;
  final UpdateDoc? updateDoc;

  UploadDocumentModel({
    this.status,
    this.msg,
    this.updateDoc,
  });

  UploadDocumentModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      msg = json['msg'] as String?,
      updateDoc = (json['updateDoc'] as Map<String,dynamic>?) != null ? UpdateDoc.fromJson(json['updateDoc'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'msg' : msg,
    'updateDoc' : updateDoc?.toJson()
  };
}

class UpdateDoc {
  final DriverLicense? driverLicense;
  final CnaCertificate? cnaCertificate;
  final NursingLicense? nursingLicense;
  final SocialSecurity? socialSecurity;
  final CprLicense? cprLicense;
  final BlsLicense? blsLicense;
  final AclsLicense? aclsLicense;
  final CovidVaccine? covidVaccine;
  final HepatitisLicense? hepatitisLicense;
  final String? id;
  final String? userId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  UpdateDoc({
    this.driverLicense,
    this.cnaCertificate,
    this.nursingLicense,
    this.socialSecurity,
    this.cprLicense,
    this.blsLicense,
    this.aclsLicense,
    this.covidVaccine,
    this.hepatitisLicense,
    this.id,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  UpdateDoc.fromJson(Map<String, dynamic> json)
    : driverLicense = (json['driverLicense'] as Map<String,dynamic>?) != null ? DriverLicense.fromJson(json['driverLicense'] as Map<String,dynamic>) : null,
      cnaCertificate = (json['cnaCertificate'] as Map<String,dynamic>?) != null ? CnaCertificate.fromJson(json['cnaCertificate'] as Map<String,dynamic>) : null,
      nursingLicense = (json['nursingLicense'] as Map<String,dynamic>?) != null ? NursingLicense.fromJson(json['nursingLicense'] as Map<String,dynamic>) : null,
      socialSecurity = (json['socialSecurity'] as Map<String,dynamic>?) != null ? SocialSecurity.fromJson(json['socialSecurity'] as Map<String,dynamic>) : null,
      cprLicense = (json['cprLicense'] as Map<String,dynamic>?) != null ? CprLicense.fromJson(json['cprLicense'] as Map<String,dynamic>) : null,
      blsLicense = (json['blsLicense'] as Map<String,dynamic>?) != null ? BlsLicense.fromJson(json['blsLicense'] as Map<String,dynamic>) : null,
      aclsLicense = (json['aclsLicense'] as Map<String,dynamic>?) != null ? AclsLicense.fromJson(json['aclsLicense'] as Map<String,dynamic>) : null,
      covidVaccine = (json['covidVaccine'] as Map<String,dynamic>?) != null ? CovidVaccine.fromJson(json['covidVaccine'] as Map<String,dynamic>) : null,
      hepatitisLicense = (json['hepatitisLicense'] as Map<String,dynamic>?) != null ? HepatitisLicense.fromJson(json['hepatitisLicense'] as Map<String,dynamic>) : null,
      id = json['_id'] as String?,
      userId = json['userId'] as String?,
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    'driverLicense' : driverLicense?.toJson(),
    'cnaCertificate' : cnaCertificate?.toJson(),
    'nursingLicense' : nursingLicense?.toJson(),
    'socialSecurity' : socialSecurity?.toJson(),
    'cprLicense' : cprLicense?.toJson(),
    'blsLicense' : blsLicense?.toJson(),
    'aclsLicense' : aclsLicense?.toJson(),
    'covidVaccine' : covidVaccine?.toJson(),
    'hepatitisLicense' : hepatitisLicense?.toJson(),
    '_id' : id,
    'userId' : userId,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}

class DriverLicense {
  final String? document;
  final int? status;
  final String? name;
  final String? model;

  DriverLicense({
    this.document,
    this.status,
    this.name,
    this.model,
  });

  DriverLicense.fromJson(Map<String, dynamic> json)
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

class CnaCertificate {
  final dynamic document;
  final int? status;
  final String? name;
  final String? model;

  CnaCertificate({
    this.document,
    this.status,
    this.name,
    this.model,
  });

  CnaCertificate.fromJson(Map<String, dynamic> json)
    : document = json['document'],
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

class NursingLicense {
  final String? document;
  final int? status;
  final String? name;
  final String? model;

  NursingLicense({
    this.document,
    this.status,
    this.name,
    this.model,
  });

  NursingLicense.fromJson(Map<String, dynamic> json)
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

class SocialSecurity {
  final String? document;
  final int? status;
  final String? name;
  final String? model;

  SocialSecurity({
    this.document,
    this.status,
    this.name,
    this.model,
  });

  SocialSecurity.fromJson(Map<String, dynamic> json)
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

class CprLicense {
  final dynamic document;
  final int? status;
  final String? name;
  final String? model;

  CprLicense({
    this.document,
    this.status,
    this.name,
    this.model,
  });

  CprLicense.fromJson(Map<String, dynamic> json)
    : document = json['document'],
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

class BlsLicense {
  final dynamic document;
  final int? status;
  final String? name;
  final String? model;

  BlsLicense({
    this.document,
    this.status,
    this.name,
    this.model,
  });

  BlsLicense.fromJson(Map<String, dynamic> json)
    : document = json['document'],
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

class AclsLicense {
  final String? document;
  final int? status;
  final String? name;
  final String? model;

  AclsLicense({
    this.document,
    this.status,
    this.name,
    this.model,
  });

  AclsLicense.fromJson(Map<String, dynamic> json)
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

class CovidVaccine {
  final dynamic document;
  final int? status;
  final String? name;
  final String? model;

  CovidVaccine({
    this.document,
    this.status,
    this.name,
    this.model,
  });

  CovidVaccine.fromJson(Map<String, dynamic> json)
    : document = json['document'],
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

class HepatitisLicense {
  final String? document;
  final int? status;
  final String? name;
  final String? model;

  HepatitisLicense({
    this.document,
    this.status,
    this.name,
    this.model,
  });

  HepatitisLicense.fromJson(Map<String, dynamic> json)
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