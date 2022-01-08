class ExtraDriveLoginModel {
  String? extraDriveID;
  ExtraDriveLoginModel({this.extraDriveID,}) : super();
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> login = new Map<String, dynamic>();
    login['extradrive_number'] = extraDriveID;
    return login;
  }
}