import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerAdsManagements/SubAdsManagement/GetMessages/GetMessagesPostPreview.dart';
import 'package:flutter/material.dart';

class GetMessagesAdsManagement extends StatefulWidget {
  @override
  _GetMessagesAdsManagementState createState() =>
      _GetMessagesAdsManagementState();
}

class _GetMessagesAdsManagementState extends State<GetMessagesAdsManagement> {
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
          "Get Messages Create",
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
                                  onPressed: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Scaffold(
                                          appBar: AppBar(
                                            centerTitle: true,
                                            title: Text(
                                              "Edit audience",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            ),
                                            backgroundColor: Colors.white,
                                            elevation: 0,
                                            titleSpacing: 32,
                                          ),
                                          body: SingleChildScrollView(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                      "Select the location, age, gender and interests of people you want to reach with your ad."),
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          "Gender",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: RaisedButton(
                                                          onPressed: () {},
                                                          child: Text("All"),
                                                          color:
                                                              Colors.grey[200],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: RaisedButton(
                                                          onPressed: () {},
                                                          child: Text("Men"),
                                                          color:
                                                              Colors.grey[200],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: RaisedButton(
                                                          onPressed: () {},
                                                          child: Text("Women"),
                                                          color:
                                                              Colors.grey[200],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          "Age",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child:
                                                        GetMessagesAgeRangeSlider(),
                                                  ),
                                                  SizedBox(height: 20),
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          "Location",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  TextField(
                                                    cursorColor: Colors.black,
                                                    decoration: InputDecoration(
                                                      hintText: "Search",
                                                      prefixIcon:
                                                          Icon(Icons.search),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: RaisedButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          shape:
                                                              StadiumBorder(),
                                                          child: Text("Cancel"),
                                                          color:
                                                              Colors.grey[200],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: SizedBox(),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: RaisedButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          shape:
                                                              StadiumBorder(),
                                                          child: Text("Save"),
                                                          color:
                                                              Colors.grey[200],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
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
                              "Advertisement Preview",
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            GetMessagesPostPreview(),
                                      ));
                                },
                                shape: StadiumBorder(),
                                child: Text("Preview"),
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

class GetMessagesAgeRangeSlider extends StatefulWidget {
  @override
  _GetMessagesAgeRangeSliderState createState() =>
      _GetMessagesAgeRangeSliderState();
}

class _GetMessagesAgeRangeSliderState extends State<GetMessagesAgeRangeSlider> {
  RangeValues values = const RangeValues(1, 100);
  RangeLabels labels = RangeLabels('1', '100');
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
        min: 1,
        max: 100,
        divisions: 10,
        values: values,
        labels: labels,
        onChanged: (value) {
          print('Start: ${value.start}, End: ${value.end}');
          setState(() {
            values = value;
            labels = RangeLabels(
                value.start.toInt().toString(), value.end.toInt().toString());
          });
        });
  }
}
