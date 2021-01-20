import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mello1/api.dart';
import 'package:http/http.dart' as http;
import 'package:mello1/pallete.dart';
import 'package:mello1/screens/forgotPassword.dart';
import 'package:mello1/screens/homeScreen.dart';
import 'package:mello1/screens/signupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  bool isLoading = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    //main widget
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            // BackgroundImage(
            //   image: 'assets/images/Bg.png',
            // ),
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
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Image.asset('assets/images/mello_logo.png'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.all(21),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: new InputDecoration(
                                labelText: "Enter Email",
                                fillColor: Colors.white,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if (val.length == 0) {
                                  return "Email cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (val) {
                                email = val;
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: new InputDecoration(
                                labelText: "Password",
                                fillColor: Colors.white,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              // ignore: missing_return
                              validator: (String value) {
                                if (value.trim().isEmpty) {
                                  return 'Password is required';
                                }
                              },
                              onSaved: (val) {
                                password = val;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.purple,
                                ),
                                child: FlatButton(
                                  onPressed: () {
                                    if (isLoading) {
                                      return;
                                    }
                                    if (_emailController.text.isEmpty ||
                                        _passwordController.text.isEmpty) {
                                      // ignore: deprecated_member_use
                                      _scaffoldKey.currentState.showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  "Please Fill all fileds")));
                                      return;
                                    }
                                    login(_emailController.text,
                                        _passwordController.text);
                                    setState(() {
                                      isLoading = true;
                                    });
                                  },
                                  child: isLoading
                                      ? Visibility(
                                          visible: isLoading,
                                          child: Container(
                                              child:
                                                  CircularProgressIndicator()))
                                      : Text(
                                          "Continue",
                                          style: kBodyText.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.purple,
                                ),
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ForgotPassword()));
                                  },
                                  child: Text(
                                    "Forgot Password",
                                    style: kBodyText.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            GestureDetector(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignUpScreen())),
                              child: Container(
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have an account ?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "SIGNUP",
                                        style: TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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

  login(email, password) async {
    setState(() {
      isLoading = true;
    });
    Map<String, String> data = {'email': email, 'password': password};
    print(data.toString());
    final response = await http.post(
      LOGIN,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> resposne = jsonDecode(response.body);
      print(resposne.toString());
      if (resposne['error'] == null) {
        Map<String, dynamic> user = resposne['fruits_details'];
        print(" UserName ${user['token']}");
        _scaffoldKey.currentState
            // ignore: deprecated_member_use
            .showSnackBar(SnackBar(content: Text("${resposne['success']}")));
        savePref(1, user['user_name'], user['email'], user['id'].toString(),user['token']);
        
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage(user['user_name'], user['email'])));
      } else {
        print(" ${resposne['message']}");
      }
      _scaffoldKey.currentState
          // ignore: deprecated_member_use
          .showSnackBar(SnackBar(content: Text("${resposne['error']}")));
    } else {
      _scaffoldKey.currentState
          // ignore: deprecated_member_use
          .showSnackBar(SnackBar(content: Text("Please try again!")));
    }
  }

  savePref(int value, String name, String email, String id,String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(token);
    preferences.setInt("value", value);
    preferences.setString("user_name", name);
    preferences.setString("email", email);
    preferences.setString("id", id);
    preferences.setString("token", token);
    // ignore: deprecated_member_use
    preferences.commit();
  }
}
