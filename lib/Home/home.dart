import 'package:flutter/material.dart';
import 'package:regena/Home/login.dart';
import 'package:regena/Home/signup.dart';
import 'package:regena/carte/mapsscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  
 
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    // final reverse1 = CustomScrollView(reverse: true,);
    // final reverse2 = CustomScrollView(reverse: false,);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        reverse: true,
        slivers: <Widget>[
          _buildFooter(screenHeight),
          _buildHeaderBottom(screenHeight),
          _buildHeader(),
        ],
      ),
    );

  }

  SliverPadding _buildHeader() {
    return SliverPadding(

      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'BIENVENUE SUR',
          style: const TextStyle(color: Color(0xFF008000), fontSize: 40.0, fontWeight: FontWeight.bold),
          textAlign : TextAlign.center,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildHeaderBottom(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(100.0),
          //   topRight: Radius.circular(100.0),
          //   bottomRight: Radius.circular(100.0),
          //   bottomLeft: Radius.circular(100.0),
          // ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 210,
              width: 210,
              decoration: BoxDecoration(
                // color: Color(0xFF008000),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                  topRight: Radius.circular(70.0),
                  bottomLeft: Radius.circular(70.0),
                  bottomRight: Radius.circular(70.0),
                ),
                
                image: DecorationImage(
                  image: AssetImage(
                    'assets/main-img.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //Text('REGENA', style: TextStyle(color: Color(0xFF008000), fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 110),
          ],
        ),
      ),

      // reverse: reverse,
    );
  }

  SliverToBoxAdapter _buildFooter(double screenHeight){
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(70.0),
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
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              
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
                  child: Text("Login", style:TextStyle(color: Color(0xFF008000), fontSize: 20 )),
                ),
              ),
            ),

            SizedBox(height: 20),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF008000),
                border: Border.all(color: Colors.white, width: 3),
              ),
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
                  child: Text("Sign Up", style:TextStyle(color: Colors.white, fontSize: 20 )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
