import 'package:AlcaTiktok/Api/networkApi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/files.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// class CreatePage extends StatefulWidget {
//   @override
//   _CreatePageState createState() => _CreatePageState();
// }

// class _CreatePageState extends State<CreatePage> {
//   Dio dio = new Dio();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           var userData;
//           var token;

//           //create token
//           SharedPreferences localStorage =
//               await SharedPreferences.getInstance();
//           var userJson = localStorage.getString('user');
//           var user = json.decode(userJson);
//           print(user['token']);
//           userData = user;
//           token = userData['token'];

//           //file
//           File image;
//           var imagePicker =
//               await ImagePicker.pickImage(source: ImageSource.gallery);
//           if (imagePicker != null) {
//             setState(() {
//               image = imagePicker;
//             });
//           }
//           try {
//             // String filename = image.path.split('/').last;

//             FormData formData = new FormData.fromMap({
//               'name': "Nikhil",
//               'website': "www.nikhil.com",
//               'category_name': "Travel",
//               'description': "Hii these is my page",
//               'page_photo': await MultipartFile.fromFile(
//                 image.path,
//                 // filename: filename,
//               ),
//               'cover_photo': await MultipartFile.fromFile(
//                 image.path,
//                 // filename: filename,
//               ),
//             });
//             print('Nikhil');
//             Dio dio = new Dio();

//             Response response = await dio.post(
//               'http://njoy.myalca.com/api/user_page/create_page',
//               data: formData,
//               options: Options(
//                 headers: {
//                   'Content-type': 'multipart/form-data',
//                   'Accept': 'application/json',
//                   'Authorization': 'Bearer $token'
//                 },
//               ),
//             );
//             print(response);
//             print('Nikhil response end');
//             // Dio dio = new Dio();

//             // dio
//             //     .post('http://njoy.myalca.com/api/user_page/create_page',
//             //         data: formData,
//             //         options: Options(
//             //           headers: {
//             //             'Content-type': 'multipart/form-data',
//             //             'Accept': 'application/json',
//             //             'Authorization': 'Bearer $token'
//             //           },
//             //         ))
//             //     .then((response) {
//             //   var jsonResponse = jsonDecode(response.toString());
//             //   print('Nikhil');
//             //   print(jsonResponse);
//             //   print('Nikhil');
//             // }).catchError((error) => print(error));

//             // var response = await dio.post(
//             //   'http://njoy.myalca.com/api/user_page/create_page',
//             //   data: formData,
//             // options: Options(
//             //   headers: {
//             //     'Content-type': 'multipart/form-data',
//             //     'Accept': 'application/json',
//             //     'Authorization': 'Bearer $token'
//             //   },
//             // ),
//             // );
//             // return response.data;
//           } catch (e) {
//             print(e);
//           }
//         },
//       ),
//     );
//   }
// }
class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var userData;
  var token;
  Future<String> uploadImage(filename, url) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson);
    print(user['token']);
    userData = user;
    token = userData['token'];
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    print("Nikhil uploadImage");
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.fields['name'] = 'Nikhil Pardeshi';
    request.fields['website'] = 'www.nikhilpardeshi.com';
    request.fields['category_name'] = 'Travel';
    request.fields['description'] = 'these is my page';
    request.files
        .add(await http.MultipartFile.fromPath('page_photo', filename));
    request.files
        .add(await http.MultipartFile.fromPath('cover_photo', filename));
    var res = await request.send();
    print("Nikhil uploadImage end");
    return res.reasonPhrase;
  }

  String state = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter File Upload Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(state),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var file = await ImagePicker.pickImage(source: ImageSource.gallery);
          var res = await uploadImage(
              file.path, 'http://njoy.myalca.com/api/user_page/create_page');
          setState(() {
            state = res;
            print(res);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
