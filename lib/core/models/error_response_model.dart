class ErrorResponse {
  String? message;
  Errors? errors;

  ErrorResponse({this.message, this.errors});

  ErrorResponse.fromJson(dynamic json) {
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }
}

class Errors {
  List<String>? firstname;
  List<String>? wardsFirstName;
  List<String>? lastname;
  List<String>? wardsLastName;
  List<String>? middlename;
  List<String>? wardsMiddleName;
  List<String>? email;
  List<String>? friendId;
  List<String>? username;
  List<String>? phone;
  List<String>? code;
  List<String>? sex;
  List<String>? dateOfBirth;
  List<String>? employementStatus;
  List<String>? relationshipStatus;
  List<String>? password;
  List<String>? passwordConfirmation;
  List<String>? bvn;
  List<String>? photo;
  List<String>? file;

  Errors({
    this.firstname,
    this.wardsFirstName,
    this.lastname,
    this.wardsLastName,
    this.middlename,
    this.wardsMiddleName,
    this.email,
    this.friendId,
    this.username,
    this.phone,
    this.code,
    this.sex,
    this.dateOfBirth,
    this.employementStatus,
    this.relationshipStatus,
    this.password,
    this.passwordConfirmation,
    this.bvn,
    this.photo,
    this.file,
  });

  Errors.fromJson(dynamic json) {
    firstname =
        json['firstname'] != null ? json['firstname'].cast<String>() : [];
    wardsFirstName =
        json['first_name'] != null ? json['first_name'].cast<String>() : [];
    lastname = json['lastname'] != null ? json['lastname'].cast<String>() : [];
    friendId =
        json['friend_id'] != null ? json['friend_id'].cast<String>() : [];
    wardsLastName =
        json['last_name'] != null ? json['last_name'].cast<String>() : [];
    middlename =
        json['middlename'] != null ? json['middlename'].cast<String>() : [];
    wardsMiddleName =
        json['middle_name'] != null ? json['middle_name'].cast<String>() : [];
    email = json['email'] != null ? json['email'].cast<String>() : [];
    username = json['username'] != null ? json['username'].cast<String>() : [];
    phone = json['phone'] != null ? json['phone'].cast<String>() : [];
    code = json['code'] != null ? json['code'].cast<String>() : [];
    sex = json['sex'] != null ? json['sex'].cast<String>() : [];
    dateOfBirth = json['date_of_birth'] != null
        ? json['date_of_birth'].cast<String>()
        : [];
    employementStatus = json['employement_status'] != null
        ? json['employement_status'].cast<String>()
        : [];
    relationshipStatus = json['relationship_status'] != null
        ? json['relationship_status'].cast<String>()
        : [];
    password = json['password'] != null ? json['password'].cast<String>() : [];
    passwordConfirmation = json['password_confirmation'] != null
        ? json['password_confirmation'].cast<String>()
        : [];
    bvn = json['bvn'] != null ? json['bvn'].cast<String>() : [];
    photo = json['photo'] != null ? json['photo'].cast<String>() : [];
    file = json['file'] != null ? json['file'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (firstname != null) map['firstname'] = firstname;
    if (wardsFirstName != null) map['first_name'] = wardsFirstName;
    if (lastname != null) map['lastname'] = lastname;
    if (wardsLastName != null) map['last_name'] = wardsLastName;
    if (middlename != null) map['middlename'] = middlename;
    if (wardsMiddleName != null) map['middle_name'] = wardsMiddleName;
    if (email != null) map['email'] = email;
    if (username != null) map['username'] = username;
    if (phone != null) map['phone'] = phone;
    if (friendId != null) map['friend_id'] = friendId;
    if (sex != null) map['sex'] = sex;
    if (dateOfBirth != null) map['date_of_birth'] = dateOfBirth;
    if (employementStatus != null)
      map['employement_status'] = employementStatus;
    if (relationshipStatus != null)
      map['relationship_status'] = relationshipStatus;
    if (password != null) map['password'] = password;
    if (passwordConfirmation != null)
      map['password_confirmation'] = passwordConfirmation;
    return map;
  }
}
