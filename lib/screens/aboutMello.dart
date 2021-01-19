import 'package:flutter/material.dart';
import 'package:mello1/drawerScreen.dart';

class AboutMello extends StatefulWidget {
  final String username,email;
  AboutMello(this.username,this.email);
  @override
  _AboutMelloState createState() => _AboutMelloState();
}

class _AboutMelloState extends State<AboutMello> {
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
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 1,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "About Mello",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Montserrat",
                                  fontSize: 22),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Text(
                            "Music has the ability to improve high order thinking skills like problem solving, analyzing and evaluating information, inference, contrasting similarities and dissimilarities and much more. The cognitive neuroscience of music further emphasizes that music can be a great source for multi-sensory learning, which in turn leads to better retention of information with research-proven cognitive benefits. Learning music by itself is a complex multi sensory experience, engaging both the hemispheres of the brain, with a perfect precision system blended with melody and emotions and continuous feedback from various parts of the brain like the sensory cortex, visual cortex, auditory cortex, hippo campus etc. On the whole music can be a perfect companion to improve ourselves socially, cognitively, psychologically or emotionally.",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Montserrat",
                                fontSize: 20),
                          )
                        ],
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
