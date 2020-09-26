import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/ProfileDrawerPagesTabs/PagesTabsAbout.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/ProfileDrawerPagesTabs/PagesTabsHome.dart';
import 'package:flutter/material.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/ProfileDrawerMyPagesTabs/MyPagesTabsAbout.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/ProfileDrawerMyPagesTabs/MyPagesTabsHome.dart';
import 'package:AlcaTiktok/Api/networkApi.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PagesDetails extends StatefulWidget {
  int pageid;
  PagesDetails({this.pageid});

  @override
  _PagesDetailsState createState() => _PagesDetailsState(pageid: pageid);
}

class _PagesDetailsState extends State<PagesDetails>
    with SingleTickerProviderStateMixin {
  int pageid;
  _PagesDetailsState({
    this.pageid,
  });
  String pageName = '';
  String websitePage = '';
  String aboutPage = '';
  String categoryPage = '';
  var _profileImage, _coverImage;
  _getPageData() async {
    var data = {'page_id': pageid};
    var res = await Network().postData(data, 'user_page/edit_page_detail');
    var body = json.decode(res.body);
    print("Nick");
    print(body);
    print("Nick");
    setState(() {
      // pageName = body['data']['name'];
      // websitePage = body['data']['website'];
      // categoryPage = body['data']['category_name'];
      // aboutPage = body['data']['description'];
      // _profileImage = body['data']['page_photo'];
      // _coverImage = body['data']['cover_photo'];
    });
  }

  var userData;
  var token;

  void _read() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson);
    print(user['token']);
    setState(() {
      userData = user;
      token = userData['token'];
    });
  }

  TabController controller;

  @override
  void initState() {
    super.initState();
    _getPageData();
    _read();

    controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                  color: Colors.black54),
            ],
            backgroundColor: Colors.white,
            expandedHeight: 230,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                // decoration: new BoxDecoration(
                //   image: new DecorationImage(
                //     fit: BoxFit.fill,
                //     image: new AssetImage('assets/Images/CoverPagePicture.jpg'),
                //   ),
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          // fit: BoxFit.fill,
                          image: _coverImage == null
                              ? AssetImage("assets/Images/CoverPagePicture.jpg")
                              : NetworkImage(_coverImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        height: 140,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue[50],
                              backgroundImage: _profileImage == null
                                  ? AssetImage(
                                      "assets/Images/CoverPagePicture.jpg")
                                  : NetworkImage(_profileImage),
                            ),
                            title: Text(
                              pageName,
                              style: TextStyle(fontSize: 18),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                            trailing: IconButton(
                                icon: Icon(Icons.thumb_up),
                                onPressed: () {},
                                color: Colors.blue),
                            subtitle: Text(
                              categoryPage,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.info)),
              ],
              controller: controller,
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[PagesTabsHome(), PagesTabsAbout()],
            ),
          ),
        ],
      ),
    );
  }
}
