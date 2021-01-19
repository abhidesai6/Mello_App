import 'package:flutter/material.dart';
import 'package:mello1/drawerScreen.dart';

class InfographicsScreen extends StatefulWidget {
  final String username,email;
  InfographicsScreen(this.username,this.email);
  @override
  _InfographicsScreenState createState() => _InfographicsScreenState();
}

class _InfographicsScreenState extends State<InfographicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerScreen(context, widget.username,widget.email),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[800]),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(22, 20, 22, 20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.purple,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 1,
                padding: EdgeInsets.fromLTRB(20, 90, 20, 20),
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          "Coming Soon....!!",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Montserrat",
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
