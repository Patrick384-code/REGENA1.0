import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:regena/api/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class AjoutRessources extends StatefulWidget {
  const AjoutRessources({Key? key}) : super(key: key);

  @override
  _AjoutRessourcesState createState() => _AjoutRessourcesState();
}

class _AjoutRessourcesState extends State<AjoutRessources> {
  final _formKey = GlobalKey<FormState>();
  PickedFile? _pickedImage;

  Future<void> _pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      PickedFile? pickedImage = await _picker.getImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setState(() {
          _pickedImage = pickedImage;
        });
      }
    } catch (e) {
      print('Erreur lors de la sélection de l\'image : $e');
    }
  }


  TextEditingController _longitudeController = TextEditingController();
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _nomRessourceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _categoryIdController = TextEditingController();
  TextEditingController _zoneIdController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();

  @override
  void dispose() {
    _longitudeController.dispose();
    _latitudeController.dispose();
    _nomRessourceController.dispose();
    _descriptionController.dispose();
    _categoryIdController.dispose();
    _zoneIdController.dispose();
    _userIdController.dispose();
    super.dispose();
  }

  Future<void> ajouterRessource() async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      final longitude = double.parse(_longitudeController.text);
      final latitude = double.parse(_latitudeController.text);
      final nomRessource = _nomRessourceController.text;
      final description = _descriptionController.text;
      final categoryId = _categoryIdController.text;
      final zoneId = _zoneIdController.text;
      final userId = _userIdController.text;

      final imageBytes = await _pickedImage!.readAsBytes();

      final response = await http.post(
        "https://regena.000webhostapp.com/regena/ajoutRessources.php",
        body: {
          "longitude": longitude.toString(),
          "latitude": latitude.toString(),
          "nom_ressource": nomRessource,
          "description": description,
          "image": base64Encode(imageBytes),
          "category_id": categoryId,
          "zone_id": zoneId,
          "user_id": userId,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final success = data['success'];

        if (success == 1) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Succès'),
              content: Text('Ressource ajoutée avec succès.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                    // Rediriger vers la page d'accueil ou une autre page selon la logique de votre application
                  },
                ),
              ],
            ),
          );
        } else {
          final errorMessage = data['message'];
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Erreur'),
              content: Text(errorMessage),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Erreur'),
            content: Text('Erreur de connexion au serveur.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erreur'),
          content: Text('Une erreur s\'est produite.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une ressource'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _longitudeController,
                decoration: InputDecoration(labelText: 'Longitude'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer une longitude valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _latitudeController,
                decoration: InputDecoration(labelText: 'Latitude'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer une latitude valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _nomRessourceController,
                decoration: InputDecoration(labelText: 'Nom de la ressource'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un nom de ressource valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer une description valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _pickedImage != null
                      ? Image.file(File(_pickedImage!.path), fit: BoxFit.cover)
                      : Icon(Icons.add_a_photo, size: 50),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _categoryIdController,
                decoration: InputDecoration(labelText: 'ID de catégorie'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un ID de catégorie valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _zoneIdController,
                decoration: InputDecoration(labelText: 'ID de zone'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un ID de zone valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _userIdController,
                decoration: InputDecoration(labelText: 'ID d\'utilisateur'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un ID d\'utilisateur valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Envoyer la requête d'ajout de ressources à la base de données
                    ajouterRessource();
                  }
                },
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
