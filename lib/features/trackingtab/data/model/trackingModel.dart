class TrackingModel {
  static const String collecionName = "locations";
  String? id;
  String? imgPath;
  String? latitude;
  String? longitude;

  TrackingModel(
      {this.id = "",
      required this.latitude,
      required this.longitude,
      this.imgPath});
  TrackingModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json["id"],
            imgPath: json["imgPath"],
            latitude: json["latitude"],
            longitude: json["longitude"]);
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "imgPath": imgPath,
      "longitude": longitude,
      "latitude": latitude
    };
  }
}
