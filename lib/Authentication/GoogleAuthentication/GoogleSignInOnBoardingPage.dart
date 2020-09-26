import 'dart:convert';

import 'package:AlcaTiktok/Api/api.dart';
import 'package:AlcaTiktok/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInOnBoardingPage extends StatefulWidget {
  @override
  _GoogleSignInOnBoardingPageState createState() =>
      _GoogleSignInOnBoardingPageState();
}

class _GoogleSignInOnBoardingPageState
    extends State<GoogleSignInOnBoardingPage> {
  bool _isLoading = false;

  final introKey = GlobalKey<IntroductionScreenState>();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  void _onIntroEnd(context) {
    _handleLogin().whenComplete(() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false);
    }).catchError((onError) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false);
    });
    // _handleLogin();
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) => Home()),);
  }

  Future _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'email': FirebaseAuth.instance.currentUser.email,
      'name': FirebaseAuth.instance.currentUser.displayName,
      'social_login_type': 'gmail'
    };

    var res = await CallApi().postData(data, 'social_login');
    var body = json.decode(res.body);
    print(body);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('user', json.encode(body['data']));
    var userJson = localStorage.getString('user');
    print(userJson);
    var user = json.decode(userJson);
    print("id");
    print(user['id']);
    print("\n Nick tokens");
    print(user['token']);

    if (body['success']) {
      // SharedPreferences localStorage = await SharedPreferences.getInstance();
      // localStorage.setString('user', json.encode(body['data']));
      // var userJson = localStorage.getString('user');
      // print(userJson);
      // var user = json.decode(userJson);
      // print("id");
      // print(user['id']);
      // print("\n Nick tokens");
      // print(user['token']);
      // print(body);
    }

    setState(() {
      _isLoading = false;
    });
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
              "Download the Stockpile app and master the market with our mini-lesson.",
          image: _buildImage('img2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kids and teens",
          body:
              "Kids and teens can track their stocks 24/7 and place trades that you approve.",
          image: _buildImage('img3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Another title page",
          body: "Another beautiful body text for this example onboarding",
          image: _buildImage('img2'),
          footer: RaisedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            child: const Text(
              'FooButton',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Enter City Name",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // TextField(),
              Text("Click on ", style: bodyStyle),
              Icon(Icons.edit),
              Text(" to edit a post", style: bodyStyle),
            ],
          ),
          image: _buildImage('img1'),
          decoration: pageDecoration,
          footer: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "City",
                    prefixIcon: Icon(Icons.location_on),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "State",
                    prefixIcon: Icon(Icons.location_on),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Country",
                    prefixIcon: Icon(Icons.location_on),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
