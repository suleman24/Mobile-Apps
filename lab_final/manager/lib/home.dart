import 'package:flutter/material.dart';

import 'Fees/fee.dart';
import 'authentication.dart';
import 'check.dart';
import 'classes.dart';
import 'download/download.dart';
import 'notifications.dart';
import 'students.dart';
import 'subjects.dart';
import 'teachers.dart';


class home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SafeArea(
          child:Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Home')),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      shape: StadiumBorder(),
                      textColor: Colors.white,
                      color: Colors.pinkAccent,
                      child: Text('Logout',style: TextStyle(fontSize: 10),),
                      onPressed:(){
                        AuthenticationHelper().signOut(context);

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Check()));
                      }





                  ),
                )
              ],
            ),

            body:
            SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                  children: [


                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => teachers()));
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
                                    'Teachers',
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
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => students()));
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
                                    'Students',
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => classes()));
                        },
                        child: Material(
                          color: Colors.red[300],
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Classes',
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
                                            'images/class.jpg',
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
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => subjects()));
                        },
                        child: Material(
                          color: Colors.brown[400],
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Subjects',
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
                                            'images/book.jpg',
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
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => fee()));
                        },
                        child: Material(
                          color: Colors.blueGrey[600],
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Fees',
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
                                            'images/fee.jpg',
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
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => download()));
                        },
                        child: Material(
                          color: Colors.deepPurple[400],
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Download & Print',
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
                                            'images/download.png',
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
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => notifications()));
                        },
                        child: Material(
                          color: Colors.white,
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Notifications',style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.pink,

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
                                            'images/notification.png',
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


                  ],
                ),
              ),
            ),
          )
      ),
    );

  }
}

