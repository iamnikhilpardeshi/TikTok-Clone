import 'package:AlcaTiktok/Home/pages/Upload/PlayRecordedVideo.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart' as PackagageVideoPlayer;

class VideoDuet extends StatefulWidget {
  @override
  _VideoDuetState createState() {
    return _VideoDuetState();
  }
}

class _VideoDuetState extends State<VideoDuet> {
  CameraController controller;
  String videoPath;
  File _video;
  VideoPlayerController _videoPlayerController;

  List<CameraDescription> cameras;
  int selectedCameraIdx;

  FlutterFFmpeg fFmpeg;
  PackagageVideoPlayer.VideoPlayerController _controller;
  File fileInfo;
  final spinkit = SpinKitChasingDots(
    color: Colors.white,
    size: 50.0,
  );
  void getVideo() async {
    // fileInfo = File(widget.path);
    // _controller = PackagageVideoPlayer.VideoPlayerController.file(fileInfo)
    _controller = PackagageVideoPlayer.VideoPlayerController.network(
        "https://firebasestorage.googleapis.com/v0/b/akshayugaletest.appspot.com/o/video%2Fdemo3.mp4?alt=media&token=3d4a002c-0d3a-495c-8d7e-5f4a24a7bbeb")
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  _pickVideo() async {
    File video = await ImagePicker.pickVideo(source: ImageSource.gallery);

    _video = video;

    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });

    videoPath = _video.path;

    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => PlayRecordedVideo(
          //call recorded files
          path: videoPath,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    getVideo();
    fFmpeg = new FlutterFFmpeg();

    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });

        _onCameraSwitched(cameras[selectedCameraIdx]).then((void v) {});
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          "",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 32,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blue[50],
            height: MediaQuery.of(context).size.height * 0.50,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  color: Colors.red,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Center(
                        child: _cameraPreviewWidget(),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        color: controller != null &&
                                controller.value.isRecordingVideo
                            ? Colors.redAccent
                            : Colors.grey,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  color: Colors.red[50],
                  child: Expanded(
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
                                child: Container(
                                  child: PackagageVideoPlayer.VideoPlayer(
                                    _controller,
                                  ),
                                ),
                              )
                            : spinkit,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _galleryControlRowWidget(),
                _captureControlRowWidget(),
                _cameraTogglesRowWidget(),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 70.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.blue[50],
                  onPressed: () {},
                  shape: StadiumBorder(),
                  child: Text("Next"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
  }

  // Display 'Loading' text when the camera is still loading.
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraTogglesRowWidget() {
    if (cameras == null) {
      return Row();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: FlatButton.icon(
            onPressed: _onSwitchCamera,
            icon: Icon(
              _getCameraLensIcon(lensDirection),
              color: Colors.black,
            ),
            label: Text(
              "${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1)}",
              style: TextStyle(color: Colors.black),
            )),
      ),
    );
  }

  /// Display the control bar with buttons to record videos.
  Widget _captureControlRowWidget() {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RecordButton(controller: controller),
          ],
        ),
      ),
    );
  }

  Widget _galleryControlRowWidget() {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _pickVideo();
                print("gallery");
              },
              child: Column(
                children: [
                  Icon(
                    Icons.photo_library,
                    color: Colors.black,
                    size: 25,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<void> _onCameraSwitched(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        Fluttertoast.showToast(
            msg: 'Camera error ${controller.value.errorDescription}',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            // timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _onSwitchCamera() {
    selectedCameraIdx =
        selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIdx];

    _onCameraSwitched(selectedCamera);

    setState(() {
      selectedCameraIdx = selectedCameraIdx;
    });
  }

  void _onRecordButtonPressed() {
    _startVideoRecording().then((String filePath) {
      if (filePath != null) {
        Fluttertoast.showToast(
            msg: 'Recording video started',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            // timeInSecForIos: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white);
      }
    });
  }

  void _onStopButtonPressed() {
    _stopVideoRecording().then((_) {
      if (mounted) setState(() {});
      Fluttertoast.showToast(
          msg: 'Video recorded to $videoPath',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          // timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white);
    });
  }

  Future<String> _startVideoRecording() async {
    if (!controller.value.isInitialized) {
      Fluttertoast.showToast(
          msg: 'Please wait',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          // timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white);

      return null;
    }

    // Do nothing if a recording is on progress
    if (controller.value.isRecordingVideo) {
      return null;
    }

    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String videoDirectory = '${appDirectory.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath = '$videoDirectory/${currentTime}.mp4';

    try {
      await controller.startVideoRecording(filePath);
      videoPath = filePath;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    return filePath;
  }

  Future<void> _stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);

    Fluttertoast.showToast(
        msg: 'Error: ${e.code}\n${e.description}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        // timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}

class RecordButton extends StatefulWidget {
  final CameraController controller;
  RecordButton({@required this.controller});
  @override
  _RecordButtonState createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton>
    with TickerProviderStateMixin {
  double percentage = 0.0;
  double newPercentage = 0.0;
  double videoTime = 0.0;
  String videoPath;
  Timer timer;
  AnimationController percentageAnimationController;
  @override
  void initState() {
    super.initState();
    setState(() {
      percentage = 0.0;
    });
    percentageAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {
          percentage = lerpDouble(
              percentage, newPercentage, percentageAnimationController.value);
        });
      });
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void onVideoRecordButtonPressed() {
    startVideoRecording().then((String filePath) {
      if (mounted) setState(() {});
      if (filePath != null) print('Saving video to $filePath');
    });
  }

  Future<String> startVideoRecording() async {
    if (!widget.controller.value.isInitialized) {
      return null;
    }

    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Movies/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.mp4';

    if (widget.controller.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return null;
    }

    try {
      setState(() {
        videoPath = filePath;
      });
      await widget.controller.startVideoRecording(filePath);
    } on CameraException catch (e) {
      return null;
    }
    return filePath;
  }

  Future<void> stopVideoRecording() async {
    if (!widget.controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await widget.controller.stopVideoRecording();
    } on CameraException catch (e) {
      return null;
    }
  }

  void playVideo() {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => PlayRecordedVideo(
          //call recorded files
          path: videoPath,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        height: 80.0,
        width: 80.0,
        child: new CustomPaint(
          foregroundPainter: new RecordButtonPainter(
              lineColor: Colors.black12,
              // completeColor: Color(0xFFee5253),
              completeColor: Colors.white,
              completePercent: percentage,
              width: 8.0),
          child: new Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onLongPress: () {
                startVideoRecording();
                timer = new Timer.periodic(
                  Duration(milliseconds: 1),
                  (Timer t) => setState(() {
                    percentage = newPercentage;
                    newPercentage += 1;
                    // if (newPercentage > 9390.0) {
                    if (newPercentage > 60000.0) {
                      percentage = 0.0;
                      newPercentage = 0.0;
                      timer.cancel();
                      stopVideoRecording();
                      playVideo();
                    }
                    percentageAnimationController.forward(from: 0.0);
                    // print((t.tick / 1000).toStringAsFixed(0));
                  }),
                );
              },
              onLongPressEnd: (e) {
                percentage = 0.0;
                newPercentage = 0.0;
                timer.cancel();
                stopVideoRecording();
                playVideo();
              },
              child: Container(
                child: Center(
                  child: new Text(
                    "", //Logo of recording
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RecordButtonPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  RecordButtonPainter(
      {this.lineColor, this.completeColor, this.completePercent, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (completePercent / 9390);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class PlayRecordedVideos extends StatefulWidget {
  final String path;
  PlayRecordedVideos({@required this.path});
  @override
  _PlayRecordedVideosState createState() => _PlayRecordedVideosState();
}

class _PlayRecordedVideosState extends State<PlayRecordedVideos> {
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
    return Container(
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
    );
  }
}
