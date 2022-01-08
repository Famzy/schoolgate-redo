
import 'courses_model.dart';

class CourseListModel {
  bool? status;
  List<Course>? courses;
  CourseListModel({this.status, this.courses});

  CourseListModel.fromJson(dynamic json) {
    status = json["status"];
    if (json["courses"] != null) {
      courses = [];
      json["courses"].forEach((v) {
        courses?.add(Course.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    if (courses != null) {
      map["courses"] = courses?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class PurchasedModel {
  bool? status;
  bool? purchased;
  Course? course;
  Course? courses;
  List<Contents>? contents;
  String? message;

  PurchasedModel(
      {this.status,
      this.purchased,
      this.course,
      this.courses,
      this.contents,
      this.message});

  PurchasedModel.fromJson(dynamic json) {
    status = json["status"];
    purchased = json["purchased"];
    course = json["course"] != null ? Course.fromJson(json["course"]) : null;
    if (json["contents"] != null) {
      contents = [];
      json["contents"].forEach((v) {
        contents?.add(Contents.fromJson(v));
      });
    }
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["purchased"] = purchased;
    if (course != null) {
      map["course"] = course?.toJson();
    }
    if (contents != null) {
      map["contents"] = contents?.map((v) => v.toJson()).toList();
    }
    map["message"] = message;
    return map;
  }
}

class Contents {
  String? uniqueid;
  String? id;
  String? title;
  String? description;
  String? courseid;
  String? termid;
  String? weekNumber;
  String? priority;
  String? isIntro;
  String? contentType;
  String? fileLocation;
  String? offlineLocation;
  String? awsid;
  String? createdBy;
  String? datecreated;
  String? datemodified;

  Contents(
      {this.uniqueid,
      this.id,
      this.title,
      this.description,
      this.courseid,
      this.termid,
      this.weekNumber,
      this.priority,
      this.isIntro,
      this.contentType,
      this.fileLocation,
      this.offlineLocation,
      this.awsid,
      this.createdBy,
      this.datecreated,
      this.datemodified});

  Contents.fromJson(dynamic json) {
    uniqueid = json["uniqueid"];
    id = json["id"];
    title = json["title"];
    description = json["description"];
    courseid = json["courseid"];
    termid = json["termid"];
    weekNumber = json["week_number"];
    priority = json["priority"];
    isIntro = json["isIntro"];
    contentType = json["contentType"];
    fileLocation = json["fileLocation"];
    offlineLocation = json["offlineLocation"];
    awsid = json["awsid"];
    createdBy = json["created_by"];
    datecreated = json["datecreated"];
    datemodified = json["datemodified"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uniqueid"] = uniqueid;
    map["id"] = id;
    map["title"] = title;
    map["description"] = description;
    map["courseid"] = courseid;
    map["termid"] = termid;
    map["week_number"] = weekNumber;
    map["priority"] = priority;
    map["isIntro"] = isIntro;
    map["contentType"] = contentType;
    map["fileLocation"] = fileLocation;
    map["offlineLocation"] = offlineLocation;
    map["awsid"] = awsid;
    map["created_by"] = createdBy;
    map["datecreated"] = datecreated;
    map["datemodified"] = datemodified;
    return map;
  }
}
