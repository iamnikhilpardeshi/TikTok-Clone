// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:AlcaTiktok/Api/networkApi.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class UploadImageDemo extends StatefulWidget {
//   UploadImageDemo() : super();

//   final String title = "Upload Image Demo";

//   @override
//   UploadImageDemoState createState() => UploadImageDemoState();
// }

// class UploadImageDemoState extends State<UploadImageDemo> {
//   //
//   // static final String uploadEndPoint =
//   //     'http://njoy.myalca.com/api/user_page/category_listing';
//   Future<File> file;
//   String status = '';
//   String base64Image;
//   File tmpFile;
//   String errMessage = 'Error Uploading Image';

//   chooseImage() {
//     setState(() {
//       file = ImagePicker.pickImage(source: ImageSource.gallery);
//       print(file);
//     });
//     setStatus('');
//   }

//   setStatus(String message) {
//     setState(() {
//       status = message;
//     });
//   }

//   startUpload() {
//     setStatus('Uploading Image...');
//     if (null == tmpFile) {
//       setStatus(errMessage);
//       return;
//     }
//     _handlePageCreate();
//     // String fileName = tmpFile.path.split('/').last;
//     // upload(fileName);
//   }

//   // upload(String fileName) {
//   //   http.post(uploadEndPoint, body: {
//   //     "image": base64Image,
//   //     "name": fileName,
//   //   }).then((result) {
//   //     setStatus(result.statusCode == 200 ? result.body : errMessage);
//   //   }).catchError((error) {
//   //     setStatus(error);
//   //   });
//   // }

//   Widget showImage() {
//     return FutureBuilder<File>(
//       future: file,
//       builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done &&
//             null != snapshot.data) {
//           tmpFile = snapshot.data;
//           base64Image = base64Encode(snapshot.data.readAsBytesSync());
//           return Flexible(
//             child: Image.file(
//               snapshot.data,
//               fit: BoxFit.fill,
//             ),
//           );
//         } else if (null != snapshot.error) {
//           return const Text(
//             'Error Picking Image',
//             textAlign: TextAlign.center,
//           );
//         } else {
//           return const Text(
//             'No Image Selected',
//             textAlign: TextAlign.center,
//           );
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Upload Image Demo"),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             OutlineButton(
//               onPressed: chooseImage,
//               child: Text('Choose Image'),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             showImage(),
//             SizedBox(
//               height: 20.0,
//             ),
//             OutlineButton(
//               onPressed: () {
//                 startUpload();
//               },
//               child: Text('Upload Image'),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Text(
//               status,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.green,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 20.0,
//               ),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future _handlePageCreate() async {
//     setState(() {
//       // _isLoading = true;
//     });

//     var data = {
//       'name': 'Nick',
//       'website': 'www.google.com',
//       'category_name': 'Travel',
//       'description': 'None of these',
//       'page_photo': Image.file(tmpFile),
//       'cover_photo': tmpFile

//       // 'page_photo': Image.file(_profileImage),
//       // 'cover_photo': Image.file(_coverImage),
//     };
//     print("Nick");
//     var res = await Network().postData(data, 'user_page/create_page');
//     var body = json.decode(res.body);
//     print(body['success']);
//     print("Nick");
//     print(body);
//     if (body['success']) {
//       print("success");
//     }

//     setState(() {
//       // _isLoading = false;
//     });
//   }
// }
