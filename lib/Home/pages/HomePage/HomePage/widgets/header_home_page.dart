import 'package:AlcaTiktok/Home/pages/HomePage/Following/Following.dart';
import 'package:AlcaTiktok/Home/pages/HomePage/Pages/PersonalPage.dart';
import 'package:flutter/material.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Following()));
            },
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Following",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF).withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "For You",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PersonalPage()));
            },
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Pages",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF).withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Expanded(
        //   flex: 1,
        //   child: Align(
        //     alignment: Alignment.center,
        //     child: RichText(
        //       text: TextSpan(
        //         children: [
        //           TextSpan(
        //             text: "Pages",
        //             style: TextStyle(
        //                 color: white.withOpacity(0.7),
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.bold),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),

        // Text(
        //   "Following",
        //   style: TextStyle(
        //     color: white.withOpacity(0.7),
        //     fontSize: 16,
        //   ),
        // ),
        // SizedBox(
        //   width: 8,
        // ),
        // Text(
        //   "|",
        //   style: TextStyle(
        //     color: white.withOpacity(0.3),
        //     fontSize: 14,
        //   ),
        // ),
        // SizedBox(
        //   width: 8,
        // ),
        // Text(
        //   "For You",
        //   style: TextStyle(
        //       color: white, fontSize: 17, fontWeight: FontWeight.w500),
        // ),
        // SizedBox(
        //   width: 8,
        // ),
        // Text(
        //   "|",
        //   style: TextStyle(
        //     color: white.withOpacity(0.3),
        //     fontSize: 17,
        //   ),
        // ),
        // SizedBox(
        //   width: 8,
        // ),
        // Text(
        //   "Pages",
        //   style: TextStyle(
        //       color: white.withOpacity(0.7),
        //       fontSize: 14,
        //       fontWeight: FontWeight.w500),
        // )
      ],
    );
  }
}
