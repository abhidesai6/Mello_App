import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mello1/screens/homeScreen.dart';
import 'package:mello1/screens/loginScreen.dart';
import 'package:mello1/screens/signupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  SharedPreferences prefs;
  bool newuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  // ignore: non_constant_identifier_names
  void check_if_already_login() async {
    prefs = await SharedPreferences.getInstance();
    var token ,email;
    token = prefs.getString('user_name');
    email = prefs.getString('email');
    print("user_name $token $email" );

    if (token != null) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomePage(token,email)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(50),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.22),
                    Image.asset('assets/images/mello_logo.png'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.14),
                    GestureDetector(
                      onTap: () => null,
                      child: Container(
                          child: Text(
                        "WELCOME TO MELLO",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.063),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SignUpScreen())),
                      child: Center(
                        child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Create an account to save your progress &\n use rewards",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "LOGIN WITH",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.normal,
                              fontSize: 13),
                          textAlign: TextAlign.center,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: IconButton(
                                icon: Icon(
                                  Icons.email_rounded,
                                  color: Colors.black,
                                ),
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginScreen())))),
                        Container(
                          child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Colors.black,
                              ),
                              onPressed: null),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
