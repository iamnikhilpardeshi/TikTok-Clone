import 'package:AlcaTiktok/Authentication/Authentication.dart';
import 'package:AlcaTiktok/Home/Home.dart';
import 'package:AlcaTiktok/SplashScreen/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Defining routes for navigation
var routes = <String, WidgetBuilder>{
  "/auth": (BuildContext context) => Authentication(),
  "/home": (BuildContext context) => Home(),
};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'TikTok',
    routes: routes,
    home: SplashScreen(),
  ));
}
