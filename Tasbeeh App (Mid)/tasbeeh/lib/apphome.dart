import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasbeeh/azan.dart';
import 'package:tasbeeh/home.dart';


class apphome extends StatefulWidget {
  const apphome({Key? key}) : super(key: key);

  @override
  State<apphome> createState() => _apphomeState();
}

class _apphomeState extends State<apphome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,


          children: [


            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => home()));

              },
              child: Material(

                color: Colors.white,
                elevation: 100.0,
                borderRadius: BorderRadius.circular(80.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pinkAccent,width: 3),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Tasbeeh',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.blue[900],

                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
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


                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => azan()));

              },
              child: Material(

                color: Colors.white,
                elevation: 100.0,
                borderRadius: BorderRadius.circular(80.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal,width: 3),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Azaan',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.blue[900],

                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
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
                                  'images/mosque.png',
                                ),
                              ),
                            ),
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
              },
              child: Material(
                color: Colors.black12,
                elevation: 10.0,
                borderRadius: BorderRadius.circular(25.0),
                child: Container(
                  child: Column(
                    children: <Widget>[

                      Center(
                        child: Text(
                          'By Suleman',
                          style: TextStyle(
                            fontSize: 15.0,
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
      ),


    );
  }
}



