import 'package:AlcaTiktok/Home/pages/Profile/Tabs/Upload/UploadedVideosList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

class UploadedVideos extends StatelessWidget {
  const UploadedVideos({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Center(
          child: FutureBuilder<List<String>>(
            future: fetchGalleryData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(2),
                      child: GestureDetector(
                        onDoubleTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UploadedVideosList()));
                        },
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               UploadVideosListCard()));
                        // },
                        child: Card(
                          child: UploadedVideosCard(),
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

class UploadedVideosCard extends StatefulWidget {
  @override
  _UploadedVideosCardState createState() => _UploadedVideosCardState();
}

class _UploadedVideosCardState extends State<UploadedVideosCard> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
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

// class UploadedVideos extends StatelessWidget {
//   const UploadedVideos({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder<List<String>>(
//         future: fetchGalleryData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return GridView.builder(
//                 itemCount: snapshot.data.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3),
//                 itemBuilder: (context, index) {
//                   return Padding(
//                       padding: EdgeInsets.all(0),
//                       child: Card(
//                         clipBehavior: Clip.antiAlias,
//                         child: Column(
//                           children: [
//                             Expanded(
//                               child: GestureDetector(
//                                 onLongPress: () {
//                                   showDialog(
//                                       context: context,
//                                       builder: (BuildContext context) {
//                                         return AlertDialog(
//                                           backgroundColor: Colors.transparent,
//                                           content: Expanded(
//                                             child: Container(
//                                               color: Colors.transparent,
//                                               height: 300,
//                                               width: 300,
//                                               child: Card(
//                                                   clipBehavior: Clip.antiAlias,
//                                                   child: Column(children: [
//                                                     Expanded(
//                                                       child: Container(
//                                                           decoration: new BoxDecoration(
//                                                               image: new DecorationImage(
//                                                                   image: new NetworkImage(
//                                                                       snapshot.data[
//                                                                           index]),
//                                                                   fit: BoxFit
//                                                                       .cover))),
//                                                     ),
//                                                   ])),
//                                             ),
//                                           ),
//                                         );
//                                       });
//                                 },
//                                 child: Container(
//                                     decoration: new BoxDecoration(
//                                         image: new DecorationImage(
//                                             image: new NetworkImage(
//                                                 snapshot.data[index]),
//                                             fit: BoxFit.cover))),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ));
//                 });
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }

// }

// Future<List<String>> fetchGalleryData() async {
//   try {
//     final response = await http
//         .get(
//             'https://kaleidosblog.s3-eu-west-1.amazonaws.com/flutter_gallery/data.json')
//         .timeout(Duration(seconds: 5));

//     if (response.statusCode == 200) {
//       return compute(parseGalleryData, response.body);
//     } else {
//       throw Exception('Failed to load');
//     }
//   } on SocketException catch (e) {
//     throw Exception('Failed to load');
//   }
// }

// List<String> parseGalleryData(String responseBody) {
//   final parsed = List<String>.from(json.decode(responseBody));
//   return parsed;
// }
