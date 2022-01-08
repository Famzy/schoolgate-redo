import 'package:image_picker/image_picker.dart';

class CreateLessonModel {
  String? lessonTitle;
  String? lessonDescription;
  String? courseid;
  String? termid;
  int? weekNumber;
  int? priority;
  int? isIntro;
  int? duration;
  XFile? contentFile;
  String? contentType;
  String? lessonid;


  CreateLessonModel({
    this.lessonTitle,
    this.lessonDescription,
    this.courseid,
    this.termid,
    this.weekNumber,
    this.priority,
    this.isIntro,
    this.duration,
    this.contentFile,
    this.contentType,
    this.lessonid,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> createCourse = new Map<String, dynamic>();
    createCourse['title'] = lessonTitle;
    createCourse['description'] = lessonDescription;
    createCourse['courseid'] = courseid;
    createCourse['termid'] = termid;
    createCourse['week_number'] = weekNumber;
    createCourse['old_price'] = priority;
    createCourse['isIntro'] = isIntro;
    createCourse['duration'] = duration;
    createCourse['contentFile'] = contentFile;
    createCourse['contentType'] = contentType;
    createCourse['lessonid'] = lessonid;

    return createCourse;
  }

  CreateLessonModel.fromJson(Map<String, dynamic> jsonData) {
    this.lessonTitle = jsonData["title"];
    this.lessonDescription = jsonData["course_description"];
    this.courseid = jsonData["courseid"];
    this.termid = jsonData["termid"];
    this.weekNumber = jsonData["week_number"];
    this.priority = jsonData["priority"];
    this.isIntro = jsonData["isIntro"];
    this.duration = jsonData["duration"];
    this.contentFile = jsonData["contentFile"];
    this.contentType = jsonData["contentType"];
    this.contentType = jsonData["lessonid"];
  }
}
