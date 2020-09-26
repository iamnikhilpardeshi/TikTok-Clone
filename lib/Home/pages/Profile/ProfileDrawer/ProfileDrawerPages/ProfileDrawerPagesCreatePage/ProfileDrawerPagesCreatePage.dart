import 'package:AlcaTiktok/Api/networkApi.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/ProfileDrawerPagesCreatePage/CreatePage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/files.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

//http://njoy.myalca.com/api/user_page/category_listing
class ProfileDrawerPagesCreatePage extends StatefulWidget {
  @override
  _ProfileDrawerPagesCreatePageState createState() =>
      _ProfileDrawerPagesCreatePageState();
}

class _ProfileDrawerPagesCreatePageState
    extends State<ProfileDrawerPagesCreatePage> {
  _getCategoryData() async {
    var listData = await Network().getData('user_page/category_listing');
    Map<String, dynamic> map = json.decode(listData.body);
    List<dynamic> data = map["data"];
    // print(data[0]['name']);
    // print(data);
    return data;
  }

  var pageNameController = TextEditingController();
  var pageWebsiteController = TextEditingController();
  var pageAboutController = TextEditingController();
  var pageCategoryController = TextEditingController();
  bool isVisible = false;
  List<String> list = [
    "Travel",
    "Well-being",
    "Food",
    "Dance",
    "Art",
    "Style",
    "Humor",
    "Music",
    "Beauty"
  ];
  var _profileImage, _coverImage;

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
    _getCategoryData();
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
          "Create Page",
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
                                : FileImage(
                                    File(_coverImage),
                                  ),
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
                                                          : FileImage(
                                                              File(
                                                                  _profileImage),
                                                            ),
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
                              // Container(
                              //   child: Padding(
                              //     padding: const EdgeInsets.symmetric(
                              //         vertical: 8.0, horizontal: 8),
                              //     child: SingleChildScrollView(
                              //       scrollDirection: Axis.horizontal,
                              //       child: Row(
                              //         children: list.map((String data) {
                              //           var index = list.indexOf(data);
                              //           return Row(
                              //             children: [
                              //               SizedBox(
                              //                 width: 5,
                              //               ),
                              //               RaisedButton(
                              //                 color: Colors.white,
                              //                 onPressed: () {
                              //                   var index = list.indexOf(data);
                              //                   print(data);
                              //                   print(index);
                              //                   setState(() {
                              //                     pageCategoryController.text =
                              //                         data;
                              //                     // changeColor = !changeColor;
                              //                   });
                              //                 },
                              //                 child: Row(
                              //                   children: [
                              //                     SizedBox(
                              //                       width: 5,
                              //                     ),
                              //                     Text(
                              //                       data,
                              //                       style: TextStyle(
                              //                           color: Colors.black),
                              //                     ),
                              //                     SizedBox(
                              //                       width: 2,
                              //                     ),
                              //                     Icon(
                              //                       Icons.add,
                              //                       size: 15,
                              //                     ),
                              //                     SizedBox(
                              //                       width: 5,
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ),
                              //               SizedBox(
                              //                 width: 5,
                              //               ),
                              //             ],
                              //           );
                              //         }).toList(),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Container(
                                height: 50,
                                child: FutureBuilder(
                                  future: _getCategoryData(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.data == null) {
                                      return Container(
                                        child: Center(
                                          child: Text("Loading..."),
                                        ),
                                      );
                                    } else {
                                      // print(snapshot.data.length);
                                      // print(snapshot.data);
                                      // print(snapshot.data[0]['name']);
                                      return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapshot.data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Row(
                                            children: [
                                              SizedBox(
                                                width: 5,
                                              ),
                                              RaisedButton(
                                                color: Colors.white,
                                                onPressed: () {
                                                  print(index);
                                                  print(snapshot.data[index]
                                                      ['name']);
                                                  setState(() {
                                                    pageCategoryController
                                                            .text =
                                                        snapshot.data[index]
                                                                ['name']
                                                            .toString();
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      snapshot.data[index]
                                                              ['name']
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Icon(
                                                      Icons.add,
                                                      size: 15,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
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
                              _handlePageCreate().whenComplete(() {
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

  Future _handlePageCreate() async {
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
      Uri.parse('http://njoy.myalca.com/api/user_page/create_page'),
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
