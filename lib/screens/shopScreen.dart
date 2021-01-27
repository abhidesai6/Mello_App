import 'package:flutter/material.dart';
import '../drawerScreen.dart';

class ShopScreen extends StatefulWidget {
  final String username,email;
  ShopScreen(this.username,this.email);
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: drawerScreen(context, widget.username,widget.email),
        body: SafeArea(
            child: Container(
                child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
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
                          Container(
                            padding: EdgeInsets.only(left: 24),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Shop",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                  fontSize: 25),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      _cardContainer("assets/images/shop1.png"),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      _cardContainer("assets/images/shop2.png"),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size  
                                                  .height *
                                              0.03),
                                      _cardContainer("assets/images/shop3.png"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01),
                                Container(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 70),
                                      _cardContainer("assets/images/shop4.png"),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      _cardContainer("assets/images/shop5.png"),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      _cardContainer("assets/images/shop6.png"),
                                    ],
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
              ],
            ),
          ),
        ))));
  }

  Widget _cardContainer(String text) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          splashColor: Colors.purple.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Image.asset(text, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
