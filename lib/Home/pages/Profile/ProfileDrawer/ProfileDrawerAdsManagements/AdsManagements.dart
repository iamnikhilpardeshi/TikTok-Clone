import 'package:flutter/material.dart';

class AdsManagements extends StatefulWidget {
  @override
  _AdsManagementsState createState() => _AdsManagementsState();
}

class _AdsManagementsState extends State<AdsManagements> {
  double _currentSliderValue = 0;
  double _currentSliderValue1 = 0;
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
          "Create Ad's",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 32,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Card(
            child: Container(
              height: 155,
              color: Colors.black12,
              width: double.infinity,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => EditProfile()));
                        },
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.blue)),
                    hintText: "Type Here..",
                    labelText: 'Headline',
                    helperText: '10/30 Characters',
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
                              "Audience",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Who should see your ad?",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 150.0,
                                height: 30.0,
                                child: RaisedButton(
                                  onPressed: () {},
                                  shape: StadiumBorder(),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text("See all"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(Icons.arrow_downward),
                                    ],
                                  ),
                                  color: Colors.grey[200],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 150.0,
                                height: 30.0,
                                child: RaisedButton(
                                  onPressed: () {},
                                  shape: StadiumBorder(),
                                  child: Text("Create New"),
                                  color: Colors.grey[200],
                                ),
                              ),
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
                              "Duration",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "How many days?",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Slider(
                            value: _currentSliderValue,
                            min: 0,
                            max: 30,
                            divisions: 10,
                            label: _currentSliderValue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 300.0,
                            height: 30.0,
                            child: RaisedButton(
                              onPressed: () {},
                              shape: StadiumBorder(),
                              child: Text("Save"),
                              color: Colors.grey[200],
                            ),
                          ),
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
                              "Daily Budget",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Actual amount daily spent daily vary",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Text(
                            "An estimated 1.7k-5k people reached per day",
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Slider(
                            value: _currentSliderValue1,
                            min: 0,
                            max: 30,
                            divisions: 10,
                            label: _currentSliderValue1.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue1 = value;
                              });
                            },
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          // SizedBox(
                          //   width: 300.0,
                          //   height: 30.0,
                          //   child: RaisedButton(
                          //     onPressed: () {},
                          //     shape: StadiumBorder(),
                          //     child: Text("Save"),
                          //     color: Colors.grey[200],
                          //   ),
                          // ),
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
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: Text(
                          //     "Who should see your ad?",
                          //     style: TextStyle(fontSize: 14),
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              width: 120.0,
                              height: 30.0,
                              child: RaisedButton(
                                onPressed: () {},
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
          ),
          SizedBox(
            height: 50,
          ),
        ],
      )),
    );
  }
}

// class aAdsManagements extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomPadding: false,
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         centerTitle: true,
//         title: Text(
//           "Create Ad's",
//           style: TextStyle(color: Colors.black, fontSize: 16),
//         ),
//         backgroundColor: Colors.white,
//         // automaticallyImplyLeading: false,
//         elevation: 0,
//         titleSpacing: 32,
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//         children: [
//           Card(
//             child: Container(
//               height: 155,
//               color: Colors.black12,
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: IconButton(
//                         icon: Icon(Icons.add),
//                         onPressed: () {
//                           Navigator.pop(context);
//                           // Navigator.push(context,
//                           //     MaterialPageRoute(builder: (context) => EditProfile()));
//                         },
//                         color: Colors.black),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 TextField(
//                   cursorColor: Colors.black,
//                   decoration: new InputDecoration(
//                     contentPadding: EdgeInsets.all(10),
//                     border: new OutlineInputBorder(
//                         borderSide: new BorderSide(color: Colors.blue)),
//                     hintText: "Type Here..",
//                     labelText: 'Headline',
//                     helperText: '10/30 Characters',
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Card(
//                   child: Container(
//                     width: double.infinity,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               "Audience",
//                               style: TextStyle(fontSize: 20),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               "Who should see your ad?",
//                               style: TextStyle(fontSize: 14),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: 150.0,
//                                 height: 30.0,
//                                 child: RaisedButton(
//                                   onPressed: () {},
//                                   shape: StadiumBorder(),
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 15,
//                                       ),
//                                       Text("See all"),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Icon(Icons.arrow_downward),
//                                     ],
//                                   ),
//                                   color: Colors.blue[200],
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               SizedBox(
//                                 width: 150.0,
//                                 height: 30.0,
//                                 child: RaisedButton(
//                                   onPressed: () {},
//                                   shape: StadiumBorder(),
//                                   child: Text("Create New"),
//                                   color: Colors.blue[200],
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Card(
//                   child: Container(
//                     width: double.infinity,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               "Duration",
//                               style: TextStyle(fontSize: 20),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               "How many days?",
//                               style: TextStyle(fontSize: 14),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           SizedBox(
//                             width: 300.0,
//                             height: 30.0,
//                             child: RaisedButton(
//                               onPressed: () {},
//                               shape: StadiumBorder(),
//                               child: Text("Save"),
//                               color: Colors.blue[200],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }
