import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:schoolgate/core/models/student_models/categories.dart';
import 'package:schoolgate/core/models/student_models/courses_model.dart';

class AuthResponse {
  String? message;
  User? user;
  String? accessToken;
  List<Categories>? categories;
  List<Course>? featuredCourses;
  List<Course>? courses;
  List<Course>? purchasedCourses;
  List<Course>? inProgress;
  List<Course>? recommendedCourses;
  List<Course>? downloads;
  bool? preferences;
  Stats? stats;
  List<Course>? coursesPublished;
  List<Course>? coursesReview;

  AuthResponse(
      {this.message,
      this.user,
      this.accessToken,
      this.featuredCourses,
      this.courses,
      this.preferences,
      this.stats,
      this.recommendedCourses,
      this.downloads,
      this.inProgress,
      this.purchasedCourses,
      this.coursesReview,
      this.coursesPublished,
      this.categories});

  AuthResponse.fromJson(dynamic json) {
    message = json["message"];
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
    stats = json["stats"] != null ? Stats.fromJson(json["stats"]) : null;
    accessToken = json["access_token"];
    preferences = json['preferences'];

    if (json["courses_review"] != null) {
      coursesReview = [];
      json["courses_review"].forEach((v) {
        coursesReview!.add(Course.fromJson(v));
      });
    }

    if (json["courses_published"] != null) {
      coursesPublished = [];
      json["courses_published"].forEach((v) {
        coursesPublished!.add(Course.fromJson(v));
      });
    }

   if (json["featured_courses"] != null) {
        featuredCourses = [];
        json["featured_courses"].forEach((v) {
          featuredCourses!.add(Course.fromJson(v));
        });
      }

    if (json["recommended_courses"] != null) {
      recommendedCourses = [];
      json["recommended_courses"].forEach((v) {
        recommendedCourses!.add(Course.fromJson(v));
      });
    }

    if (json["downloads"] != null) {
      downloads = [];
      json["downloads"].forEach((v) {
        downloads!.add(Course.fromJson(v));
      });
    }

    if (json["inprogress"] != null) {
      inProgress = [];
      json["inprogress"].forEach((v) {
        inProgress!.add(Course.fromJson(v));
      });
    }

    if (json["usecase"] != null) {
      categories = [];
      json["usecase"].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }

    if (json["purchased_courses"] != null) {
      purchasedCourses = [];
      json["purchased_courses"].forEach((v) {
        purchasedCourses!.add(Course.fromJson(v));
      });
    }
    if (json["featured_courses"] != null) {
      featuredCourses = [];
      json["featured_courses"].forEach((v) {
        featuredCourses!.add(Course.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    if (user != null) {
      map["user"] = user?.toJson();
    }

    if (stats != null) {
      map["stats"] = stats?.toJson();
    }
    if (featuredCourses != null) {
      map["featured_courses"] =
          featuredCourses!.map((v) => v.toJson()).toList();
    }
    if (recommendedCourses != null) {
      map["recommended_courses"] =
          recommendedCourses!.map((v) => v.toJson()).toList();
    }
    if (downloads != null) {
      map["downloads"] =
          downloads!.map((v) => v.toJson()).toList();
    }
    if (inProgress != null) {
      map["inprogress"] = inProgress!.map((v) => v.toJson()).toList();
    }
    map["preferences"] = preferences;
    if (categories != null) {
      map["usecase"] = categories!.map((v) => v.toJson()).toList();
    }
    map["access_token"] = accessToken;
    if (purchasedCourses != null) {
      map["purchased_courses"] =
          purchasedCourses!.map((v) => v.toJson()).toList();
    }
    if (courses != null) {
      map["courses"] = courses!.map((v) => v.toJson()).toList();
    }
    if (coursesReview != null) {
      map["courses_review"] = coursesReview!.map((v) => v.toJson()).toList();
    }
    if (coursesPublished != null) {
      map["courses_published"] = coursesPublished!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Stats {
  int? courses;
  int? ongoing;
  int? completed;
  int? userCategories;

  Stats.fromJson(Map<String, dynamic> json) {
    courses = json['courses'];
    ongoing = json['ongoing'];
    completed = json['completed'];
    userCategories = json['user_categories'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["courses"] = courses;
    map["ongoing"] = ongoing;
    map["completed"] = completed;
    map["user_categories"] = userCategories;
    return map;
  }
}

class User {
  String? uniqueId;
  String? emailAddress;
  String? fullName;
  String? phoneNumber;
  String? userid;
  String? usertype;
  String? privileges;
  String? userChannel;
  String? thumbnail;
  String? description;
  String? bankName;
  String? accountName;
  String? accountNumber;
  XFile? contentFile;
  File? imageFile;

  User(
      {
      this.uniqueId,
      this.emailAddress,
      this.fullName,
      this.phoneNumber,
      this.userid,
      this.usertype,
      this.privileges,
      this.userChannel,
      this.thumbnail,
      this.description,
      this.bankName,
      this.accountName,
      this.accountNumber,
      this.contentFile,
      this.imageFile,
      });

  User.fromJson(dynamic json) {
    uniqueId = json["uniqueid"];
    emailAddress = json["email_address"];
    fullName = json["fullname"];
    phoneNumber = json["phone_number"];
    userid = json["profile"];
    usertype = json["usertype"];
    privileges = json["privileges"];
    userChannel = json["status"];
    thumbnail = json["thumbnail"];
    description = json["description"];
    bankName = json["bank_name"];
    accountName = json["account_name"];
    accountNumber = json["account_number"];
    contentFile = json["contentFile"];
    imageFile = json["imageFile"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uniqueid"] = uniqueId;
    map["email_address"] = emailAddress;
    map["fullname"] = fullName;
    map["phone_number"] = phoneNumber;
    map["profile"] = userid;
    map["usertype"] = usertype;
    map["privileges"] = privileges;
    map["status"] = userChannel;
    map["thumbnail"] = thumbnail;
    map["description"] = description;
    map["bank_name"] = bankName;
    map["account_name"] = accountName;
    map["account_number"] = accountNumber;
    map["contentFile"] = contentFile;
    map["imageFile"] = imageFile;
    return map;
  }
}
