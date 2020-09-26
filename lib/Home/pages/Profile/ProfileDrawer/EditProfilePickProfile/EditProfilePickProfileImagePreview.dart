import 'dart:io';
import 'package:flutter/material.dart';

class EditProfilePickProfileImagePreview extends StatelessWidget {
  File image;
  EditProfilePickProfileImagePreview({
    Key key,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Profile Image Preview",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          titleSpacing: 32,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.black54),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  if (image != null)
                    Container(
                      child: Expanded(child: Image.file(image)),
                    )
                  else
                    Text(
                      "Click on Pick Image to select an Image",
                      style: TextStyle(fontSize: 18.0),
                    ),
                ],
              ),
            ),
          ],
        ));
  }
}
