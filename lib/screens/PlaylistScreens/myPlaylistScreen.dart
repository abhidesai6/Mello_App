import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mello1/api.dart';
import 'package:mello1/drawerScreen.dart';
import 'package:mello1/screens/PlaylistScreens/motivationScreen.dart';
import 'package:mello1/screens/PlaylistScreens/selfDevScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PodcastScreen extends StatefulWidget {
  final String username, email;
  PodcastScreen(this.username, this.email);
  @override
  _PodcastScreenState createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  SharedPreferences sharedPreferences;
  String username;
  String id;
  bool isLoading = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController _oldPassword = new TextEditingController();
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldKey,
        drawer: drawerScreen(context, widget.username, widget.email),
        body: Container(
          child: SafeArea(
              child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Column(
                          children: [
                            AppBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              iconTheme: IconThemeData(color: Colors.grey[800]),
                            ),
                            SizedBox(height: height * 0.015),
                            Column(
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(
                                              left: 35, bottom: 10),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Playlist",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Poppins",
                                                fontSize: 25),
                                          )),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(24, 0, 24, 0),
                                        height: 210.0,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: <Widget>[
                                            // Slider Card 1
                                            Container(
                                              width: 160,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/student1.jpg"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Card(
                                                elevation: 0,
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  splashColor: Colors.purple
                                                      .withAlpha(30),
                                                  onTap: () {
                                                    print('Card tapped.');
                                                    categoryList();
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                5, 0, 0, 5),
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Text(
                                                          "For\nStudent",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),

                                            Container(
                                              width: 160,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/student3.jpg"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Card(
                                                elevation: 0,
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  splashColor: Colors.purple
                                                      .withAlpha(30),
                                                  onTap: () {
                                                    print('Card tapped.');
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                SelfDevelopScreen(
                                                                    widget
                                                                        .username,
                                                                    widget
                                                                        .email)));
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                5, 5, 0, 5),
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          "Self\nDevelopment",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[800],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            //card 2
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Container(
                                              width: 160,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/student2.jpg"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Card(
                                                elevation: 0,
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  splashColor: Colors.purple
                                                      .withAlpha(30),
                                                  onTap: () {
                                                    print('Card tapped.');
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                MotivationScreen(
                                                                    widget
                                                                        .username,
                                                                    widget
                                                                        .email)));
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                5, 0, 0, 5),
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Text(
                                                          "For\nMotivation",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),

                                            //card 3
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text("For Students",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "Poppins")),
                                      ),
                                      Container(
                                        height: height * 0.55,
                                        width: width * 0.8,
                                        child: Center(
                                          child: ListView(
                                            children: [
                                              Divider(height: 0.1),
                                              _createMusicItem(
                                                  "Time Managemnet"),
                                              Divider(height: 0.1),
                                              _createMusicItem("Concentration"),
                                              Divider(height: 0.1),
                                              _createMusicItem("Realtionship"),
                                              Divider(height: 0.1),
                                              _createMusicItem("Stress"),
                                              Divider(height: 0.1),
                                              _createMusicItem("Anxiety"),
                                              Divider(height: 0.1),
                                              _createMusicItem("Confidence "),
                                              Divider(height: 0.1),
                                              _createMusicItem("Self-love"),
                                              Divider(height: 0.1),
                                              _createMusicItem("Sleep"),
                                              Divider(height: 0.1),
                                            ],
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ));
  }

  Widget _createMusicItem(String text) {
    return ListTile(
      hoverColor: Colors.black,
      title: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple,
                ),
                child: Icon(
                  Icons.music_note,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(text,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Poppins")),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "0:00",
                    style: TextStyle(color: Colors.grey[800], fontSize: 10),
                    textAlign: TextAlign.right,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: null,
    );
  }

  categoryList() async {
    setState(() {
      isLoading = true;
    });
    print("Calling");
    Map data = {
      'id': "6",
      'Category_id': 'for_students',
    };
    // print(newPassword);
    print(data.toString());
    final response = await http.post(
      CATEGORY,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'token': id,
        'Category_id': "for_students",
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
