class Lessons {
  String? lessonid;
  String? title;
  String? description;
  dynamic? duration;
  String? fileLocation;
  String? hls_filelocation;
  String? contentType;
  bool? downloaded;
  bool? isRunning;
  String? videoLocalPath;

  Lessons({
    this.lessonid,
    this.title,
    this.description,
    this.duration,
    this.fileLocation,
    this.hls_filelocation,
    this.contentType,
    this.downloaded,
    this.isRunning = false,
    this.videoLocalPath,
  });

  Lessons.fromJson(dynamic json) {
    lessonid = json['lessonid'];
    title = json['title'];
    description = json['description'];
    duration = json['duration'];
    fileLocation = json['fileLocation'];
    hls_filelocation = json['hls_filelocation'];
    contentType = json['contentType'];
    downloaded = json['downloaded'];
    isRunning = json['isRunning'];
    videoLocalPath = json['absolute_path'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['lessonid'] = lessonid;
    map['title'] = title;
    map['description'] = description;
    map['duration'] = duration;
    map['fileLocation'] = fileLocation;
    map['hls_filelocation'] = hls_filelocation;
    map['contentType'] = contentType;
    map['downloaded'] = downloaded;
    map['isRunning'] = isRunning;
    map['absolute_path'] = videoLocalPath;
    return map;
  }

}