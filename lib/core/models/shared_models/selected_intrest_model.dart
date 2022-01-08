class SelectedInterestModel {
  String? uniqueid;
  List<String>? preferences;

  SelectedInterestModel({this.uniqueid, this.preferences});

  SelectedInterestModel.fromJson(dynamic json) {

    preferences =
        json["preferences"] != null ? json["preferences"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["preferences"] = preferences;
    return map;
  }
}
