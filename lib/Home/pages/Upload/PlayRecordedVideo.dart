import 'dart:io';
import 'package:AlcaTiktok/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart' as PackagageVideoPlayer;

class PlayRecordedVideo extends StatefulWidget {
  final String path;
  PlayRecordedVideo({@required this.path});
  @override
  _PlayRecordedVideoState createState() => _PlayRecordedVideoState();
}

class _PlayRecordedVideoState extends State<PlayRecordedVideo> {
  FlutterFFmpeg fFmpeg;
  PackagageVideoPlayer.VideoPlayerController _controller;
  File fileInfo;
  final spinkit = SpinKitChasingDots(
    color: Colors.white,
    size: 50.0,
  );
  void getVideo() async {
    fileInfo = File(widget.path);
    _controller = PackagageVideoPlayer.VideoPlayerController.file(fileInfo)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  void initState() {
    super.initState();
    getVideo();
    fFmpeg = new FlutterFFmpeg();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Video Preview",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 32,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
              color: Colors.black54),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            child: _controller == null
                ? spinkit
                : _controller.value.initialized
                    ? GestureDetector(
                        onTap: () {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        },
                        child: Card(
                          child: Container(
                            child: PackagageVideoPlayer.VideoPlayer(
                              _controller,
                            ),
                          ),
                        ),
                      )
                    : spinkit,
          ),
        ],
      ),
    );
  }
}
