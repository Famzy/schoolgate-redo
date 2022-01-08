class Register {
  String? email_address;
  String? password;
  String? fullname;
  String? phone_number;
  String? confirm_password;
  String? usertype;
  Register({
    this.email_address,
    this.password,
    this.fullname,
    this.phone_number,
    this.confirm_password,
    this.usertype,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> register = new Map<String, dynamic>();
    register['fullname'] = fullname;
    register['phone_number'] = phone_number;
    register['email_address'] = email_address;
    register['password'] = password;
    register['confirm_password'] = confirm_password;
    register['usertype'] = usertype;
    return register;
  }
}
