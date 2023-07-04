import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:regena/ressources/ressourceDetailsPage.dart';

class Ressource {
  String id;
  String longitude;
  String latitude;
  String nomRessource;
  String description;
  String imageRessource;
  DateTime dateAjout;
  String categoryId;
  String zoneId;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  Ressource({
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory Ressource.fromJson(Map<String, dynamic> json) {
    return Ressource(
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
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

Future<List<Ressource>> fetchRessources() async {
  final response = await http.get(Uri.parse('https://regena.000webhostapp.com/regena/afficheRessources.php'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final ressources = <Ressource>[];

    for (var item in jsonData) {
      ressources.add(Ressource.fromJson(item));
    }

    return ressources;
  } else {
    throw Exception('Failed to fetch ressources');
  }
}

class RessourcesPage extends StatefulWidget {
  @override
  _RessourcesPageState createState() => _RessourcesPageState();
}

class _RessourcesPageState extends State<RessourcesPage> {
  late Future<List<Ressource>> _ressourcesFuture;

  @override
  void initState() {
    super.initState();
    _ressourcesFuture = fetchRessources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ressources'),
      ),
      body: FutureBuilder<List<Ressource>>(
        future: _ressourcesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final ressources = snapshot.data!;

            return ListView.builder(
              itemCount: ressources.length,
              itemBuilder: (context, index) {
                final ressource = ressources[index];

                return ListTile(
                  title: Text(ressource.nomRessource),
                  subtitle: Text(ressource.description),
                  leading: Image.network(
                    ressource.imageRessource ?? '',
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/default_image.png');
                    },
                  ),
                  onTap: () {
                    // Navigate to a new screen with more information
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResourceDetailPage(ressource: ressource),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     title: 'Ressources App',
//     home: RessourcesPage(),
//   ));
// }
