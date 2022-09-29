class ShiftModel {
  final int? status;
  final String? msg;
  final List<Jobs>? jobs;

  ShiftModel({
    this.status,
    this.msg,
    this.jobs,
  });

  ShiftModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        msg = json['msg'] as String?,
        jobs = (json['jobs'] as List?)
            ?.map((dynamic e) => Jobs.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'msg': msg,
        'jobs': jobs?.map((e) => e.toJson()).toList()
      };
}

class Jobs {
  final Location? location;
  final String? id;
  final String? hospitalName;
  final String? hospitalImage;
  final String? date;
  final String? day;
  final String? jobTitle;
  final String? jobTiming;
  final int? hourlyRate;
  final String? jobLocation;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Jobs({
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

  Jobs.fromJson(Map<String, dynamic> json)
      : location = (json['location'] as Map<String, dynamic>?) != null
            ? Location.fromJson(json['location'] as Map<String, dynamic>)
            : null,
        id = json['_id'] as String?,
        hospitalName = json['hospital_name'] as String?,
        hospitalImage = json['hospital_Image'] as String?,
        date = json['date'] as String?,
        day = json['day'] as String?,
        jobTitle = json['job_title'] as String?,
        jobTiming = json['job_timing'] as String?,
        hourlyRate = json['hourly_rate'] as int?,
        jobLocation = json['job_location'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        '_id': id,
        'hospital_name': hospitalName,
        'hospital_Image': hospitalImage,
        'date': date,
        'day': day,
        'job_title': jobTitle,
        'job_timing': jobTiming,
        'hourly_rate': hourlyRate,
        'job_location': jobLocation,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
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

  Map<String, dynamic> toJson() =>
      {'longitude': longitude, 'latitude': latitude};
}
