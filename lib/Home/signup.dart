import 'package:flutter/material.dart';
import 'package:regena/Home/home.dart';
import 'package:regena/Home/login.dart';
import 'package:regena/Home/thirdpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class signuppage extends StatefulWidget {

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  
  String _email = '';
  String _password = '';
  String _name = '';
  String error = '';


Future<void> register(String _name, String _email, String _password)  async {

    try {

      if (_name.isEmpty || _email.isEmpty || _password.isEmpty) {
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
      final response = await http.post("https://regena.000webhostapp.com/regena/register.php", body: {
      "_name":_name,
      "_email":_email,
      "_password": _password
      });

       if (response.statusCode == 200) {
        // Analyze the response JSON
        final data = json.decode(response.body);
        final success = data['data'][1];

        if (success == 1 && _name.isNotEmpty && _email.isNotEmpty && _password.isNotEmpty) {
          // Registration successful, display success message, etc.
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Succès'),
              content: Text('Enregistrement réussi.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    //Navigator.pop(context);
                    // Redirect to the home page or login page
                    // based on your app's logic
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => StartPage()),
                    );
                  },
                ),
              ],
            ),
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

  _buildNameEnter(){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nom',
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
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Entre Votre Nom',
              hintStyle: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            onChanged: (value) {
              _name = value;  
            },
          ),
        ),
      ],
    );
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
              hintText: 'Entre Votre Email',
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
                Icons.lock_outline,
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

  // _buildConfirmPasswordEnter(){
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       Text(
  //         'Confirm Password',
  //         style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
  //       ),
  //       SizedBox(height: 0.0),
  //       Container(
  //         alignment: Alignment.centerLeft,
  //         // decoration: kBoxDecorationStyle,
  //         height: 60.0,
  //         child: TextField(
  //           obscureText: true,
  //           style: TextStyle(color: Colors.white),
  //           decoration: InputDecoration(
  //             //s
  //             // border: InputBorder.none ,
  //             contentPadding: EdgeInsets.only(top: 10.0),
  //             prefixIcon: Icon(
  //               Icons.lock_outline,
  //               color: Colors.white,
  //             ),
  //             hintText: 'Confirmer Votre Mot de Passe',
  //             hintStyle: TextStyle(
  //               fontStyle: FontStyle.italic,
  //             ),
  //           ),
  //            onChanged: (value) {
  //             _password = value;  
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // createAccountPressed() async{
  //   bool emailValid = RegExp(
  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //     .hasMatch(_email);
  //   if(emailValid){
  //     http.Response response = await AuthServices.register(_name, _email, _password);
  //     Map responseMap = jsonDecode(response.body);
  //     if (response.statusCode==200) {
  //       Navigator.push( 
  //            context,
  //           MaterialPageRoute<void>(builder: (BuildContext context) {
  //               return StartPage();
  //           } 
  //           )
  //     );
  //     }else{
  //       errorSnackBar(context, responseMap.values.first[0]);
  //     }

  //   }else{
  //     errorSnackBar(context, 'l`email est non valide');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white54,
          toolbarHeight: 70.0,
          leadingWidth: 50.0,
          title: Text(
            'Sign Up',
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
                    'Create A New Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  SizedBox(height: 20.0),

                  //ENTRER NOM
                  _buildNameEnter(),
                  //ENTREE EMAIL
                  _buildEmailEnter(),
                  //Entree MDP
                  _buildPasswordEnter(),
                  //CONFIRM PASSWORD
                 // _buildConfirmPasswordEnter(),
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
                   //createAccountPressed();
                   register(_email, _name, _password);
                },
                child: Center(
                  child: Text("Sign Up", style:TextStyle(color: Color(0xFF008000), fontSize: 14 , fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                Navigator.push( 
                      context,
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                        return loginpage();
                      }
                      )
                  );
              },
              child: Center(
                child: Text("Already Have A Account?", style: TextStyle(color: Colors.white, fontSize: 9, fontStyle: FontStyle.italic),),
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
                        return loginpage();
                      }
                      )
                  );
                },
                child: Center(
                  child: Text("Login !", style:TextStyle(color: Colors.white, fontSize: 14 )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

