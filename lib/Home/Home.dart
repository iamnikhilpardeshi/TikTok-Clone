import 'package:AlcaTiktok/Home/pages/Discover/DiscoverGrid.dart';
import 'package:AlcaTiktok/Home/pages/HomePage/HomePage/HomePage.dart';
import 'package:AlcaTiktok/Home/pages/Inbox/Notifications.dart';
import 'package:AlcaTiktok/Home/pages/Profile/Profile.dart';
import 'package:AlcaTiktok/Home/pages/Upload/VideoRecorder.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          height: 80.0,
          width: 80.0,
          color: Colors.transparent,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VideoRecorder()));
              },
              child: Icon(Icons.photo_camera, color: Colors.black54),
              backgroundColor: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home",
                style: TextStyle(
                  fontSize: 10,
                ))),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Discover",
                style: TextStyle(
                  fontSize: 10,
                ))),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo_camera, color: Colors.white),
          title: Text(
            "Upload",
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          title: Text("Inbox",
              style: TextStyle(
                fontSize: 10,
              )),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text("Profile",
              style: TextStyle(
                fontSize: 10,
              )),
        ),
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState.pushReplacementNamed("Home");
        break;
      case 1:
        _navigatorKey.currentState.pushReplacementNamed("Discover");
        break;
      case 2:
        _navigatorKey.currentState.pushReplacementNamed("Upload");
        break;
      case 3:
        _navigatorKey.currentState.pushReplacementNamed("Inbox");
        break;
      case 4:
        _navigatorKey.currentState.pushReplacementNamed("Profile");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "Discover":
        // return MaterialPageRoute(builder: (context) => DiscoverGrid());
        return MaterialPageRoute(builder: (context) => DiscoverTopGrid());
      case "Upload":
        return MaterialPageRoute(builder: (context) => HomePage());
      case "Inbox":
        return MaterialPageRoute(builder: (context) => Notifications());
      case "Profile":
        return MaterialPageRoute(builder: (context) => Profile());
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Hello "),
  //       actions: <Widget>[
  //         IconButton(
  //           icon: Icon(Icons.exit_to_app),
  // onPressed: () async {
  //   await FirebaseAuth.instance.signOut();
  //   await googleSignIn.disconnect();
  //   await googleSignIn.signOut();
  //   Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => Authentication()),
  //       (Route<dynamic> route) => false);
  // },
  //         ),
  //       ],
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Text(FirebaseAuth.instance.currentUser.displayName),
  //           Text(FirebaseAuth.instance.currentUser.email),
  //           // Text("Login Type"),
  //           // Text(FirebaseAuth.instance.currentUser.uid),
  //           RaisedButton(
  // onPressed: () async {
  //   await FirebaseAuth.instance.signOut();
  //   await googleSignIn.disconnect();
  //   await googleSignIn.signOut();
  //   Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => Authentication()),
  //       (Route<dynamic> route) => false);
  // },
  //             child: Text("Log Out"),
  //             color: Colors.redAccent,
  //           ),
  //           SizedBox(
  //             height: 10.0,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
