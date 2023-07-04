import 'package:flutter/material.dart';
import 'package:regena/Home/home.dart';
import 'package:regena/Home/carte.dart';
import 'package:regena/Home/thirdpage.dart';
import 'package:regena/carte/mapsscreen.dart';
import 'package:regena/welcome/firstpage.dart';


void main() {
      runApp(HomePage());
      // runApp(HomeScreen());
}

class HomePage extends StatelessWidget {

  @override
  

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF008000),
      ) 
      ),
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }

}

