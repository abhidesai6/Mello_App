import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mello1/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApp extends StatefulWidget {
  final String username, email;
  bool isLoading;
  ProfileApp(this.username, this.email);
  @override
  _ProfileAppState createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  SharedPreferences sharedPreferences;
  String username, email, id;
  //String username1;
  bool isLoading = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController _email = new TextEditingController();
  TextEditingController _username = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getcredentials();
  }

  getcredentials() async {
    sharedPreferences = await SharedPreferences.getInstance();
    username = sharedPreferences.getString("user_name");
    email = sharedPreferences.getString("email");
    id = sharedPreferences.getString("id");
    print(username);
    print(email);
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.purple, Colors.purpleAccent])),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(
                          "${widget.username[0].toUpperCase()}",
                          style: TextStyle(fontSize: 40, color: Colors.purple),
                        ),
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "${widget.username}",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Email",
                                      style: TextStyle(
                                        color: Colors.purpleAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "${widget.email}",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.purpleAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            //obscureText: true,
            decoration: new InputDecoration(
              labelText: "New Username",
              fillColor: Colors.white,
              contentPadding: EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
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
                    SnackBar(content: Text("Password is Required")));
              }
            },
            keyboardType: TextInputType.visiblePassword,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
            controller: _username,
            onSaved: (val) {
              username = val;
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300.00,
            child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.purpleAccent, Colors.purple]),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Update Username",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            obscureText: true,
            decoration: new InputDecoration(
              labelText: "New Email id",
              fillColor: Colors.white,
              contentPadding: EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
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
                    SnackBar(content: Text("Password is Required")));
              }
            },
            keyboardType: TextInputType.visiblePassword,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
            controller: _email,
            onSaved: (val) {
              email = val;
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300.00,
            child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.purpleAccent, Colors.purple]),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Update Email",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  changePassword(String id, String email, String username) async {
    setState(() {
      isLoading = true;
    });
    print("Calling");
    Map data = {
      'id': id,
      'email': email,
      'user_name': username,
    };
    print(username);
    print(data.toString());
    final response = await http.post(
      PASSWORD,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'email': email,
        'user_name': username,
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
