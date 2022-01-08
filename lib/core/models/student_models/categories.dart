class Categories {
  String? categoryid;
  String? categoryName;
  String? featureImage;

  Categories({this.categoryid, this.categoryName, this.featureImage});

  Categories.fromJson(dynamic json) {
    categoryid = json["categoryid"];
    categoryName = json["category_name"];
    featureImage = json["feature_image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["categoryid"] = categoryid;
    map["category_name"] = categoryName;
    map["feature_image"] = featureImage;
    return map;
  }
}
