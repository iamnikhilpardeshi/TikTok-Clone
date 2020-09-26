import 'dart:convert';

import 'package:AlcaTiktok/Api/networkApi.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/PagesDetails.dart';
import 'package:flutter/material.dart';

class ProfileDrawerPagesLikedPage extends StatefulWidget {
  @override
  _ProfileDrawerPagesLikedPageState createState() =>
      _ProfileDrawerPagesLikedPageState();
}

class _ProfileDrawerPagesLikedPageState
    extends State<ProfileDrawerPagesLikedPage> {
  _getData() async {
    var listData = await Network().getData('user_page/pages_liked_by_me');
    Map<String, dynamic> map = json.decode(listData.body);
    List<dynamic> data = map["data"];
    // print(data[0]['name']);
    // print(data[0]['id']);
    return data;
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
          "Liked Pages",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        // automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 32,
      ),
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
                    onTap: () {
                      Navigator.pop(context); //PagesDetails
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PagesDetails(
                            pageid: snapshot.data[index]['id'],
                          ),
                        ),
                      );
                    },
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
// class ProfileDrawerPagesLikedPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// resizeToAvoidBottomPadding: false,
// resizeToAvoidBottomInset: true,
// appBar: AppBar(
//   centerTitle: true,
//   iconTheme: IconThemeData(
//     color: Colors.black,
//   ),
//   title: Text(
//     "Liked Pages",
//     style: TextStyle(color: Colors.black, fontSize: 16),
//   ),
//   backgroundColor: Colors.white,
//   // automaticallyImplyLeading: false,
//   elevation: 0,
//   titleSpacing: 32,
// ),
// body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Card(
//               //PageDetailsAppBar
//               clipBehavior: Clip.antiAlias,
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.black26,
//                       // backgroundImage: NetworkImage("userAvatarUrl"),
//                     ),
//                     title: const Text('Page Name'),
//                     onTap: () {
//                       Navigator.pop(context);
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //       builder: (context) => PageDetails(),
//                       //     ));
//                     },
//                     trailing: IconButton(
//                         icon: Icon(Icons.thumb_up),
//                         onPressed: () {},
//                         color: Colors.blue),
//                     subtitle: Column(
//                       children: [
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             '1500 Likes',
//                             style:
//                                 TextStyle(color: Colors.black.withOpacity(0.6)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Card(
//               //PageDetailsAppBar
//               clipBehavior: Clip.antiAlias,
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.black26,
//                       // backgroundImage: NetworkImage("userAvatarUrl"),
//                     ),
//                     title: const Text('Page Name'),
//                     onTap: () {
//                       Navigator.pop(context);
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //       builder: (context) => PageDetails(),
//                       //     ));
//                     },
//                     trailing: IconButton(
//                         icon: Icon(Icons.thumb_up),
//                         onPressed: () {},
//                         color: Colors.blue),
//                     subtitle: Column(
//                       children: [
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             '2k Likes',
//                             style:
//                                 TextStyle(color: Colors.black.withOpacity(0.6)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
