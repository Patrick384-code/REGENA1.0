import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class RessourceModel {
  int id;
  double longitude;
  double latitude;
  String nomRessource;
  String description;
  String imageRessource;
  DateTime dateAjout;
  int categoryId;
  int zoneId;
  int userId;

  RessourceModel({
    required this.id,
    required this.longitude,
    required this.latitude,
    required this.nomRessource,
    required this.description,
    required this.imageRessource,
    required this.dateAjout,
    required this.categoryId,
    required this.zoneId,
    required this.userId,
  });

  factory RessourceModel.fromJson(Map<String, dynamic> json) => RessourceModel(
        id: json['id'],
        longitude: json['longitude'],
        latitude: json['latitude'],
        nomRessource: json['nom_ressource'],
        description: json['description'],
        imageRessource: json['image_ressource'],
        dateAjout: DateTime.parse(json['date_ajout']),
        categoryId: json['category_id'],
        zoneId: json['zone_id'],
        userId: json['user_id'],
      );

  Map<String, dynamic> toMap() {
    return {
      'longitude': longitude,
      'latitude': latitude,
      'nom_ressource': nomRessource,
      'description': description,
      'image_ressource': imageRessource,
      'date_ajout': dateAjout.toIso8601String(),
      'category_id': categoryId,
      'zone_id': zoneId,
      'user_id': userId,
    };
  }

  static void saveRessource(RessourceModel ressource) async {
    // Utilisation de SharedPreferences ou autre pour sauvegarder la ressource
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = json.encode(ressource.toMap());
    pref.setString("ressource", data);
    pref.commit();
  }
}
