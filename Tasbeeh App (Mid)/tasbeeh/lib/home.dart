
import 'package:flutter/material.dart';
import 'package:tasbeeh/view.dart';

import 'counter.dart';
import 'create.dart';
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
              backgroundColor: Colors.blue[800],
            ),

            body:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                children: [


                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => create()));
                    },
                    child: Material(
                      color: Colors.teal[300],
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(25.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(100.0),
                                child: Container(
                                  // changing from 200 to 150 as to look better
                                  height: 120.0,
                                  width: 120.0,
                                  child: ClipOval(
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'images/tasbeehh.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Create Tasbeeh',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,

                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => counter()));
                    },
                    child: Material(
                      color: Colors.blue[400],
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(25.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(100.0),
                                child: Container(
                                  // changing from 200 to 150 as to look better
                                  height: 120.0,
                                  width: 120.0,
                                  child: ClipOval(
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'images/tasbeeh1.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Counter Tasbeeh',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,

                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => view()));
                    },
                    child: Material(
                      color: Colors.red[300],
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(25.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(100.0),
                                child: Container(
                                  // changing from 200 to 150 as to look better
                                  height: 120.0,
                                  width: 120.0,
                                  child: ClipOval(
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'images/tasbeeh2.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'View All Tasbeeh',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,

                                  fontWeight: FontWeight.w700,
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
          )
      ),
    );

  }
}