import 'package:AlcaTiktok/Home/pages/HomePage/HomePage/DuetFacility/VideoDuet.dart';
import 'package:AlcaTiktok/Home/pages/HomePage/HomePage/widgets/header_home_page.dart';
import 'package:AlcaTiktok/Home/pages/HomePage/HomePage/widgets/tik_tok_icons.dart';
import 'package:AlcaTiktok/constant/data_json.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(items.length, (index) {
          return VideoPlayerItem(
            videoUrl: items[index]['videoUrl'],
            size: size,
            name: items[index]['name'],
            caption: items[index]['caption'],
            songName: items[index]['songName'],
            profileImg: items[index]['profileImg'],
            likes: items[index]['likes'],
            comments: items[index]['comments'],
            shares: items[index]['shares'],
            albumImg: items[index]['albumImg'],
          );
        }),
      ),
    );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;
  VideoPlayerItem(
      {Key key,
      @required this.size,
      this.name,
      this.caption,
      this.songName,
      this.profileImg,
      this.likes,
      this.comments,
      this.shares,
      this.albumImg,
      this.videoUrl})
      : super(key: key);

  final Size size;

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  VideoPlayerController _videoController;
  bool isShowPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoController.play();
        setState(() {
          isShowPlaying = false;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController.dispose();
  }

  Widget isPlaying() {
    return _videoController.value.isPlaying && !isShowPlaying
        ? Container()
        : Icon(
            Icons.play_arrow,
            size: 80,
            color: Color(0xFFFFFFFF).withOpacity(0.5),
          );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _videoController.value.isPlaying
              ? _videoController.pause()
              : _videoController.play();
        });
      },
      child: RotatedBox(
        quarterTurns: -1,
        child: Container(
            height: widget.size.height,
            width: widget.size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  height: widget.size.height,
                  width: widget.size.width,
                  decoration: BoxDecoration(color: Color(0xFF000000)),
                  child: Stack(
                    children: <Widget>[
                      VideoPlayer(_videoController),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: isPlaying(),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: widget.size.height,
                  width: widget.size.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          HeaderHomePage(),
                          Expanded(
                              child: Row(
                            children: <Widget>[
                              LeftPanel(
                                size: widget.size,
                                profileImg: "${widget.profileImg}",
                                name: "${widget.name}",
                                caption: "${widget.caption}",
                                songName: "${widget.songName}",
                              ),
                              RightPanel(
                                size: widget.size,
                                likes: "${widget.likes}",
                                comments: "${widget.comments}",
                                shares: "${widget.shares}",
                                // profileImg: "${widget.profileImg}",
                                albumImg: "${widget.albumImg}",
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  const LeftPanel(
      {Key key,
      @required this.size,
      this.name,
      this.caption,
      this.songName,
      this.profileImg})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    print("Profile Image Press");
                  },
                  child: getProfile(profileImg)),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    caption,
                    style: TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.music_note,
                color: Color(0xFFFFFFFF),
                size: 15,
              ),
              Flexible(
                child: Text(
                  songName,
                  style: TextStyle(color: Color(0xFFFFFFFF), height: 1.5),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class RightPanel extends StatelessWidget {
  final String likes;
  final String comments;
  final String shares;
  // final String profileImg;
  final String albumImg;
  const RightPanel({
    Key key,
    @required this.size,
    this.likes,
    this.comments,
    this.shares,
    // this.profileImg,
    this.albumImg,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.5,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // getProfile(profileImg),
                GestureDetector(
                  onTap: () {
                    print("Heart Press");
                  },
                  child: getIcons(TikTokIcons.heart, likes, 20.0),
                ),
                GestureDetector(
                  onTap: () {
                    print("Bubble Press");
                  },
                  child: getIcons(TikTokIcons.chat_bubble, comments, 20.0),
                ),
                GestureDetector(
                    onTap: () {
                      print("Share Press");
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.screen_share),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          VideoDuet()));
                                            }),
                                        IconButton(
                                            icon: Icon(Icons.screen_share),
                                            onPressed: () {}),
                                        IconButton(
                                            //CameraExampleHome
                                            icon: Icon(Icons.screen_share),
                                            onPressed: () {}),
                                        IconButton(
                                            icon: Icon(Icons.screen_share),
                                            onPressed: null),
                                        IconButton(
                                            icon: Icon(Icons.screen_share),
                                            onPressed: null),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 90,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.screen_share),
                                            onPressed: null),
                                        IconButton(
                                            icon: Icon(Icons.screen_share),
                                            onPressed: null),
                                        IconButton(
                                            icon: Icon(Icons.screen_share),
                                            onPressed: null),
                                        IconButton(
                                            icon: Icon(Icons.screen_share),
                                            onPressed: null),
                                        IconButton(
                                            icon: Icon(Icons.screen_share),
                                            onPressed: null),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: getIcons(TikTokIcons.reply, shares, 20.0)),
                GestureDetector(
                    onTap: () {
                      print("Album Image Press");
                    },
                    child: getAlbum(albumImg))
              ],
            ))
          ],
        ),
      ),
    );
  }
}

Widget getAlbum(albumImg) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
        // shape: BoxShape.circle,
        // color: black
        ),
    child: Stack(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFF000000)),
        ),
        Center(
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(albumImg), fit: BoxFit.cover)),
          ),
        )
      ],
    ),
  );
}

Widget getIcons(icon, count, size) {
  return Container(
    child: Column(
      children: <Widget>[
        Icon(icon, color: Color(0xFFFFFFFF), size: size),
        SizedBox(
          height: 5,
        ),
        Text(
          count,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 12,
              fontWeight: FontWeight.w700),
        )
      ],
    ),
  );
}

Widget getProfile(img) {
  return Container(
    width: 50,
    height: 60,
    child: Stack(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFFFFFFF)),
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)),
        ),
        Positioned(
            bottom: 3,
            left: 18,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFFC2D55)),
              child: Center(
                  child: Icon(
                Icons.add,
                color: Color(0xFFFFFFFF),
                size: 15,
              )),
            ))
      ],
    ),
  );
}
