import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mello1/api.dart';
import 'package:http/http.dart' as http;
import 'package:mello1/static.dart';

class AudioListScreen extends StatefulWidget {
  String subcategory;
  String category;
  AudioListScreen(this.subcategory, this.category);
  @override
  _AudioListScreenState createState() => _AudioListScreenState();
}

class _AudioListScreenState extends State<AudioListScreen> {
  bool _isPlaying = false;
  bool _isPaused = false;
  AudioPlayer audioPlayer;
  bool isLoading = false;
  List<String> songList = List<String>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    categoryList();
    audioPlayer = AudioPlayer();
  }

  play(url) async {
    int result = await audioPlayer.play(url);
    if (result == 1) {
      setState(() {
        _isPlaying = true;
      });
    }
  }

  pauseAudio() async {
    int response = await audioPlayer.pause();
    if (response == 1) {
      setState(() {
        _isPaused = true;
        _isPlaying = false;
      });
    } else {
      print('Some error occured in pausing');
    }
  }

  stopAudio() async {
    int response = await audioPlayer.stop();
    if (response == 1) {
      // success

    } else {
      print('Some error occured in stopping');
    }
  }

  resumeAudio() async {
    int response = await audioPlayer.resume();
    if (response == 1) {
      setState(() {
        _isPaused = false;
        _isPlaying = true;
      });
    } else {
      print('Some error occured in resuming');
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldKey,
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
                                            widget.subcategory,
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
                                            child: Container(
                                              height: height * 0.8,
                                              width: width * 0.9,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: width * 0.9,
                                                    child: Center(
                                                      child: ListView.builder(
                                                        itemCount:
                                                            songList.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return GestureDetector(
                                                            child: ListTile(
                                                              title: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(0),
                                                                child: Column(
                                                                  children: [
                                                                    _createMusicItem(
                                                                        songList[
                                                                            index]),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            onTap: () async {
                                                              _isPlaying
                                                                  ? _isPaused
                                                                      ? resumeAudio()
                                                                      : pauseAudio()
                                                                  : play(
                                                                      "https://vrdesignsolutions.com/khushi_apps/assets/upload/${songList[index]}");
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
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

  Widget _createMusicItem(String songName) {
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: MarqueeWidget(
                      direction: Axis.horizontal,
                      child: Text(
                        songName,
                        style: TextStyle(
                            fontWeight: _isPlaying
                                ? FontWeight.bold
                                : FontWeight.normal),
                      )),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
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
      'category_name': widget.category,
      'sub_category_name': widget.subcategory,
    };
    // print(newPassword);
    print(data.toString());
    final response = await http.post(
      SUB_CATEGORY,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'category_name': widget.category,
        'sub_category_name': widget.subcategory,
      }),
    );
    print(response.statusCode.toString());
    print("Debug");
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      Map<String, dynamic> resposne = jsonDecode(response.body);
      print(resposne.toString());
      if (resposne['error'] == null) {
        List<dynamic> user = resposne['sub_category'];
        print(user.toString());
        if (songList.isEmpty) {
          for (int i = 0; i < user.length; i++) {
            Map temp = user[i];
            print(temp['image']);
            String tempS = temp['image'].toString();
            songList.add(tempS);
          }
        }
      } else {
        print(" ${resposne['error']}");
      }
      // _scaffoldKey.currentState
      //     // ignore: deprecated_member_use
      //     .showSnackBar(SnackBar(content: Text("${resposne['error']}")));
    } else {
      _scaffoldKey.currentState
          // ignore: deprecated_member_use
          .showSnackBar(SnackBar(content: Text("Please Try again")));
    }
  }
}
