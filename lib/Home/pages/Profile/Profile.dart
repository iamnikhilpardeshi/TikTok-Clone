import 'package:AlcaTiktok/Authentication/Authentication.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/AboutUs.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/EditProfile.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/FollowingFollowers/FollowingFollowers.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/HelpAndSupport.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/Pages.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/PrivacyPolicy.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerAdsManagements/ProfileDrawerAdsManagementsChooseGoal.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/ProfileDrawerPagesCreatePage/CreatePage.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/WalletManagements.dart';
import 'package:AlcaTiktok/Home/pages/Profile/Tabs/Liked/LikedVideos.dart';
import 'package:AlcaTiktok/Home/pages/Profile/Tabs/Tag/TagVideos.dart';
import 'package:AlcaTiktok/Home/pages/Profile/Tabs/Upload/UploadedVideos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
                title: Text(""),
                onTap: () {
                  Navigator.pop(context);
                }),
            Card(
              child: new ListTile(
                  leading: Icon(Icons.person),
                  title: new Text("Edit Profile"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(),
                      ),
                    );
                  }),
            ),
            Card(
              child: new ListTile(
                  leading: Icon(Icons.person_pin_circle),
                  title: new Text("Followers / Followings"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FollowingFollowers(),
                        ));
                  }),
            ),
            Card(
              child: new ListTile(
                  leading: Icon(Icons.pages),
                  title: new Text("Pages"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pages(),
                        ));
                  }),
            ),
            Card(
              child: new ListTile(
                  leading: Icon(Icons.add_box),
                  title: new Text("Ads Managements"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfileDrawerAdsManagementsChooseGoal(),
                        ));
                  }),
            ),
            Card(
              child: new ListTile(
                  leading: Icon(Icons.account_balance_wallet),
                  title: new Text("Wallet Managements"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WalletManagements(),
                        ));
                  }),
            ),
            Card(
              child: new ListTile(
                  leading: Icon(Icons.help),
                  title: new Text("Help & Support"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpaAndSupport(),
                        ));
                  }),
            ),
            Card(
              child: new ListTile(
                  leading: Icon(Icons.settings),
                  title: new Text("Privacy Policy"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicy(),
                        ));
                  }),
            ),
            Card(
              child: new ListTile(
                  leading: Icon(Icons.info),
                  title: new Text("About us"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutUs(),
                        ));
                  }),
            ),
            Card(
              child: new ListTile(
                  leading: Icon(Icons.share),
                  title: new Text("Share & Refer"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreatePage(),
                      ),
                    );
                    // Navigator.pop(context);
                    // Share.share(
                    //   'check out my website https://google.com/',
                    //   subject: 'Sharing on Email');
                  }),
            ),
            ListTile(
                title: Text(""),
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.exit_to_app),
                  // onPressed: () {},
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    await googleSignIn.disconnect();
                    await googleSignIn.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => Authentication()),
                        (Route<dynamic> route) => false);
                  },
                  color: Colors.black),
            ],
            // pinned: true,
            snap: true,
            floating: true, backgroundColor: Colors.white,
            expandedHeight: 361,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue[50],
                          backgroundImage: AssetImage('images/batman.jpg'),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text("@id"
                            // FirebaseAuth.instance.currentUser.email
                            ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 100.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.black12),
                          child: Center(child: Text("0 Videos")),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "0",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Following",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "0",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Followers",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "0",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Heart",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Divider(
                    height: 10,
                    color: Colors.black,
                    indent: 0,
                    endIndent: 0,
                  ),
                ],
              ),
            ),
            bottom: TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(icon: Icon(Icons.dialpad)),
                Tab(icon: Icon(Icons.save_alt)),
                Tab(icon: Icon(Icons.link)),
              ],
              controller: controller,
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[UploadedVideos(), LikedVideos(), TagVideos()],
            ),
          ),
        ],
      ),
    );
  }
}
