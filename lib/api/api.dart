// // import 'dart:convert';

// // import 'package:http/http.dart' as http;

// // class Api {
// //   static Future<void> ajoutRessources(Map<String, dynamic> data) async {
// //     final response = await http.post(
// //       Uri.parse(Url.ajoutRessources),
// //       body: {
// //         "data": jsonEncode(data),
// //       },
// //     );

// //     if (response.statusCode == 200) {
// //       print(response.body);
// //     }
// //   }
// // }

// // class Url {
// //   static final String ajoutRessources =
// //       "https://regena.000webhostapp.com/regena/ajoutRessources.php";
// // }
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class Api {
//   static const String baseUrl = 'https://regena.000webhostapp.com/regena';

//   static Future<void> ajoutRessources(Map<String, dynamic> ressourcesData) async {
//     final url = Uri.parse('https://regena.000webhostapp.com/regena/ajoutRessources.php'); // Remplacez '/ressources' par l'URL de votre endpoint d'ajout de ressources

//     try {
//       final response = await http.post(
//         url,
//         body: jsonEncode(ressourcesData),
//       );

//       if (response.statusCode == 200) {
//         // Succès : Ressource ajoutée avec succès
//         print('Ressource ajoutée avecc succès');
//         print(response.body);
//       } else {
//         // Erreur : Échec de l'ajout de la ressource
//         print('Échec de l\'ajout de la ressource');
//       }
//     } catch (error) {
//       // Erreur lors de la requête
//       print('Erreur lors de la requête : $error');
//     }
//   }
// }
