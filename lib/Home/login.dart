import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:regena/Home/home.dart';
import 'package:regena/Home/signup.dart';
import 'package:regena/Home/thirdpage.dart';
import 'package:http/http.dart' as http;
import 'package:regena/model/userModel/userModel.dart';

class loginpage extends StatefulWidget {
  // final HomeScreen login;
  // loginpage({required this.login});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  String _email = '';
  String _password= '';
  String error= '';
// void login(String _email, String _password) async{
//   setState(() {
//     error = "";
//   });
//   final response = await http.post("https://regena.000webhostapp.com/regena/login.php",  body: {
//       "_email":_email,
//       "_password": _password
//     });

//   if (response.statusCode ==200) {
//     var data= jsonDecode(response.body);
//     var result = data['data'];
//     int success = result[1];
//     if (result == 1) {
//       setState(() {
//          error = result[0];
//       });
     
//     }else{
//       setState(() {
//          error = result[0];
//       });
//     }
//   }
// }
Future<void> login(String _email, String _password) async {
  try {

    if (_email.isEmpty || _password.isEmpty) {
      // Afficher un message d'erreur indiquant que tous les champs doivent être remplis
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erreur'),
          content: Text('Veuillez remplir tous les champs.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
      return;
    }
    final response = await http.post(
      "https://regena.000webhostapp.com/regena/login.php",
      body: {
        "_email": _email,
        "_password": _password
      }
    );

    if (response.statusCode == 200) {
      // Analyze the response JSON
      final data = json.decode(response.body);
      var result = data['data'];
      final success = data['data'][1];

      if (success == 1) {
        // Save user information locally
        UserModel user = UserModel.fromJson(result[2]);
        UserModel.saveUser(user);

        // Redirect to the home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StartPage()),
        );
      } else {
        // Handle error, display error message, etc.
        final errorMessage = data['data'][0];
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
      // Handle HTTP error, display error message, etc.
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
    // Handle other errors, display error message, etc.
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

  _buildEmailEnter(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        SizedBox(height: 0.0),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              //s
              // border: InputBorder.none ,
              contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Entrer Votre Email',
              hintStyle: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            onChanged: (value) {
              _email = value;
            },
          ),
        ),
      ],
    );
  }

  _buildPasswordEnter(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        SizedBox(height: 0.0),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              //s
              // border: InputBorder.none ,
              contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(
                Icons.key,
                color: Colors.white,
              ),
              hintText: 'Entrer Votre Mot de Passe',
              hintStyle: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            onChanged: (value) {
              _password = value;
            },
          ),
        ),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home:  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white54,
          toolbarHeight: 70.0,
          leadingWidth: 50.0,
          title: Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          leading: FloatingActionButton(
            backgroundColor: Color(0xFF008000),
            child: Icon(
              Icons.arrow_back,
            ),
            onPressed: (){
              
              Navigator.pop(
                  context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                    return HomeScreen();
                  }
                  )
              );
            },
          ),
        ),
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          reverse: true,
          slivers: <Widget>[
            _buildFooter(screenHeight),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildFooter(double screenHeight){
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(50.0),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: Color(0xFF008000),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),

                  //ENTREE EMAIL
                  _buildEmailEnter(),
                  //Entree MDP
                  _buildPasswordEnter(),
                  SizedBox(height: 20.0)

                ],
              ),
            ),
            Container(
              height: 35,
              margin: EdgeInsets.symmetric(horizontal: 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  login(_email, _password);
              
                   // Navigator.push( 
                  //     context,
                  //     MaterialPageRoute<void>(builder: (BuildContext context) {
                  //       return StartPage();
                  //     }
                  //     )
                  // );
                },
                child: Center(
                  child: Text("Login", style:TextStyle(color: Color(0xFF008000), fontSize: 14 , fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              child: Center(
                child: Text("Forgot Password?", style: TextStyle(color: Colors.white, fontSize: 9, fontStyle: FontStyle.italic),),
              ),
            ),

            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10),

              child: InkWell(
                onTap: () {
                  Navigator.push( 
                      context,
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                        return signuppage();
                      }
                      )
                  );
                },
                child: Center(
                  child: Text("Sign Up !", style:TextStyle(color: Colors.white, fontSize: 14 )),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              error,
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
      
    );
  }

}
