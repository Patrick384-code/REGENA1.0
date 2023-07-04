import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:regena/Home/carte.dart';
import 'package:regena/Home/login.dart';
import 'package:regena/Home/home.dart';
import 'package:regena/Home/news.dart';
import 'package:regena/SitesTouristiques/mainPage.dart';
import 'package:regena/carte/mapsscreen.dart';
import 'package:regena/model/userModel/userModel.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value)=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MapsScreen())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Container(
          height: 200.0,
          width: 200.0,
          child: LottieBuilder.asset('assets/Location.json'),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color(0xFF008000),
      //   onPressed: () {
      //     _scaffoldKey.currentState?.openDrawer();
      //   },
      //   child: Icon(Icons.menu),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      // drawer: Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       UserAccountsDrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Color(0xFF008000),
      //         ),
      //         accountName: Text('Patrick Manfouo'),
      //         accountEmail: Text('patrickmanfouo@gmail.com'),
      //         currentAccountPicture: CircleAvatar(
      //           backgroundColor: Colors.white,
      //           child: Text(
      //             'PM',
      //             style: TextStyle(color: Color(0xFF008000)),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         selectedColor: Color(0xFF008000),
      //         leading: Icon(Icons.search),
      //         title: Text('Rechercher'),
      //         selected: _selectedMenu == 'Rechercher',
      //         onTap: () => _onMenuItemSelected('Rechercher'),
      //       ),
      //       ListTile(
      //         selectedColor: Color(0xFF008000),
      //         leading: Icon(Icons.home),
      //         title: Text('Acceuil'),
      //         selected: _selectedMenu == 'Home',
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => SplashScreen()),
      //           );
      //         },
      //       ),
      //       ExpansionTile(
      //         leading: Icon(Icons.explore),
      //         title: Text('Explorer'),
      //         children: <Widget>[
      //           ListTile(
      //             selectedColor: Color(0xFF008000),
      //             leading: Icon(Icons.newspaper),
      //             title: Text('Actualites'),
      //             selected: _selectedMenu == 'Actualites',
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => NewsScreen()),
      //               );
      //             },
      //           ),
      //           ListTile(
      //             selectedColor: Color(0xFF008000),
      //             leading: Icon(Icons.tour_outlined),
      //             title: Text('Sites Touristiques'),
      //             selected: _selectedMenu == 'Sites Touristiques',
      //             onTap: () {
                    
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => MainPage()),
      //               );
      //             },
      //           ),
      //         ],
      //       ),
      //       ExpansionTile(
      //         leading: Icon(Icons.real_estate_agent_sharp),
      //         title: Text('Ressources'),
      //         children: <Widget>[
      //           ListTile(
      //             selectedColor: Color(0xFF008000),
      //             leading: Icon(Icons.all_inbox),
      //             title: Text('Ressources Disponibles'),
      //             selected: _selectedMenu == 'Ressources Disponibles',
      //             onTap: () => _onMenuItemSelected('Ressources Disponibles'),
      //           ),
      //           ListTile(
      //             selectedColor: Color(0xFF008000),
      //             leading: Icon(Icons.personal_injury),
      //             title: Text('Mes Ressources'),
      //             selected: _selectedMenu == 'Mes Ressources',
      //             onTap: () => _onMenuItemSelected('Mes Ressources'),
      //           ),
      //         ],
      //       ),
      //       ListTile(
      //         selectedColor: Color(0xFF008000),
      //         leading: Icon(Icons.add_location_alt),
      //         title: Text('Ajouter Une Ressource'),
      //         selected: _selectedMenu == 'Ajouter Une Ressource',
      //         onTap: () => _onMenuItemSelected('Ajouter Une Ressource'),
      //       ),
      //       ListTile(
      //         selectedColor: Color(0xFF008000),
      //         leading: Icon(Icons.settings),
      //         title: Text('Parametres'),
      //         selected: _selectedMenu == 'Parametres',
      //         onTap: () => _onMenuItemSelected('Parametres'),
      //       ),
      //       ListTile(
      //         selectedColor: Color(0xFF008000),
      //         leading: Icon(Icons.share_rounded),
      //         title: Text('Partager le Lien'),
      //         selected: _selectedMenu == 'Share_link',
      //         onTap: () => _onMenuItemSelected('Share_link'),
      //       ),
      //       ListTile(
      //         selectedColor: Color(0xFF008000),
      //         leading: Icon(Icons.logout),
      //         title: Text('Se Deconnecter'),
      //         selected: _selectedMenu == 'Se Deconnecter',
      //         onTap: () async {
      //           await UserModel.logOut();
      //           Navigator.pushReplacement(
      //             context,
      //             MaterialPageRoute(builder: (context) => loginpage()),
      //           );
      //         },

      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}


class MySearchDelegate extends SearchDelegate{
  List<String> searchResults=[
          'Bandjoun',
          'Bafoussam',
          'Bangang',
          'Mbouda',
          'Yaounde',
          'Douala',
        ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: ()=> close(context, null),
    );
  
  @override
  List<Widget>? buildActions(BuildContext context) => [IconButton(
    icon: Icon(Icons.clear),
    onPressed: (){
      if (query.isEmpty){
          close(context, null);
      }else{
      query='';
      }
    },
    )
    ];
    
      @override
      Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
        ),
      );
    
      @override
      Widget buildSuggestions(BuildContext context) {
        List<String> suggestions = searchResults.where((searchResult){
          final result = searchResult.toLowerCase();
          final input = query.toLowerCase();

          return result.contains(input);
        }).toList();

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            return ListTile(
              title: Text(suggestion),
              onTap: (){
                query=suggestion;
                showResults(context);
              },
            );
          });
      }
}