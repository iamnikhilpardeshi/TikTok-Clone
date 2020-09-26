import 'dart:async';
import 'package:AlcaTiktok/Authentication/Authentication.dart';
import 'package:AlcaTiktok/Home/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Route route = MaterialPageRoute(builder: (context) => AuthScreen());

  Route route = MaterialPageRoute(builder: (context) => Authentication());
  @override
  void initState() {
    super.initState();
    navigateUser();
  }

  navigateUser() {
    // FirebaseAuth.instance.currentUser.then((currentUser) {
    if (FirebaseAuth.instance.currentUser == null) {
      Timer(
          Duration(seconds: 2),
          () =>
              // Navigator.pushReplacementNamed(context, "/auth"),
              Navigator.pushReplacement(context, route));
    } else {
      Timer(
        Duration(seconds: 2),
        () =>
            // Navigator.of(context).pushAndRemoveUntil(
            //     MaterialPageRoute(builder: (context) => HomeScreen()),
            //     (Route<dynamic> route) => false),
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Home()),
                (Route<dynamic> route) => false),
      );
    }
    // });

    // checking whether user already loggedIn or not
    // FirebaseAuth.instance.currentUser().then((currentUser) {
    //   if (currentUser == null) {
    //     Timer(Duration(seconds: 2),
    //         () => Navigator.pushReplacementNamed(context, "/auth"));
    //   } else {
    //     Timer(
    //       Duration(seconds: 2),
    //       () => Navigator.of(context).pushAndRemoveUntil(
    //           MaterialPageRoute(builder: (context) => HomeScreen()),
    //           (Route<dynamic> route) => false),
    //     );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("Design Your splash screen"),
        ),
      ),
    );
  }
}
