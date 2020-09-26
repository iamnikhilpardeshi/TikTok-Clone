import 'package:flutter/material.dart';

class GetMessagesPostPreview extends StatefulWidget {
  @override
  _GetMessagesPostPreviewState createState() => _GetMessagesPostPreviewState();
}

class _GetMessagesPostPreviewState extends State<GetMessagesPostPreview> {
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
          "",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 32,
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black26,
                                // backgroundImage: NetworkImage("userAvatarUrl"),
                              ),
                              SizedBox(width: 10),
                              Text("Username", style: TextStyle(fontSize: 16)),

                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Description")),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Text("Account Name"),
                                Text("Mobile Number"),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            onPressed: () {},
                            // shape: StadiumBorder(),
                            child: Text("Message"),
                            color: Colors.grey[200],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Payment method",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 120.0,
                        height: 30.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          shape: StadiumBorder(),
                          child: Text("Payment"),
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
