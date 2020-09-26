import 'dart:convert';

import 'package:AlcaTiktok/Home/pages/Inbox/Inbox.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var userData;
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson);
    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Notification",
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
                    context, MaterialPageRoute(builder: (context) => Inbox()));
              },
              color: Colors.black54),
        ],
      ),
      body: Column(
        children: [
          Text(userData != null ? '${userData['name']}' : ''),
          Text(userData != null ? '${userData['user_id']}' : ''),
          Text(userData != null ? '${userData['token']}' : ''),
        ],
      ),
    );
  }
}
