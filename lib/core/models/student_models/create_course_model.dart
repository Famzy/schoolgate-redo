import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CreateCourseModel {
  String? courseName;
  String? courseDescription;
  String? courseDuration;
  String? courseStructure;
  String? price;
  String? oldPrice;
  int? isFree;
  XFile? featureImage;
  String? categoryId;
  CreateCourseModel({
    this.courseName,
    this.courseDescription,
    this.courseDuration,
    this.courseStructure,
    this.price,
    this.oldPrice,
    this.isFree,
    this.featureImage,
    this.categoryId,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> createCourse = new Map<String, dynamic>();
    createCourse['course_name'] = courseName;
    createCourse['course_description'] = courseDescription;
    createCourse['course_duration'] = courseDuration;
    createCourse['course_structure'] = courseStructure;
    createCourse['price'] = price;
    createCourse['old_price'] = oldPrice;
    createCourse['isFree'] = isFree;
    createCourse['feature_image'] = featureImage;
    createCourse['categoryid'] = categoryId;

    return createCourse;
  }

  CreateCourseModel.fromJson(Map<String, dynamic> jsonData) {
    this.courseName = jsonData["course_name"];
    this.courseDescription = jsonData["course_description"];
    this.courseDuration = jsonData["course_duration"];
    this.courseStructure = jsonData["course_structure"];
    this.price = jsonData["price"];
    this.oldPrice = jsonData["old_price"];
    this.isFree = jsonData["isFree"];
    this.featureImage = jsonData["feature_image"];
    this.categoryId = jsonData["categoryid"];
  }
}
