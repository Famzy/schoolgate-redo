class Resources {
  String? lesson;
  String? title;
  String? url;

  Resources({
    this.lesson,
    this.title,
    this.url});

  Resources.fromJson(dynamic json) {
    lesson = json['lesson'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['lesson'] = lesson;
    map['title'] = title;
    map['url'] = url;
    return map;
  }

}