import 'dart:convert';

import 'package:AlcaTiktok/Api/networkApi.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerPages/MyPageDetails.dart';
import 'package:flutter/material.dart';

class ProfileDrawerPagesOurPages extends StatefulWidget {
  @override
  _ProfileDrawerPagesOurPagesState createState() =>
      _ProfileDrawerPagesOurPagesState();
}

class _ProfileDrawerPagesOurPagesState
    extends State<ProfileDrawerPagesOurPages> {
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
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Our Pages",
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
                      // int pageid = 10;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyPageDetails(
                              pageid: snapshot.data[index]['id'],
                            ),
                          ));
                    },
                    trailing: Icon(Icons.thumb_up),
                    title: Text(
                      snapshot.data[index]['name'].toString(),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          snapshot.data[index]['likes'].toString(),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          snapshot.data[index]['id'].toString(),
                        ),
                      ],
                    ),
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
