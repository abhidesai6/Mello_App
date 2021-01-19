import 'package:flutter/material.dart';
import 'package:mello1/drawerScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  final String username, email;
  HomePage(this.username, this.email);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences sharedPreferences;
  String username;
  String username1;

  @override
  void initState() {
    super.initState();
    getcredentials();
  }

  getcredentials() async {
    sharedPreferences = await SharedPreferences.getInstance();
    username1 = sharedPreferences.getString("user_name");
    setState(() {});
    // ignore: unnecessary_statements
    (() {
      username = username1;
    });
    // username = username1.toUpperCase();
  }

  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  _createStartDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          return Center(
            child: Container(
              height: height * 0.5,
              width: width,
              padding: EdgeInsets.fromLTRB(22, 20, 22, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.purple,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1,
                  padding: EdgeInsets.fromLTRB(15, 18, 15, 18),
                  child: Center(
                    child: Column(
                      children: [
                        _cardFeeling("I am feeling Stressed"),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        _cardFeeling("I am feeling down"),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        _cardFeeling("Not able to Concentrate"),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        _cardFeeling("Low in Confidence"),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        _cardFeeling("Others"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  _createDialog(String text) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          //var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          return Center(
            child: Container(
              width: width,
              padding: EdgeInsets.fromLTRB(22, 20, 22, 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.purple,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Center(
                    child: Container(
                      child: Stack(
                        children: [
                          Text(
                            text,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Montserrat",
                                fontSize: 23),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: drawerScreen(context, widget.username, widget.email),
        body: SafeArea(
            child: Container(
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
                      Image.asset("assets/images/top1.png"),
                      Column(
                        children: [
                          AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            iconTheme: IconThemeData(color: Colors.grey[800]),
                          ),
                          Text(
                            "Hello ${widget.username[0].toUpperCase()}${widget.username.substring(1)}",
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Let's begin your journey",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.fromLTRB(51, 0, 51, 51),
                            height: MediaQuery.of(context).size.height * 0.21,
                            child: Image.asset("assets/images/mello_logo.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 0, 14, 0),
                  height: 130.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 110,
                        height: 130,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.white70,
                          child: InkWell(
                            splashColor: Colors.purple.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                              _createDialog(
                                  "71 % teenagers who play an instrument are less likely to have disciplinary problems. ~ Gallup Poll, “American Attitudes Toward Music");
                            },
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Text(
                                    '01',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Poppins",
                                        fontSize: 45),
                                  ),
                                  Text(
                                    '71%\nTEENAGERS',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Poppins",
                                        fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.015,
                      ),
                      Container(
                        width: 110,
                        height: 130,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.white70,
                          child: InkWell(
                            splashColor: Colors.purple.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                              _createDialog(
                                  "Classical Music has been found to help students perform 12 percent better on their exams.");
                            },
                            child: Container(
                              width: 110,
                              height: 130,
                              child: Column(
                                children: [
                                  Text(
                                    '02',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red[600],
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Poppins",
                                        fontSize: 45),
                                  ),
                                  Text(
                                    'CLASSICAL\nMUSIC',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red[600],
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Poppins",
                                        fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.015,
                      ),
                      Container(
                        width: 110,
                        height: 130,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.white70,
                          child: InkWell(
                            splashColor: Colors.purple.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                              _createDialog(
                                  "Studies have found that music with 50 to 80 beats per minute can enhance and stimulate creativity and learning.");
                            },
                            child: Container(
                              width: 110,
                              height: 130,
                              child: Column(
                                children: [
                                  Text(
                                    '03',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.purple[700],
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Poppins",
                                        fontSize: 45),
                                  ),
                                  Text(
                                    'STUDIES HAVE FOUND',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.purple[700],
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Poppins",
                                        fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                  height: 200.0,
                  child: ListView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      // Slider Card 1
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/Slider1.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.purple.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Music Gives\nA Soul To The\nUniverse",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "Montserrat",
                                        fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      // Slider Card 2
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/Slider2.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.purple.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Music\ntouches us\nemotionally",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "Montserrat",
                                        fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      // Slider Card 3
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.darken),
                              image: AssetImage("assets/images/Slider3.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.purple.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "There is music in every child.The teacher's job is to find it and nurture it.",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "Montserrat",
                                        fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      // Slider Card 4
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/Slider4.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.purple.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Stack(),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      // Slider Card 5
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/Slider5.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.purple.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Stack(),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white70,
                    child: InkWell(
                      splashColor: Colors.purple.withAlpha(30),
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 25, 15, 0),
                        height: MediaQuery.of(context).size.height * 0.28,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Find The Right Track \nFor You',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat",
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Container(
                                alignment: FractionalOffset.bottomCenter,
                                child: Image.asset(
                                  "assets/images/home1.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(22, 20, 22, 0),
                  child: GestureDetector(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.purple.withAlpha(30),
                        onTap: () {
                          print('Card tapped.');
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Center(
                            child: Text(
                              'How are you feeling today?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(22, 20, 22, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: Colors.purple,
                    child: InkWell(
                      splashColor: Colors.purple.withAlpha(30),
                      onTap: () {
                        print('Card tapped.');
                        _createStartDialog(context);
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Center(
                          child: Text(
                            'Start',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ))));
  }

  Widget _cardFeeling(String text) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.black,
              blurRadius: 15.0,
            ),
          ]),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
            fontSize: 19),
      ),
    );
  }
}
