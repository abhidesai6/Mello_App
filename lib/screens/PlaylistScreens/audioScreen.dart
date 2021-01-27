import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  bool isPlaying = false;
  AudioPlayer audioPlayer;
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  play(url) async {
    int result = await audioPlayer.play(url);
    if (result == 1) {
      // success
      // setState(() {
      //   isPlaying = true;
      // });
      print('Success');
    }
  }

  pauseAudio() async {
    int response = await audioPlayer.pause();
    if (response == 1) {
      // success

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
      // success

    } else {
      print('Some error occured in resuming');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          if (isPlaying == true) {
                            pauseAudio();
                            setState(() {
                              isPlaying = false;
                            });
                          } else {
                            resumeAudio();
                            setState(() {
                              isPlaying = true;
                            });
                          }
                        },
                        child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          stopAudio();
                          setState(() {
                            isPlaying = false;
                          });
                        },
                        child: Icon(Icons.stop),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  child: Text("Load"),
                  onPressed: () async {
                    // Uri image = Uri.parse
                    var path =
                        ('https://vrdesignsolutions.com/khushi_apps/assets/upload/22_-_Taylor_Swift.m4a');
                    //     ;
                    setState(() {
                      isPlaying = true;
                    });
                    play(path);
                  },
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
