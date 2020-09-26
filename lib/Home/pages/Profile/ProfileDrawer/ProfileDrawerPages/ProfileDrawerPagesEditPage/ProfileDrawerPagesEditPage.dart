import 'package:AlcaTiktok/Api/networkApi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDrawerPagesEditPage extends StatefulWidget {
  int pageid;
  ProfileDrawerPagesEditPage({this.pageid});

  @override
  _ProfileDrawerPagesEditPageState createState() =>
      _ProfileDrawerPagesEditPageState(pageid: pageid);
}

class _ProfileDrawerPagesEditPageState
    extends State<ProfileDrawerPagesEditPage> {
  int pageid;
  _ProfileDrawerPagesEditPageState({
    this.pageid,
  });
  var pageNameController = TextEditingController();
  var pageWebsiteController = TextEditingController();
  var pageAboutController = TextEditingController();
  var pageCategoryController = TextEditingController();
  var _profileImage, _coverImage;

  Future _getPageDetailsData() async {
    var data = {'page_id': pageid};
    var res = await Network().postData(data, 'user_page/edit_page_detail');
    var body = json.decode(res.body);
    print("Nick");
    print(body);
    print("Nick");
    setState(() {
      pageNameController.text = body['data']['name'];
      pageWebsiteController.text = body['data']['website'];
      pageCategoryController.text = body['data']['category_name'];
      pageAboutController.text = body['data']['description'];
      _profileImage = body['data']['page_photo'];
      _coverImage = body['data']['cover_photo'];
    });
  }

  bool isVisible = false;

  _pickProfileImageFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _profileImage = image.path;
      print(_profileImage);
    });
  }

  _pickCoverImageFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _coverImage = image.path;
      print(_coverImage);
    });
  }

  var userData;
  var token;
  @override
  void initState() {
    super.initState();
    _read();
    _getPageDetailsData();
  }

  void _read() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson);
    print(user['token']);
    setState(() {
      userData = user;
      token = userData['token'];
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
          "Edit Page",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 32,
      ),
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 155,
                        // color: Colors.black12,
                        width: double.infinity,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: _coverImage == null
                                ? AssetImage(
                                    "assets/Images/CoverPagePicture.jpg")
                                : NetworkImage(_coverImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  icon: Icon(Icons.camera_alt,
                                      color: Colors.teal, size: 20.0),
                                  onPressed: () {
                                    _pickCoverImageFromGallery();
                                  },
                                  color: Colors.black),
                            ),
                            // imageProfile(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Stack(
                                  children: [
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      height: 90,
                                      // width: 90,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Container(
                                          height: 85,
                                          width: 85,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  decoration: new BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: new DecorationImage(
                                                      image: _profileImage ==
                                                              null
                                                          ? AssetImage(
                                                              "assets/Images/CoverPagePicture.jpg")
                                                          : NetworkImage(
                                                              _profileImage),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 10.0,
                                                  right: 10.0,
                                                  child: InkWell(
                                                      onTap: () {
                                                        _pickProfileImageFromGallery();
                                                      },
                                                      child: Icon(
                                                          Icons.camera_alt,
                                                          color: Colors.teal,
                                                          size: 20.0)),
                                                )
                                              ],
                                            ),

                                            //  //
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ), //end
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  // imageProfile(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Card(
                          child: TextField(
                            cursorColor: Colors.black,
                            controller: pageNameController,
                            onChanged: (value) {
                              setState(() {
                                value = pageNameController.toString();
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Page name",
                              prefixIcon: Icon(Icons.info),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Card(
                          child: TextField(
                            controller: pageWebsiteController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: "Enter Website",
                              prefixIcon: Icon(Icons.web),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              TextField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.list,
                                  ),
                                  hintText: "Describe this page?",
                                  border: InputBorder.none,
                                ),
                                controller: pageAboutController,
                                maxLines: 8,
                                minLines: 5,
                              ),
                              TextField(
                                enabled: false,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.list,
                                  ),
                                  hintText:
                                      "What category describes this page?",
                                  border: InputBorder.none,
                                ),
                                controller: pageCategoryController,
                                // maxLines: 8,
                                // minLines: 5,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                this.isVisible = true;
                              });
                              _handlePageEdit().whenComplete(() {
                                setState(() {
                                  this.isVisible = false;
                                });
                                Navigator.pop(context);
                                print("completed");
                              }).catchError((onError) {
                                print(onError);
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blue)),
                            child: Text(
                              "Next".toUpperCase(),
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        )
                      ],
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
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFB2F2D52)),
                  ),
                ),
                visible: isVisible,
              )
            ],
          ),
        ],
      ),
    );
  }

  Future _handlePageEdit() async {
    setState(() {
      isVisible = true;
    });
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    print("Nikhil uploadImage");
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://njoy.myalca.com/api/user_page/edit_page_detail'),
    );
    request.headers.addAll(headers);
    request.fields['name'] = pageNameController.text;
    request.fields['website'] = pageWebsiteController.text;
    request.fields['category_name'] = pageCategoryController.text;
    request.fields['description'] = pageAboutController.text;
    request.files
        .add(await http.MultipartFile.fromPath('page_photo', _profileImage));
    request.files
        .add(await http.MultipartFile.fromPath('cover_photo', _coverImage));
    var res = await request.send();
    print("Nikhil uploadImage end");
    print(res);
    return res.reasonPhrase;

    setState(() {
      isVisible = false;
    });
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 41.0,
          backgroundImage: _profileImage == null
              ? AssetImage("assets/Images/CoverPagePicture.jpg")
              : FileImage(
                  File(_profileImage),
                ),
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: InkWell(
              onTap: () {
                _pickProfileImageFromGallery();
              },
              child: Icon(Icons.camera_alt, color: Colors.teal, size: 20.0)),
        )
      ]),
    );
  }
}
