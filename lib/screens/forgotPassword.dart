import 'package:flutter/material.dart';
import 'package:mello1/api.dart';
// import 'package:mello1/drawerScreen.dart';
import 'package:mello1/pallete.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  SharedPreferences sharedPreferences;
  String email, username, username1;
  bool isLoading = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController _emailPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        body: SafeArea(
            child: Container(
          child: Center(
            child: SingleChildScrollView(
              //controller: controller,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 1,
                      child: Image.asset(
                    "assets/images/Bg.png",
                    fit: BoxFit.fill,
                  )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        iconTheme: IconThemeData(color: Colors.grey[800]),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.15),
                            TextFormField(
                              //obscureText: true,
                              controller: _emailPassword,
                              decoration: new InputDecoration(
                                labelText: "Registered Email",
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
                                  return "email cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                              onSaved: (val) {
                                email = val;
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black,
                                ),
                                child: FlatButton(
                                  onPressed: () {
                                    if (isLoading) {
                                      return;
                                    }
                                    if (_emailPassword.text.isEmpty) {
                                      // ignore: deprecated_member_use
                                      _scaffoldKey.currentState.showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text("Please fill email")));
                                      return;
                                    } else {
                                      forgotPassword(_emailPassword.text);
                                    }
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
                                          "Send Link",
                                          style: kBodyText.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.5),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )));
  }

  forgotPassword(String email) async {
    setState(() {
      isLoading = true;
    });
    print("Calling");
    Map data = {'email': email};
    print(data.toString());
    final response = await http.post(
      FORGOTPASS,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email}),
    );
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      Map<String, dynamic> resposne = jsonDecode(response.body);
      print(resposne.toString());
      if (resposne['error'] == null) {
        // Map<String, dynamic> user = resposne['data'];
        // print(user.toString());
        // print(" User name ${user['user_name']}");
        //  savePref(1, user['user_name'], user['email'], user['id']);
        //savePref(1, name, email);
        _scaffoldKey.currentState
            // ignore: deprecated_member_use
            .showSnackBar(SnackBar(content: Text("${resposne['success']}")));
      } else {
        print(" ${resposne['error']}");
      }
      _scaffoldKey.currentState
          // ignore: deprecated_member_use
          .showSnackBar(SnackBar(content: Text("${resposne['error']}")));
    } else {
      _scaffoldKey.currentState
          // ignore: deprecated_member_use
          .showSnackBar(SnackBar(content: Text("Please Try again")));
    }
  }
}
