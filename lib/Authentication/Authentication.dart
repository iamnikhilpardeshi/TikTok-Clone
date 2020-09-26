import 'package:AlcaTiktok/Authentication/GoogleAuthentication/GoogleSignInOnBoardingPage.dart';
import 'package:AlcaTiktok/Authentication/MobileAuthentication/EnterMobileNumber.dart';
import 'package:AlcaTiktok/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

String name;
String email;
String imageUrl;
final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isVisible = false;

  Future<FirebaseUser> _signIn() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication gsa =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: gsa.idToken,
      accessToken: gsa.accessToken,
    );
    // final AuthResult authResult = await auth.signInWithCredential(credential);
    final FirebaseUser authResult =
        (await auth.signInWithCredential(credential)).user;

    // final FirebaseUser firebaseUser = authResult.user;
    final FirebaseUser firebaseUser = authResult;
    name = firebaseUser.displayName;
    email = firebaseUser.email;
    imageUrl = firebaseUser.photoUrl;
    final FirebaseUser currentUser = await auth.currentUser;
    assert(firebaseUser.uid == currentUser.uid);
    return firebaseUser;
  }

  @override
  Widget build(BuildContext context) {
    var swidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  "Sign up to continue",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Create a profile, make your own video",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 280.0,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {},
                    shape: StadiumBorder(),
                    child: Text("Continue with Facebook"),
                    color: Colors.blue[200],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 280.0,
                  height: 50.0,
                  child: RaisedButton(
                    color: Colors.blue[50], //GoogleSignInOnBoardingPage
                    onPressed: () {
                      setState(() {
                        this.isVisible = true;
                      });
                      // _signIn().whenComplete(() {
                      //   Navigator.of(context).pushAndRemoveUntil(
                      //       MaterialPageRoute(builder: (context) => Home()),
                      //       (Route<dynamic> route) => false);
                      // }).catchError((onError) {
                      //   Navigator.of(context).pushAndRemoveUntil(
                      //       MaterialPageRoute(builder: (context) => Home()),
                      //       (Route<dynamic> route) => false);
                      // });
                      _signIn().whenComplete(() {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    GoogleSignInOnBoardingPage()),
                            (Route<dynamic> route) => false);
                      }).catchError((onError) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    GoogleSignInOnBoardingPage()),
                            (Route<dynamic> route) => false);
                      });
                    },
                    shape: StadiumBorder(),
                    child: Text("Continue with Gmail"),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 280.0,
                  height: 50.0,
                  child: RaisedButton(
                    color: Colors.green[50],
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EnterMobileNumber(),
                          ));
                    },
                    shape: StadiumBorder(),
                    child: Text("Continue with Mobile"),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFB2F2D52)),
                ),
              ),
              visible: isVisible,
            )
          ],
        ),
      ],
    ));
  }
}
