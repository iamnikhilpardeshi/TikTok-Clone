import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          "Pages",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        // automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 32,
      ),
      body: Container(
        child: Container(
          child: Center(
            child: FutureBuilder<List<String>>(
              future: fetchGalleryData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: Card(
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.black26,
                                            // backgroundImage: NetworkImage("userAvatarUrl"),
                                          ),
                                          SizedBox(width: 10),
                                          Text("Username",
                                              style: TextStyle(fontSize: 16)),

                                          // ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child:
                                              Text("About Video Description")),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: PersonalPageCardVideos(),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: IconButton(
                                            icon:
                                                Icon(Icons.people, size: 20.0),
                                            color: Colors.black,
                                            onPressed: () {})),
                                    Expanded(
                                        child: IconButton(
                                            icon:
                                                Icon(Icons.message, size: 20.0),
                                            color: Colors.black,
                                            onPressed: () {})),
                                    Expanded(
                                        child: IconButton(
                                            icon: Icon(Icons.share, size: 20.0),
                                            color: Colors.black,
                                            onPressed: () {}))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<String>> fetchGalleryData() async {
  try {
    final response = await http
        .get(
            'https://kaleidosblog.s3-eu-west-1.amazonaws.com/flutter_gallery/data.json')
        .timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      return compute(parseGalleryData, response.body);
    } else {
      throw Exception('Failed to load');
    }
  } on SocketException catch (e) {
    throw Exception('Failed to load');
  }
}

List<String> parseGalleryData(String responseBody) {
  final parsed = List<String>.from(json.decode(responseBody));
  return parsed;
}

class PersonalPageCardVideos extends StatefulWidget {
  @override
  _PersonalPageCardVideosState createState() => _PersonalPageCardVideosState();
}

class _PersonalPageCardVideosState extends State<PersonalPageCardVideos> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        // "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp5");
    //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    // _controller.autoPlay: false,
    // looping: false,
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              // If the video is playing, pause it.
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // If the video is paused, play it.
                _controller.play();
              }
            });
          },
          child: Center(
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
