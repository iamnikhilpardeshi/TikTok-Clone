import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/ProfileDrawerPagesEditPage/ProfileDrawerPagesEditPage.dart';
import 'package:flutter/material.dart';
import 'package:AlcaTiktok/Api/networkApi.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PageDetails {
  int pageid;
  String name;
  PageDetails({this.pageid, this.name});
}

class MyPagesTabsAbout extends StatefulWidget {
  int pageid;
  MyPagesTabsAbout({this.pageid});

  @override
  _MyPagesTabsAboutState createState() =>
      _MyPagesTabsAboutState(pageid: pageid);
}

class _MyPagesTabsAboutState extends State<MyPagesTabsAbout> {
  int pageid;
  _MyPagesTabsAboutState({
    this.pageid,
  });

  String pageName = '';
  String websitePage = '';
  String aboutPage = '';
  String categoryPage = '';
  _getPageData() async {
    var data = {'page_id': pageid};
    var res = await Network().postData(data, 'user_page/edit_page_detail');
    var body = json.decode(res.body);
    print("Nick");
    print(body);
    print("Nick");
    setState(() {
      pageName = body['data']['name'];
      websitePage = body['data']['website'];
      categoryPage = body['data']['category_name'];
      aboutPage = body['data']['description'];
    });
  }

  @override
  void initState() {
    super.initState();
    _read();
    _getPageData();
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

  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverContent(),
      ],
    );
  }

  SliverFillRemaining _buildSliverContent() {
    return SliverFillRemaining(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("Page: "),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(pageName),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("Website: "),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(websitePage),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("Category: "),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(categoryPage),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("About: "),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              aboutPage,
                              maxLines: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      onPressed: () {
                        // int id = 1;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProfileDrawerPagesEditPage(pageid: pageid),
                            ));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                      child: Text(
                        "Edit Page".toUpperCase(),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
