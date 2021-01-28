import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mello1/screens/landingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

logOut(BuildContext context) async {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) => LandingPage()));

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.clear();
}
