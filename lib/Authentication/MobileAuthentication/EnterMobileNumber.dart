import 'dart:convert';

import 'package:AlcaTiktok/Api/api.dart';
import 'package:AlcaTiktok/Authentication/MobileAuthentication/EnterVerificationCode.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterMobileNumber extends StatefulWidget {
  @override
  _EnterMobileNumberState createState() => _EnterMobileNumberState();
}

class _EnterMobileNumberState extends State<EnterMobileNumber> {
  bool _isLoading = false;
  // int mobileNumberInt;
  final mobileNumberController = TextEditingController();

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
                "What's your phone number?",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
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
                          hintText: "Mobile Number",
                          prefixIcon: Icon(Icons.dialpad),
                          suffixIcon: Icon(Icons.cancel),
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(.8)),
                        ),
                        autofocus: true,
                        controller: mobileNumberController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter Mobile No.";
                          }
                          if (value.length < 10) {
                            return 'Please type Correct Mobile no.';
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 280.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      // _handleMobileLogin();
                      _handleMobileLogin().whenComplete(() {
                        String mobileNo = mobileNumberController.text;
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    EnterVerificationCode(mobileNo: mobileNo)),
                            (Route<dynamic> route) => false);
                      }).catchError((onError) {
                        String mobileNo = mobileNumberController.text;
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    EnterVerificationCode(mobileNo: mobileNo)),
                            (Route<dynamic> route) => false);
                      });
                    } else {}
                  },
                  shape: StadiumBorder(),
                  child: Text("Next"),
                  color: Colors.yellow[100],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _handleMobileLogin() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'mobile_number': int.parse(mobileNumberController.text),
      'social_login_type': 'mobilenumber'
    };

    var res = await CallApi().postData(data, 'mobile_login');
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
