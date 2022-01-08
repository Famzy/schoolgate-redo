
import 'lessons_model.dart';
import 'resourses_model.dart';

class Course {
  String? id;
  String? courseid;
  String? studentId;
  String? categoryid;
  String? subjectid;
  String? classId;
  String? courseName;
  String? lessonName;
  String? courseDescription;
  String? courseDuration;
  String? courseStructure;
  String? tutor;
  String? featureImage;
  String? createdBy;
  String? priority;
  String? featured;
  String? price;
  bool? isFree;
  String? status;
  String? datecreated;
  String? datemodified;
  int? totalLessons;
  int? rating;
  int? totalWatched;
  dynamic? oldPrice;
  int? purchases;
  String? categoryName;
  String? tutorName;
  String? tutorBio;
  String? tutorid;
  bool? purchased;
  List<Lessons>? lessons;
  List<Resources>? resources;
  String? duration;
  String? title;
  String? description;
  String? meetingId;
  String? meetingDate;
  String? startTime;
  String? endTime;
  String? room;
  bool? downloaded;
  String? videoLocalPath;

  Course(
      {this.id,
      this.courseid,
      this.studentId,
      this.categoryid,
      this.subjectid,
      this.classId,
      this.courseName,
      this.lessonName,
      this.courseDescription,
      this.courseDuration,
      this.courseStructure,
      this.tutor,
      this.featureImage,
      this.createdBy,
      this.priority,
      this.featured,
      this.price,
      this.isFree,
      this.status,
      this.datecreated,
      this.datemodified,
      this.totalLessons,
      this.rating,
      this.oldPrice,
      this.purchases,
      this.totalWatched,
      this.categoryName,
      this.tutorName,
      this.tutorBio,
      this.tutorid,
      this.purchased,
      this.lessons,
      this.resources,
      this.duration,
      this.title,
      this.description,
      this.meetingId,
      this.meetingDate,
      this.startTime,
      this.endTime,
      this.downloaded,
      this.videoLocalPath,
      this.room,});

  Course.fromJson(dynamic json) {
    id = json["id"];
    subjectid = json["subjectid"];
    courseid = json['courseid'];
    studentId = json['studentid'];
    classId = json["class_id"];
    courseName = json['course_name'];
    lessonName = json['lesson_name'];
    courseDuration = json['course_duration'];
    courseDescription = json['course_description'];
    courseStructure = json["course_structure"];
    categoryid = json['categoryid'];
    datecreated = json["datecreated"];
    datemodified = json["datemodified"];
    categoryName = json['category_name'];
    featureImage = json["feature_image"];
    price = json['price'];
    featured = json["featured"];
    videoLocalPath = json["absolute_path"];
    priority = json["priority"];
    createdBy = json["created_by"];
    tutor = json["tutor"];
    status = json["status"];
    isFree = json["isFree"];
    oldPrice = json['old_price'];
    totalWatched = json['totalWatched'];
    downloaded = json['downloaded'];
    tutorName = json['tutor_name'];
    tutorBio = json['tutor_bio'];
    tutorid = json['tutorid'];
    purchased = json['purchased'];
    totalLessons = json['totalLessons'];
    rating = json['rating'];
    duration = json['duration'];
    title = json['title'];
    description = json['description'];
    meetingId = json['meetingid'];
    meetingDate = json['meeting_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    room = json['room'];
    if (json['lessons'] != null) {
      lessons = [];
      json['lessons'].forEach((v) {
        lessons?.add(Lessons.fromJson(v));
      });
    }
    if (json['resources'] != null) {
      resources = [];
      json['resources'].forEach((v) {
        resources?.add(Resources.fromJson(v));
      });
    }
    duration = json['duration'];
    purchases = json["purchases"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (id != null) {
      map["id"] = id;
    }
    if (courseid != null) {
      map["courseid"] = courseid;
    }
    if (studentId != null) {
      map["studentid"] = studentId;
    }
    if (subjectid != null) {
      map["subjectid"] = subjectid;
    }
    map['course_name'] = courseName;
    map['lesson_name'] = lessonName;
    map['course_duration'] = courseDuration;
    map["datemodified"] = datemodified;
    map["status"] = status;
    map["datecreated"] = datecreated;
    map["course_structure"] = courseStructure;
    map['course_description'] = courseDescription;
    if (categoryid != null) {
      map["categoryid"] = categoryid;
    }
    map["priority"] = priority;
    map["isFree"] = isFree;
    map["featured"] = featured;
    map["absolute_path"] = videoLocalPath;
    map['category_name'] = categoryName;
    map["feature_image"] = featureImage;
    map["created_by"] = createdBy;
    map['price'] = price;
    if (oldPrice != null) {
      map["old_price"] = oldPrice;
    }
    if (purchases != null) {
      map["purchases"] = purchases;
    }
    if (totalWatched != null) {
      map["totalWatched"] = totalWatched;
    }
    if (downloaded != null) {
      map["downloaded"] = downloaded;
    }
    map["tutor"] = tutor;
    map['tutor_name'] = tutorName;
    map["class_id"] = classId;
    map['tutor_bio'] = tutorBio;
    map['tutorid'] = tutorid;
    map['purchased'] = purchased;
    if (totalLessons != null) {
      map["totalLessons"] = totalLessons;
    }
    if (duration != null) {
      map["duration"] = duration;
    }
     if (title != null) {
      map["title"] = title;
    }
     if (description != null) {
      map["description"] = description;
    }
     if (meetingId != null) {
      map["meetingid"] = meetingId;
    }
     if (meetingDate != null) {
      map["meeting_date"] = meetingDate;
    }
     if (startTime != null) {
      map["start_time"] = startTime;
    }
     if (endTime != null) {
      map["end_time"] = endTime;
    }
     if (room != null) {
      map["room"] = room;
    }
    map['rating'] = rating;
    if (lessons != null) {
      map['lessons'] = lessons?.map((v) => v.toJson()).toList();
    }
    if (resources != null) {
      map['resources'] = resources?.map((v) => v.toJson()).toList();
    }
    map['duration'] = duration;
    return map;
  }
}
