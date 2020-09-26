import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerAdsManagements/AdsManagements.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerAdsManagements/SubAdsManagement/BoostPost/BoostPostAdsManagement.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerAdsManagements/SubAdsManagement/GetCalls/GetCallsAdsManagement.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerAdsManagements/SubAdsManagement/GetMessages/GetMessagesAdsManagement.dart';
import 'package:AlcaTiktok/Home/pages/Profile/ProfileDrawer/ProfileDrawerAdsManagements/SubAdsManagement/PromotePage/PromotePageAdsManagement.dart';
import 'package:flutter/material.dart';

class ProfileDrawerAdsManagementsChooseGoal extends StatelessWidget {
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
            "Choose your Goal",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          backgroundColor: Colors.white,
          // automaticallyImplyLeading: false,
          elevation: 0,
          titleSpacing: 32,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.transparent,
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BoostPostAdsManagement(),
                            ));
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.40,
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Boost a Post",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetMessagesAdsManagement(),
                            ));
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.40,
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Get More Msg's",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.transparent,
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PromotePageAdsManagement(),
                            ));
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.40,
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Promote Page",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetCallsAdsManagement(),
                            ));
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.40,
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Get More Calls",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Container(
            //   color: Colors.transparent,
            //   child: Center(
            //     child: Row(
            //       children: [
            //         SizedBox(
            //           width: 25,
            //         ),
            //         GestureDetector(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => AdsManagements(),
            //                 ));
            //           },
            //           child: Container(
            //             height: MediaQuery.of(context).size.height * 0.20,
            //             width: MediaQuery.of(context).size.width * 0.40,
            //             decoration: BoxDecoration(
            //                 color: Colors.blue[50],
            //                 borderRadius: BorderRadius.circular(20)),
            //             child: Center(
            //               child: RichText(
            //                 text: TextSpan(
            //                   children: [
            //                     TextSpan(
            //                       text: "Get more msg's",
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontSize: 18,
            //                           fontWeight: FontWeight.bold),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 20,
            //         ),
            //         GestureDetector(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => AdsManagements(),
            //                 ));
            //           },
            //           child: Container(
            //               height: MediaQuery.of(context).size.height * 0.20,
            //               width: MediaQuery.of(context).size.width * 0.40,
            //               decoration: BoxDecoration(
            //                   color: Colors.blue[50],
            //                   borderRadius: BorderRadius.circular(20)),
            //               child: Center(
            //                 child: RichText(
            //                   text: TextSpan(
            //                     children: [
            //                       TextSpan(
            //                         text: "Get more calls",
            //                         style: TextStyle(
            //                             color: Colors.black,
            //                             fontSize: 18,
            //                             fontWeight: FontWeight.bold),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               )),
            //         ),
            //         SizedBox(
            //           width: 20,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ));
  }
}
