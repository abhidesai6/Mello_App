import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mello1/drawerScreen.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExploreScreen extends StatefulWidget {
  final String username,email;
  ExploreScreen(this.username,this.email);
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // SharedPreferences sharedPreferences;
  // String username;
  // String username1;

  // @override
  // void initState() {
  //   super.initState();
  //   getcredentials();
  // }

  // getcredentials() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   username1 = sharedPreferences.getString("user_name");
  //   setState(() {});
  //   // ignore: unnecessary_statements
  //   (() {
  //     username = username1[0].toUpperCase() + username1.substring(1);
  //   });
  //   // username = username1.toUpperCase();
  // }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Widget _createWebView() {
    return WebView(
      initialUrl: "https://www.who.int/",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);

        setState(() {});
        // ignore: unnecessary_statements
        (() {
          if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
        });
      },
    );
  }

  _createDialog(String text, Color color, String text1, Color textColor) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          var width = MediaQuery.of(context).size.width;
          return Center(
            child: Container(
              width: width,
              padding: EdgeInsets.fromLTRB(22, 20, 22, 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: color,
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
                                text1,
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Montserrat",
                                    fontSize: 22),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            ReadMoreText(
                              text,
                              trimLines: 18,
                              colorClickableText: Colors.white,
                              style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Montserrat",
                                  fontSize: 20),
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Read more',
                              trimExpandedText: 'Show less',
                              moreStyle: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Montserrat",
                                  fontSize: 20),
                            ),
                          ],
                        ),
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
                            Container(
                                padding: EdgeInsets.only(left: 35, bottom: 10),
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Explore",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      fontSize: 25),
                                )),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Colors.purple,
                                      child: InkWell(
                                        splashColor:
                                            Colors.purple.withAlpha(30),
                                        onTap: () {
                                          print('Card tapped.');
                                          _createDialog(
                                              "An emerging field called 'Neuro-musicology' has significantly advanced in the last decade to emphasize the connection of Music on the brain. When babies listen to music, especially classical music they make strong music related connections in the brain. Over time continued listening actually changes the way the child's mind works, by creating specific pathways in the brain that would have not been present otherwise.\n\n\nMusic has the ability to improve high order thinking skills like problem solving, analyzing and evaluating information, inference, contrasting similarities and dissimilarities and much more. The cognitive neuroscience of music further emphasizes that music can be a great source for multi-sensory learning, which in turn leads to better retention of information with research-proven cognitive benefits. Learning music by itself is a complex multi sensory experience, engaging both the hemispheres of the brain, with a perfect precision system blended with melody and emotions and continuous feedback from various parts of the brain like the sensory cortex, visual cortex, auditory cortex, hippo campus etc. On the whole music can be a perfect companion to improve ourselves socially, cognitively, psychologically or emotionally.",
                                              Colors.purple,
                                              "Music & Brain",
                                              Colors.white);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 10,
                                                right: 10,
                                                child: Container(
                                                    height: 70,
                                                    width: 70,
                                                    child: Image.asset(
                                                        "assets/images/Explore1.png")),
                                              ),
                                              Positioned(
                                                bottom: 11,
                                                left: 11,
                                                child: Text(
                                                  'Music &\nBrain',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Poppins",
                                                      fontSize: 17),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Colors.indigo[900],
                                      child: InkWell(
                                        splashColor:
                                            Colors.purple.withAlpha(30),
                                        onTap: () {
                                          print('Card tapped.');
                                          _createDialog(
                                              "Music helps in the treatment of actual diseases in the following manners :-\n\n1. One obvious use of music is that of a sedative. It can replace the administration of tranquillizers , or at least reduce the dosage of tranquillizers.\n\n2. Music increases the metabolic activities within the human body. It accelerates the respiration , influence the internal secretion, improves the muscular activities and as such affects the 'Central Nervous System' and Circulatory System of the listener and the performer.",
                                              Colors.indigo[900],
                                              'How Music Helps',
                                              Colors.white);
                                        },
                                        child: Container(
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                right: 10,
                                                child: Container(
                                                    height: 75,
                                                    width: 75,
                                                    child: Image.asset(
                                                        "assets/images/Explore2.png")),
                                              ),
                                              Positioned(
                                                top: 15,
                                                left: 12,
                                                child: Text(
                                                  'How Music\nHelps',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Poppins",
                                                      fontSize: 17),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //Row 2
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Colors.yellow,
                                      child: InkWell(
                                        splashColor:
                                            Colors.purple.withAlpha(30),
                                        onTap: () {
                                          print('Card tapped.');
                                          _createDialog(
                                              "Attempts have been made from long ago to relate the basic notes in Indian music to the eight basic emotions in Indian drama. The notes are sadaja, rishaba, gandhara, madhyama, panchama, dhaibata and nishada, while the moods are sringar (love), hasya (laughter), karuna (compassion), vira (heroism), raudra (wrath), bhayanaka (fear), bibhatsa (disgust) and adbhuta (wonder).\n\nDifferent notes are used to evoke the different emotions. Thus madhyama and panchama are used to create a feeling of love or laughter. Gandhara and nishada are evocative of compassion, while fear and disgust are conveyed by the use of dhaibata. As for sadaja and rishaba, they are commonly used to create a mood of anger, courage or wonder.\n\nThe listener’s counterpart to raga is rasa, the mental and emotional reflection of what is heard as music. The reaction to the music one listens to is both the primary effect of the notes and their arrangement, and a secondary effect of the thoughts and moods evoked by the primary reaction. In ancient Hindu literature, this effect is an offshoot of the ultimate reality which is outside the physical universe, and is in fact the bliss towards which all things work.",
                                              Colors.yellow,
                                              "Music & emotion",
                                              Colors.black);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 10,
                                                right: 10,
                                                child: Container(
                                                    height: 70,
                                                    width: 70,
                                                    child: Image.asset(
                                                        "assets/images/Explore3.png")),
                                              ),
                                              Positioned(
                                                bottom: 11,
                                                left: 11,
                                                child: Text(
                                                  'Music &\nemotion',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Poppins",
                                                      fontSize: 17),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Colors.green[100],
                                      child: InkWell(
                                        splashColor:
                                            Colors.purple.withAlpha(30),
                                        onTap: () {
                                          print('Card tapped.');
                                          _createDialog(
                                              "Music relaxes the muscles, reduces systolic blood pressure, heart rate and even brings down the oxygen saturation, when it is slow, soft, and not accompanied by words. However, faster music causes a rise in these parameters, as well as in the breathing rate and overall sympathetic tone.\n\nCognitive reactions to music strengthen the firing of certain neurons, which may also be used to perform a related task. Thus music helps enhance learning in certain areas, such as verbal learning and abstract conceptualization.\n\nThese effects of music are brought about by many areas of the brain. Dopamine, endorphins, and nitrous oxide are all thought to be involved in the pleasurable sensation of listening to pleasant music. Both emotional and physical effects, such as skin vasodilatation, and a drop in blood pressure, may be observed. Classical music produces no change in stress hormones, and growth hormone, unlike techno-music.",
                                              Colors.green[100],
                                              "Physiologic effects of music",
                                              Colors.black);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                right: 10,
                                                child: Container(
                                                    height: 90,
                                                    width: 90,
                                                    child: Image.asset(
                                                        "assets/images/Explore4.png")),
                                              ),
                                              Positioned(
                                                top: 15,
                                                left: 12,
                                                child: Text(
                                                  'Physiologic\neffects of music',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Poppins",
                                                      fontSize: 16),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Row 3
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Colors.grey[300],
                                      child: InkWell(
                                        splashColor:
                                            Colors.purple.withAlpha(30),
                                        onTap: () {
                                          print('Card tapped.');
                                          _createDialog(
                                              "Positive effects on mood.\nBetter concentration and attention.\nAssists with coping and relaxation.\nHelps understand the person’s inner self, image and personality.\nGives a better awareness of self and environment, and so produces a positive impact on social interactions\nMusic therapy can help to relieve pain and reduce stress and anxiety for the patient, resulting in physiological changes, including:\n\n1.Improved respiration\n2.Lower blood pressure\n3.Improved cardiac output\n4.Reduced heart rate\n5.Relaxed muscle tension",
                                              Colors.grey[300],
                                              "Benefits of Music therapy",
                                              Colors.black);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 5,
                                                right: 5,
                                                child: Container(
                                                    height: 70,
                                                    width: 70,
                                                    child: Image.asset(
                                                        "assets/images/Explore5.png")),
                                              ),
                                              Positioned(
                                                bottom: 10,
                                                left: 10,
                                                child: Text(
                                                  'Benefits of\nMusic therapy',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Poppins",
                                                      fontSize: 17),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Colors.yellowAccent[700],
                                      child: InkWell(
                                        splashColor:
                                            Colors.purple.withAlpha(30),
                                        onTap: () {
                                          print('Card tapped.');
                                          _createDialog(
                                              "Children, adolescents, adults, and the elderly with mental health needs, developmental and learning disabilities, Parkinson’s disease, Alzheimer’s disease and other aging related conditions, substance abuse problems, brain injuries, physical disabilities, and acute and chronic pain, including mothers in labor can benefit from music therapy. Healthy individuals can use music as a wellness tool for stress reduction and relaxation.",
                                              Colors.yellowAccent[700],
                                              "Who can benefit from\nmusic therapy?",
                                              Colors.black);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 10,
                                                right: 10,
                                                child: Container(
                                                    height: 70,
                                                    width: 70,
                                                    child: Image.asset(
                                                        "assets/images/Explore6.png")),
                                              ),
                                              Positioned(
                                                top: 15,
                                                left: 12,
                                                child: Text(
                                                  'Who can benefit\nfrom music\ntherapy?',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Poppins",
                                                      fontSize: 15),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: Colors.purple,
                                child: InkWell(
                                  splashColor: Colors.purple.withAlpha(30),
                                  onTap: () {
                                    print('Card tapped.');
                                    _createWebView();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                            "assets/images/Explore7.png")),
                                  ),
                                ),
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
          )),
        ));
  }
}
