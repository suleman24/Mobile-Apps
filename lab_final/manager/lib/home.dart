import 'package:flutter/material.dart';

import 'classes.dart';


class home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SafeArea(
          child:Scaffold(
            appBar:AppBar(
              title: Text ('Home'),
              centerTitle: true,
              backgroundColor: Colors.blue[800],

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
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => create()));
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
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => create()));
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
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => create()));
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
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => create()));
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



                  ],
                ),
              ),
            ),
          )
      ),
    );

  }
}

