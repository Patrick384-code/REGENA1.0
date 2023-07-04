class PostModel {
  double longitude;
  double latitude;
  String nomRessource;
  String description;
  String imageRessource;
  String categoryId;
  String zoneId;
  String userId;

  PostModel({
    required this.longitude,
    required this.latitude,
    required this.nomRessource,
    required this.description,
    required this.imageRessource,
    required this.categoryId,
    required this.zoneId,
    required this.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      longitude: json["longitude"],
      latitude: json["latitude"],
      nomRessource: json["nomRessource"],
      description: json["description"],
      imageRessource: json["imageRessource"],
      categoryId: json["categoryId"],
      zoneId: json["zoneId"],
      userId: json["userId"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "longitude": longitude,
      "latitude": latitude,
      "nomRessource": nomRessource,
      "description": description,
      "imageRessource": imageRessource,
      "categoryId": categoryId,
      "zoneId": zoneId,
      "userId": userId,
    };
  }
}