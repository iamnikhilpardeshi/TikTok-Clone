import 'dart:io';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/EditProfilePickProfile/EditProfilePickProfileImagePreview.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _radioValue;
  String choice;
  File _image;
  File _cameraImage;

  _pickImageFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50); //EditProfilePickProfileImagePreview(image: image)

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePickProfileImagePreview(image: image),
      ),
    );
    setState(() {
      _image = image;
    });
  }

  _pickImageFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePickProfileImagePreview(image: image),
      ),
    );
    setState(() {
      _cameraImage = image;
    });
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = value;
          break;
        case 'two':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 32,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Save",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue[50],
                backgroundImage: AssetImage('images/batman.jpg'),
                child: IconButton(
                    icon: Icon(Icons.photo_camera),
                    onPressed: () {
                      _optionMenuDialog(context);
                    },
                    color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.black,
                // autofocus: true,
                decoration: InputDecoration(
                  hintText: "id",
                  prefixIcon: Icon(Icons.person),
                  border: InputBorder.none,
                ),
              ),
            ),
            Row(children: [
              Expanded(
                  child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: "Name",
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
              Expanded(
                  child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: "Surname",
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Container(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.topLeft, child: Text("Gender")),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 'one',
                  groupValue: _radioValue,
                  onChanged: radioButtonChanges,
                ),
                Text(
                  "Male",
                ),
                Radio(
                  value: 'two',
                  groupValue: _radioValue,
                  onChanged: radioButtonChanges,
                ),
                Text(
                  "Female",
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Container(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                      Align(alignment: Alignment.topLeft, child: Text("Bio")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "bio",
                  border: InputBorder.none,
                ),
                maxLines: 5,
                minLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Options> _optionMenuDialog(BuildContext context) async {
    return await showDialog<Options>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Add Photo!"),
            children: [
              SimpleDialogOption(
                child: Text("Take Photo"),
                onPressed: () {
                  Navigator.pop(context);
                  _pickImageFromCamera();
                },
              ),
              SimpleDialogOption(
                child: Text("Choose from Gallery"),
                onPressed: () {
                  Navigator.pop(context);
                  _pickImageFromGallery();
                },
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                onPressed: () {
                  print("Cancel");
                  Navigator.pop(context, Options.Option3);
                },
              ),
            ],
          );
        });
  }
}

enum Options { Option1, Option2, Option3 }
// Future<Options> _optionMenuDialog(BuildContext context) async {
//   return await showDialog<Options>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return SimpleDialog(
//           title: Text("Add Photo!"),
//           children: [
//             SimpleDialogOption(
//               child: Text("Take Photo"),
//               onPressed: () {
//                 // _pickImageFromCamera();
//                 print("Take Photo");
//                 // Navigator.pop(context, Options.Option1);
//               },
//             ),
//             SimpleDialogOption(
//               child: Text("Choose from Gallery"),
//               onPressed: () {
//                 print("Choose from Gallery");
//                 // Navigator.pop(context, Options.Option2);
//               },
//             ),
//             SimpleDialogOption(
//               child: Text("Cancel"),
//               onPressed: () {
//                 print("Cancel");
//                 Navigator.pop(context, Options.Option3);
//               },
//             ),
//           ],
//         );
//       });
// }
