import 'courses_model.dart';

class CourseDetailsModel {
  bool? status;
  String? message;
  Course? course;

  CourseDetailsModel({
      this.status, 
      this.message, 
      this.course});

  CourseDetailsModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (course != null) {
      map['course'] = course?.toJson();
    }
    return map;
  }

}





