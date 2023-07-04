import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart' as flutter_google_maps;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:regena/Home/home.dart';
import 'package:regena/Home/login.dart';
import 'package:regena/Home/news.dart';
import 'package:regena/SitesTouristiques/mainPage.dart';
import 'package:regena/model/userModel/userModel.dart';
import 'package:regena/ressources/afficheRessources.dart';
import 'package:regena/ressources/ajoutRessources.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
   //UserModel? loggedInUser = UserModel.sessionUser; // Récupère l'utilisateur connecté à partir de sessionUser
   UserModel? user; // Variable pour stocker les informations de l'utilisateur connecté

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(5.3557815,10.4261993),
    zoom: 14.4746,
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _selectedMenu = 'Home';

  void _onMenuItemSelected(String title) {
    setState(() {
      _selectedMenu = title;
    });

    switch (title) {
      case 'Home':
        // Ajoutez ici la logique pour l'écran d'accueil
        break;
      case 'Settings':
        // Ajoutez ici la logique pour l'écran des paramètres
        break;
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
       key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeight,
                  width: screenWidth,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller){
                      _controller.complete(controller);
                    }
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF008000),
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        child: Icon(Icons.menu),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF008000),
              ),
              accountName: Text(user?.name ?? ''),
              accountEmail: Text(user?.email ?? ''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  user?.name.isNotEmpty ?? false ? user!.name[0] : '',
                  style: TextStyle(color: Color(0xFF008000)),
                ),
              ),
            ),

            ListTile(
              selectedColor: Color(0xFF008000),
              leading: Icon(Icons.search),
              title: Text('Rechercher'),
              selected: _selectedMenu == 'Rechercher',
              onTap: () => _onMenuItemSelected('Rechercher'),
            ),
            ListTile(
              selectedColor: Color(0xFF008000),
              leading: Icon(Icons.home),
              title: Text('Acceuil'),
              selected: _selectedMenu == 'Home',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapsScreen()),
                );
              },
            ),
            ExpansionTile(
              leading: Icon(Icons.explore),
              title: Text('Explorer'),
              children: <Widget>[
                ListTile(
                  selectedColor: Color(0xFF008000),
                  leading: Icon(Icons.newspaper),
                  title: Text('Actualites'),
                  selected: _selectedMenu == 'Actualites',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsScreen()),
                    );
                  },
                ),
                ListTile(
                  selectedColor: Color(0xFF008000),
                  leading: Icon(Icons.tour_outlined),
                  title: Text('Sites Touristiques'),
                  selected: _selectedMenu == 'Sites Touristiques',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.real_estate_agent_sharp),
              title: Text('Ressources'),
              children: <Widget>[
                ListTile(
                  selectedColor: Color(0xFF008000),
                  leading: Icon(Icons.all_inbox),
                  title: Text('Ressources Disponibles'),
                  selected: _selectedMenu == 'Ressources Disponibles',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RessourcesPage()),
                    );
                  },
                ),
                ListTile(
                  selectedColor: Color(0xFF008000),
                  leading: Icon(Icons.personal_injury),
                  title: Text('Mes Ressources'),
                  selected: _selectedMenu == 'Mes Ressources',
                  onTap: () => _onMenuItemSelected('Mes Ressources'),
                ),
              ],
            ),
            ListTile(
              selectedColor: Color(0xFF008000),
              leading: Icon(Icons.add_location_alt),
              title: Text('Ajouter Une Ressource'),
              selected: _selectedMenu == 'Ajouter Une Ressource',
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AjoutRessources()),
                );
              }
            ),
            ListTile(
              selectedColor: Color(0xFF008000),
              leading: Icon(Icons.settings),
              title: Text('Parametres'),
              selected: _selectedMenu == 'Parametres',
              onTap: () => _onMenuItemSelected('Parametres'),
            ),
            ListTile(
              selectedColor: Color(0xFF008000),
              leading: Icon(Icons.share_rounded),
              title: Text('Partager le Lien'),
              selected: _selectedMenu == 'Share_link',
              onTap: () => _onMenuItemSelected('Share_link'),
            ),
            ListTile(
              selectedColor: Color(0xFF008000),
              leading: Icon(Icons.logout),
              title: Text('Se Deconnecter'),
              selected: _selectedMenu == 'Se Deconnecter',
              onTap: () async {
                await UserModel.logOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
