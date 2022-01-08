class LoginModel {
  String? email_address;
  String? password;
  LoginModel({this.email_address, this.password}) : super();
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> login = new Map<String, dynamic>();
    login['password'] = password;
    login['email_address'] = email_address;
    return login;
  }
}