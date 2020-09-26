import 'dart:async';
import 'dart:convert';
import 'package:AlcaTiktok/Api/networkApi.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/files.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  _getData() async {
    var listData = await Network().getData('user_page/my_pages_listing');
    Map<String, dynamic> map = json.decode(listData.body);
    List<dynamic> data = map["data"];
    print(data[0]['name']);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Inbox",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 32,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.black54),
        ],
      ),
      // body: Column(),
      body: Container(
        child: FutureBuilder(
          future: _getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else {
              print(snapshot.data.length);
              print(snapshot.data);
              print(snapshot.data[0]['name']);
              // return Container(
              //   child: Column(
              //     children: [
              //       for (int i = 0; i < snapshot.data.length; i++)
              //         ListTile(
              //           leading: CircleAvatar(
              //             backgroundImage: NetworkImage(
              //                 snapshot.data[i]['page_photo'].toString()),
              //           ),
              //           title: Text(snapshot.data[i]['name'].toString()),
              //           subtitle: Text(snapshot.data[i]['likes'].toString()),
              //         ),
              //     ],
              //   ),
              // );
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data[index]['page_photo']),
                    ),
                    trailing: Icon(Icons.thumb_up),
                    title: Text(
                      snapshot.data[index]['name'].toString(),
                    ),
                    subtitle: Text(snapshot.data[index]['likes'].toString()),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

// class ListPages {
//   final int id;
//   final String name;
//   final String category_name;
//   final String description;
//   final int likes;
//   final String page_photo;
//   final String cover_photo;
//   ListPages(this.id, this.name, this.category_name, this.description,
//       this.likes, this.page_photo, this.cover_photo);
// }

// class Inbox extends StatefulWidget {
//   @override
//   _InboxState createState() => _InboxState();
// }

// class _InboxState extends State<Inbox> {
//   List data;

//   Future<String> getData() async {
//     var response = await Network().getData('user_page/my_pages_listing');

//     this.setState(() {
//       data = json.decode(response.body);
//     });
//     print(data);

//     print(data[1]["title"]);

//     return "Success!";
//   }

//   @override
//   void initState() {
//     this.getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//           title: new Text("Listviews"), backgroundColor: Colors.blue),
//       body: new ListView.builder(
//         itemCount: data == null ? 0 : data.length,
//         itemBuilder: (BuildContext context, int index) {
//           return new Card(
//             child: new Text(data[index]["title"]),
//           );
//         },
//       ),
//     );
//   }
// }
