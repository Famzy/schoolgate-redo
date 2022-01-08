class LiveClassModel {
  bool? status;
  String? message;
  Data? data;

  LiveClassModel({this.status, this.message, this.data});

  LiveClassModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Classes>? classes;

  Data({this.classes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['classes'] != null) {
      classes = [];
      json['classes'].forEach((v) {
        classes?.add(new Classes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.classes != null) {
      data['classes'] = this.classes?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classes {
  String? title;
  String? description;
  String? meetingid;
  String? meetingDate;
  String? startTime;
  String? endTime;
  String? room;
  String? courseid;
  String? tutorid;
  String? featureImage;
  String? tutor;
  String? courseName;

  Classes(
      {this.title,
        this.description,
        this.meetingid,
        this.meetingDate,
        this.startTime,
        this.endTime,
        this.room,
        this.courseid,
        this.tutorid,
        this.featureImage,
        this.tutor,
        this.courseName});

  Classes.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    meetingid = json['meetingid'];
    meetingDate = json['meeting_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    room = json['room'];
    courseid = json['courseid'];
    tutorid = json['tutorid'];
    featureImage = json['feature_image'];
    tutor = json['tutor'];
    courseName = json['course_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['meetingid'] = this.meetingid;
    data['meeting_date'] = this.meetingDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['room'] = this.room;
    data['courseid'] = this.courseid;
    data['tutorid'] = this.tutorid;
    data['feature_image'] = this.featureImage;
    data['tutor'] = this.tutor;
    data['course_name'] = this.courseName;
    return data;
  }
}