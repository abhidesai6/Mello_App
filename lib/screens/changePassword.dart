import 'package:flutter/material.dart';
import 'package:mello1/api.dart';
import 'package:mello1/drawerScreen.dart';
import 'package:mello1/pallete.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChangePassword extends StatefulWidget {
  final String username,email;
  ChangePassword(this.username,this.email);
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  SharedPreferences sharedPreferences;
  String username;
  String username1, oldPass, newPass, reNewPass, id;
  bool isLoading = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController _oldPassword = new TextEditingController();
  TextEditingController _newPassword = new TextEditingController();
  TextEditingController _reNewPassword = new TextEditingController();
  @override
  void initState() {
    super.initState();
    getcredentials();
  }

  getcredentials() async {
    sharedPreferences = await SharedPreferences.getInstance();
    username = sharedPreferences.getString("user_name");
    id = sharedPreferences.getString("id");
    // setState(() {});
    // // ignore: unnecessary_statements
    // (() {
    //   username = username1.toUpperCase() + username1.substring(1);
    // });
    // username = username1.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        drawer: drawerScreen(context, widget.username,widget.email),
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
                              obscureText: true,
                              controller: _oldPassword,
                              decoration: new InputDecoration(
                                labelText: "Old Password",
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
                                  return "Password cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.visiblePassword,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                              onSaved: (val) {
                                oldPass = val;
                              },
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              obscureText: true,
                              controller: _newPassword,
                              decoration: new InputDecoration(
                                labelText: "New Password",
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
                              keyboardType: TextInputType.visiblePassword,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                              onSaved: (val) {
                                newPass = val;
                              },
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: new InputDecoration(
                                labelText: "Confirm New Password",
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
                                  // ignore: deprecated_member_use
                                  _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Password is Required")));
                                }
                              },
                              keyboardType: TextInputType.visiblePassword,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                              controller: _reNewPassword,
                              onSaved: (val) {
                                reNewPass = val;
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
                                    if (_oldPassword.text.isEmpty ||
                                        _newPassword.text.isEmpty ||
                                        _reNewPassword.text.isEmpty) {
                                      // ignore: deprecated_member_use
                                      _scaffoldKey.currentState.showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  "Please Fill all fileds")));
                                      return;
                                    }
                                    if (_newPassword.text ==
                                        _reNewPassword.text) {
                                      changePassword(
                                          _oldPassword.text,
                                          _newPassword.text,
                                          _reNewPassword.text);
                                    } else {
                                      // ignore: deprecated_member_use
                                      _scaffoldKey.currentState.showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  "Confirm Password Incorrect")));
                                      return;
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
                                          "Change Password",
                                          style: kBodyText.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                ),
                              ),
                            ),
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

  changePassword(
      String oldPassword, String newPassword, String reNewPassword) async {
    setState(() {
      isLoading = true;
    });
    print("Calling");
    Map data = {
      'id': id,
      'old_password': oldPassword,
      'new_passowrd': newPassword,
      'confirm_passowrd': reNewPassword
    };
    print(newPassword);
    print(data.toString());
    final response = await http.post(
      PASSWORD,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'old_password': oldPassword,
        'new_password': newPassword,
        'confirm_password': reNewPassword,
      }),
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
