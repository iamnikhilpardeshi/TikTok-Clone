import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/MyPageDetails.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/PagesDetails.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/ProfileDrawerPagesCreatePage/ProfileDrawerPagesCreatePage.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/ProfileDrawerPagesLikedPage/ProfileDrawerPagesLikedPage.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/ProfileDrawerPagesOurPages/ProfileDrawerPagesOurPages.dart';
import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        title: TextField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: "Search Pages",
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.transparent,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  FlatButton(
                    color: Colors.white,
                    textColor: Colors.black,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProfileDrawerPagesCreatePage(),
                          ));
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.add_circle),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Create",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  FlatButton(
                    color: Colors.white,
                    textColor: Colors.black,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileDrawerPagesLikedPage(),
                          ));
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.thumb_up),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Liked Pages",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  FlatButton(
                    color: Colors.white,
                    textColor: Colors.black,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileDrawerPagesOurPages(),
                          ));
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.person),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "My Pages",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Suggested Pages",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black26,
                          // backgroundImage: NetworkImage("userAvatarUrl"),
                        ),
                        title: const Text('Page Name'),
                        onTap: () {
                          Navigator.pop(context); //PagesDetails
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => PagesDetails(),
                          //     ));
                        },
                        trailing: IconButton(
                            icon: Icon(Icons.thumb_up),
                            onPressed: () {},
                            color: Colors.black38),
                        subtitle: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '1500 Likes',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
