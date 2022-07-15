import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'student/studentlogin.dart';
import 'teacher/teacherlogin.dart';


class teacherstudent extends StatefulWidget {
  const teacherstudent({Key? key, this.uid,this.name
  }) :super(key: key);

  final uid;
  final name;

  @override
  State<teacherstudent> createState() => _teacherstudentState();
}

class _teacherstudentState extends State<teacherstudent> {

  late var uid = widget.uid;
  late var name = widget.name;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SafeArea(
          child:Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Login ad')),

            ),

            body:
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,


                children: [
                  Center(
                    child: Text(
                      'Click to Continue',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color:Colors.blue[900]),
                    ),
                  ),

                  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => teacherlogin(uid:uid,name: name,)));
                          },
                          child: Material(
                            color: Colors.teal[300],
                            elevation: 10.0,
                            borderRadius: BorderRadius.circular(25.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      'Teacher',
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        color: Colors.white,

                                        fontWeight: FontWeight.w700,
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
                                              'images/teacher.jpg',
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
                      ),


                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => studentlogin(uid:uid,name: name,)));
                      },
                      child: Material(
                        color: Colors.blue[300],
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(25.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'Student',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white,

                                    fontWeight: FontWeight.w700,
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
                                          'images/student.jpg',
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
                  ),

                  SizedBox(
                    height: 100,
                  )


                ],
              ),
            ),
          )
      ),
    );

  }
}

