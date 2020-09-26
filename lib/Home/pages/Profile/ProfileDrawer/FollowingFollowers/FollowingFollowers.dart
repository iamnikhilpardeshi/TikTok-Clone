import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/FollowingFollowers/Tabs/TabsFollowers.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/FollowingFollowers/Tabs/TabsFollowing.dart';
import 'package:flutter/material.dart';

class FollowingFollowers extends StatefulWidget {
  @override
  _FollowingFollowersState createState() => _FollowingFollowersState();
}

class _FollowingFollowersState extends State<FollowingFollowers>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: new Text(
          "Username",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.blue,
          tabs: [
            new Tab(text: 'Following'),
            new Tab(text: 'Followers'),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [TabsFollowing(), TabsFollowers()],
        controller: _tabController,
      ),
    );
  }
}
