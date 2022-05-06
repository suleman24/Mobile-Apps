
import 'package:flutter/material.dart';

import 'main.dart';


class home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SafeArea(
          child:Scaffold(
            appBar:AppBar(
              title: Text ('Tasbeeh'),
              centerTitle: true,
            ),

            body:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,


              children: [

                //
                // InkWell(
                //   onTap: (){
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => ()));
                //   },
                //   child: Material(
                //     color: Colors.blue[400],
                //     elevation: 10.0,
                //     borderRadius: BorderRadius.circular(25.0),
                //     child: Container(
                //       child: Column(
                //         children: <Widget>[
                //           Padding(
                //             padding: EdgeInsets.symmetric(
                //               vertical: 10.0,
                //             ),
                //             child: Material(
                //               elevation: 5.0,
                //               borderRadius: BorderRadius.circular(100.0),
                //               child: Container(
                //                 // changing from 200 to 150 as to look better
                //                 height: 120.0,
                //                 width: 120.0,
                //                 child: ClipOval(
                //                   child: Image(
                //                     fit: BoxFit.cover,
                //                     image: AssetImage(
                //                       'images/truefalse.png',
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Center(
                //             child: Text(
                //               'True / False',
                //               style: TextStyle(
                //                 fontSize: 20.0,
                //                 color: Colors.white,
                //
                //                 fontWeight: FontWeight.w700,
                //               ),
                //             ),
                //           ),
                //
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                //
                // InkWell(
                //   onTap: (){
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => ()));
                //   },
                //   child: Material(
                //     color: Colors.red[300],
                //     elevation: 10.0,
                //     borderRadius: BorderRadius.circular(25.0),
                //     child: Container(
                //       child: Column(
                //         children: <Widget>[
                //           Padding(
                //             padding: EdgeInsets.symmetric(
                //               vertical: 10.0,
                //             ),
                //             child: Material(
                //               elevation: 5.0,
                //               borderRadius: BorderRadius.circular(100.0),
                //               child: Container(
                //                 // changing from 200 to 150 as to look better
                //                 height: 120.0,
                //                 width: 120.0,
                //                 child: ClipOval(
                //                   child: Image(
                //                     fit: BoxFit.cover,
                //                     image: AssetImage(
                //                       'images/cpp.png',
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Center(
                //             child: Text(
                //               'Multiple Choice',
                //               style: TextStyle(
                //                 fontSize: 20.0,
                //                 color: Colors.white,
                //
                //                 fontWeight: FontWeight.w700,
                //               ),
                //             ),
                //           ),
                //
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                //
                //
                //
                //
                //
                //
                // InkWell(
                //   onTap: (){
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => ()));
                //   },
                //   child: Material(
                //     color: Colors.teal[500],
                //     elevation: 10.0,
                //     borderRadius: BorderRadius.circular(25.0),
                //     child: Container(
                //       child: Column(
                //         children: <Widget>[
                //           Padding(
                //             padding: EdgeInsets.symmetric(
                //               vertical: 10.0,
                //             ),
                //             child: Material(
                //               elevation: 5.0,
                //               borderRadius: BorderRadius.circular(100.0),
                //               child: Container(
                //                 // changing from 200 to 150 as to look better
                //                 height: 120.0,
                //                 width: 120.0,
                //                 child: ClipOval(
                //                   child: Image(
                //                     fit: BoxFit.cover,
                //                     image: AssetImage(
                //                       'images/me.png',
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Center(
                //             child: Text(
                //               'About',
                //               style: TextStyle(
                //                 fontSize: 20.0,
                //                 color: Colors.white,
                //
                //                 fontWeight: FontWeight.w700,
                //               ),
                //             ),
                //           ),
                //
                //         ],
                //       ),
                //     ),
                //   ),
                // ),










              ],
            ),
          )
      ),
    );

  }
}