import 'package:flutter/material.dart';

class HelpaAndSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          "Help & Support",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        // automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 32,
      ),
      body: Container(),
    );
  }
}
