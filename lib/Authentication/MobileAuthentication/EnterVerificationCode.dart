import 'dart:convert';

import 'package:AlcaTiktok/Api/api.dart';
import 'package:AlcaTiktok/Authentication/MobileAuthentication/MobileAuthenticationOnBoardingPage.dart';
import 'package:AlcaTiktok/SplashScreen/OnBoardingPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterVerificationCode extends StatefulWidget {
  String mobileNo;
  EnterVerificationCode({this.mobileNo});
  @override
  _EnterVerificationCodeState createState() =>
      _EnterVerificationCodeState(mobileNo: mobileNo);
}

class _EnterVerificationCodeState extends State<EnterVerificationCode> {
  String mobileNo;
  _EnterVerificationCodeState({
    this.mobileNo,
  });

  bool _isLoading = false;
  // int otpNumberInt;
  final otpNumberController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                "Enter the 4-digit verification code sent to..",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "+91 " + mobileNo,
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Verification Code",
                          prefixIcon: Icon(Icons.dialpad),
                          suffixIcon: Icon(Icons.cancel),
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(.8)),
                        ),
                        autofocus: true,
                        controller: otpNumberController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter Otp.";
                          }
                          if (value.length < 4 && value.length > 5) {
                            return 'Please type Correct Otp no.';
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: TextField(
              //     keyboardType: TextInputType.number,
              //     cursorColor: Colors.black,
              //     autofocus: true,
              //     decoration: InputDecoration(
              // hintText: "Enter Verification Code",
              // prefixIcon: Icon(Icons.dialpad),
              // suffixIcon: Icon(Icons.cancel),
              // border: InputBorder.none,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 280.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      _handleOtpLogin().whenComplete(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MobileAuthenticationOnBoardingPage(),
                            ));
                      }).catchError((onError) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MobileAuthenticationOnBoardingPage(),
                            ));
                      });
                    } else {}
                  },
                  shape: StadiumBorder(),
                  child: Text("Next"),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _handleOtpLogin() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'mobile_number': mobileNo,
      'otp': int.parse(otpNumberController.text),
    };

    var res = await CallApi().postData(data, 'validate_mobile_otp');
    var body = json.decode(res.body);
    print(body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['user']));

      var userJson = localStorage.getString('user');
      print(userJson);

      var user = json.decode(userJson);
      print(user['id']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
