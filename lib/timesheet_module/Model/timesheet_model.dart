class TimeSheetModel {
  final int? status;
  final String? msg;
  final List<Sheet>? sheet;

  TimeSheetModel({
    this.status,
    this.msg,
    this.sheet,
  });

  TimeSheetModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      msg = json['msg'] as String?,
      sheet = (json['sheet'] as List?)?.map((dynamic e) => Sheet.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'msg' : msg,
    'sheet' : sheet?.map((e) => e.toJson()).toList()
  };
}

class Sheet {
  final String? id;
  final List<Clock>? clock;
  final String? date;
  final String? monthYear;
  final String? monthYearDate;
  final String? day;
  final String? userId;
  final HospitalId? hospitalId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Sheet({
    this.id,
    this.clock,
    this.date,
    this.monthYear,
    this.monthYearDate,
    this.day,
    this.userId,
    this.hospitalId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Sheet.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      clock = (json['clock'] as List?)?.map((dynamic e) => Clock.fromJson(e as Map<String,dynamic>)).toList(),
      date = json['date'] as String?,
      monthYear = json['monthYear'] as String?,
      monthYearDate = json['monthYearDate'] as String?,
      day = json['day'] as String?,
      userId = json['user_id'] as String?,
      hospitalId = (json['hospital_id'] as Map<String,dynamic>?) != null ? HospitalId.fromJson(json['hospital_id'] as Map<String,dynamic>) : null,
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'clock' : clock?.map((e) => e.toJson()).toList(),
    'date' : date,
    'monthYear' : monthYear,
    'monthYearDate' : monthYearDate,
    'day' : day,
    'user_id' : userId,
    'hospital_id' : hospitalId?.toJson(),
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}

class Clock {
  final String? clockTime;
  final String? clockType;
  final String? id;

  Clock({
    this.clockTime,
    this.clockType,
    this.id,
  });

  Clock.fromJson(Map<String, dynamic> json)
    : clockTime = json['clockTime'] as String?,
      clockType = json['clockType'] as String?,
      id = json['_id'] as String?;

  Map<String, dynamic> toJson() => {
    'clockTime' : clockTime,
    'clockType' : clockType,
    '_id' : id
  };
}

class HospitalId {
  final Location? location;
  final String? id;
  final String? hospitalName;
  final String? hospitalImage;
  final String? date;
  final String? day;
  final String? jobTitle;
  final String? jobTiming;
  final int? hourlyRate;
  final dynamic jobLocation;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  HospitalId({
    this.location,
    this.id,
    this.hospitalName,
    this.hospitalImage,
    this.date,
    this.day,
    this.jobTitle,
    this.jobTiming,
    this.hourlyRate,
    this.jobLocation,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  HospitalId.fromJson(Map<String, dynamic> json)
    : location = (json['location'] as Map<String,dynamic>?) != null ? Location.fromJson(json['location'] as Map<String,dynamic>) : null,
      id = json['_id'] as String?,
      hospitalName = json['hospital_name'] as String?,
      hospitalImage = json['hospital_Image'] as String?,
      date = json['date'] as String?,
      day = json['day'] as String?,
      jobTitle = json['job_title'] as String?,
      jobTiming = json['job_timing'] as String?,
      hourlyRate = json['hourly_rate'] as int?,
      jobLocation = json['job_location'],
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    'location' : location?.toJson(),
    '_id' : id,
    'hospital_name' : hospitalName,
    'hospital_Image' : hospitalImage,
    'date' : date,
    'day' : day,
    'job_title' : jobTitle,
    'job_timing' : jobTiming,
    'hourly_rate' : hourlyRate,
    'job_location' : jobLocation,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}

class Location {
  final String? longitude;
  final String? latitude;

  Location({
    this.longitude,
    this.latitude,
  });

  Location.fromJson(Map<String, dynamic> json)
    : longitude = json['longitude'] as String?,
      latitude = json['latitude'] as String?;

  Map<String, dynamic> toJson() => {
    'longitude' : longitude,
    'latitude' : latitude
  };
}