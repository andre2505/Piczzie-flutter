class Location {
  String title;

  Location({this.title});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(title: json["title"]);
  }
}
