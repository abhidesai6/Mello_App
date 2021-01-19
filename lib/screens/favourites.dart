import 'package:flutter/material.dart';
import 'package:mello1/drawerScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteScreen extends StatefulWidget {
  final String username,email;
  FavouriteScreen(this.username,this.email);
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  SharedPreferences sharedPreferences;
  String username;
  String username1;



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: drawerScreen(context, widget.username,widget.email),
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
                                            "Favorites",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Poppins",
                                                fontSize: 25),
                                          )),
                                      Container(
                                        child: Center(
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            color: Colors.green[100],
                                            child: InkWell(
                                              splashColor:
                                                  Colors.purple.withAlpha(30),
                                              onTap: () {
                                                print('Card tapped.');
                                              },
                                              child: Container(
                                                height: height * 0.8,
                                                width: width * 0.9,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: width * 0.37,
                                                      height: height * 1,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 5),
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/Playlist1.png",
                                                                  width: width *
                                                                      0.2,
                                                                  height:
                                                                      height *
                                                                          0.06,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  height * 0.3),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Image.asset(
                                                              "assets/images/Playlist2.png",
                                                              width:
                                                                  width * 0.45,
                                                              height:
                                                                  height * 0.15,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: width * 0.5,
                                                      child: Center(
                                                        child: ListView(
                                                          children: [
                                                            _createMusicItem(),
                                                            Divider(
                                                                height: 0.1),
                                                            _createMusicItem(),
                                                            Divider(
                                                                height: 0.1),
                                                            _createMusicItem(),
                                                            Divider(
                                                                height: 0.1),
                                                            _createMusicItem(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ));
  }

  Widget _createMusicItem() {
    return ListTile(
      hoverColor: Colors.black,
      title: Container(
        child: Center(
          child: Row(
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
                child: Text("Songs",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Poppins")),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "0:00",
                  style: TextStyle(color: Colors.grey[800], fontSize: 10),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: null,
    );
  }
}
