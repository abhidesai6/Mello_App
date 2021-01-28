import 'package:flutter/material.dart';
import 'package:mello1/screens/PlaylistScreens/myPlaylistScreen.dart';
import 'package:mello1/screens/aboutMello.dart';
import 'package:mello1/screens/changePassword.dart';
import 'package:mello1/screens/exploreScreen.dart';
import 'package:mello1/screens/favourites.dart';
import 'package:mello1/screens/homeScreen.dart';
import 'package:mello1/screens/infographicsScreen.dart';
import 'package:mello1/screens/logOut.dart';
import 'package:mello1/screens/podcastScreen.dart.dart';
import 'package:mello1/screens/profileScreen.dart';
import 'package:mello1/screens/shopScreen.dart';


Widget drawerScreen(BuildContext context, String username, String email) {
  return Drawer(
    child: Container(
      padding: EdgeInsets.all(20),
      color: Colors.grey[900],
      child: ListView(
        padding: EdgeInsets.only(left: 5),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createHeader(),
              ListTile(
                hoverColor: Colors.black,
                title: Center(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 40),
                        child: Text('HELLO ${username.toUpperCase()}',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins")),
                      )
                    ],
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            HomePage(username, email))),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
          ),
          _createDrawerItem(
            text: 'Playlist',
            fontsize: 17,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PodcastScreen(username, email))),
          ),
          _createDrawerItem(
            text: 'Favorite',
            fontsize: 17,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        FavouriteScreen(username, email))),
          ),
          _createDrawerItem(
            text: 'Podcast',
            fontsize: 17,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MyPlalistScreen(username, email))),
          ),
          _createDrawerItem(
            text: 'Explore',
            fontsize: 17,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ExploreScreen(username, email))),
          ),
          _createDrawerItem(
            text: 'Infographics',
            fontsize: 17,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        InfographicsScreen(username, email))),
          ),
          _createDrawerItem(
            text: 'Shop',
            fontsize: 17,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ShopScreen(username, email))),
          ),
          Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
          ),
          _createDrawerItem(
            text: 'Edit Profile',
            fontsize: 15,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ProfileApp(username, email))),
          ),
          _createDrawerItem(
            text: 'Change Password',
            fontsize: 14,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ChangePassword(username, email))),
          ),
          _createDrawerItem(
            text: 'About Mello',
            fontsize: 15,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        AboutMello(username, email))),
          ),
          _createDrawerItem(text: 'Terms & Conditions', fontsize: 15),
          _createDrawerItem(
              text: 'Logout', fontsize: 15, onTap: () => logOut(context)),
          ListTile(
            title: Text(
              'Mello version 0.0.1',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}

Widget _createHeader() {
  return DrawerHeader(
    child: Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/podcast1.png'))),
      ),
    ),
  );
}

Widget _createDrawerItem(
    {String text, double fontsize, GestureTapCallback onTap}) {
  return ListTile(
    hoverColor: Colors.black,
    title: Center(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(text,
                style: TextStyle(
                    fontSize: fontsize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins")),
          )
        ],
      ),
    ),
    onTap: onTap,
  );
}
