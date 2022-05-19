import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:willingness_form/willingness_form.dart';

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('All Forms')),
          ),
          body: SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Column(
                  children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Card(
                    elevation: 50,
                      shadowColor: Colors.blue[800],
                    color: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,  // red as border color
                        ),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                         //CircleAvatar
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                           Column(
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,

                                 children: [
                                   Column(
                                     children: [
                                       Text(
                                         'Supervisor  :',
                                         style: TextStyle(
                                           fontSize: 22,
                                           color: Colors.blue[900],
                                           fontWeight: FontWeight.w600,
                                         ), //Textstyle
                                       ),
                                       Text(
                                         'Project  :',
                                         style: TextStyle(
                                           fontSize: 22,
                                           color: Colors.blue[900],
                                           fontWeight: FontWeight.w600,
                                         ), //Textstyle
                                       ),
                                     ],
                                   ),
                                   Column(
                                     children: [
                                       Text(
                                         'Sir Abdullah',
                                         style: TextStyle(
                                           fontSize: 19,
                                           color: Colors.blue[900],
                                           fontWeight: FontWeight.w500,
                                         ), //Textstyle
                                       ),
                                       Text(
                                         'Tasbeeh App',
                                         style: TextStyle(
                                           fontSize: 19,
                                           color: Colors.blue[900],
                                           fontWeight: FontWeight.w500,
                                         ), //Textstyle
                                       ),
                                     ],
                                   ),
                                 ],
                               )
                             ],
                           ),//Text
                        SizedBox(
                          height: 15,
                        ), //SizedBox
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Students: ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.blue[800]),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Suleman Anwar',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.blue[800],
                                            fontWeight: FontWeight.w500,
                                          ), //Textstyle
                                        ),
                                        Text(
                                          'Umar Tanveer',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.blue[800],
                                            fontWeight: FontWeight.w500,
                                          ), //Textstyle
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'FA19-BCS-061',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.blue[700],
                                            fontWeight: FontWeight.w400,
                                          ), //Textstyle
                                        ),
                                        Text(
                                          'FA19-BCS-068',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.blue[700],
                                            fontWeight: FontWeight.w400,
                                          ), //Textstyle
                                        ),
                                      ],
                                    ),

                                  ],
                                ),

                              ],
                            ),// SizedBox
                      ],
                    ), //Column
                ), //Padding
              ), //SizedBox
            ),
                  ),

                    GestureDetector(
                      onTap: (){

                      },
                      child: Card(
                        elevation: 50,
                        shadowColor: Colors.blue[800],
                        color: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,  // red as border color
                            ),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //CircleAvatar
                                SizedBox(
                                  height: 10,
                                ), //SizedBox
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Supervisor  :',
                                              style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.w600,
                                              ), //Textstyle
                                            ),
                                            Text(
                                              'Project  :',
                                              style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.w600,
                                              ), //Textstyle
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Sir Abdullah',
                                              style: TextStyle(
                                                fontSize: 19,
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.w500,
                                              ), //Textstyle
                                            ),
                                            Text(
                                              'Pocket Password',
                                              style: TextStyle(
                                                fontSize: 19,
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.w500,
                                              ), //Textstyle
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),//Text
                                SizedBox(
                                  height: 15,
                                ), //SizedBox
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Students: ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.blue[800]),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Sohail Sabir',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.blue[800],
                                                fontWeight: FontWeight.w500,
                                              ), //Textstyle
                                            ),
                                            Text(
                                              'Tayyeb Jamil',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.blue[800],
                                                fontWeight: FontWeight.w500,
                                              ), //Textstyle
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'FA19-BCS-016',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.blue[700],
                                                fontWeight: FontWeight.w400,
                                              ), //Textstyle
                                            ),
                                            Text(
                                              'FA19-BCS-031',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.blue[700],
                                                fontWeight: FontWeight.w400,
                                              ), //Textstyle
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),

                                  ],
                                ),// SizedBox
                              ],
                            ), //Column
                          ), //Padding
                        ), //SizedBox
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    FloatingActionButton(
                        onPressed: (){


                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => willingness_form()));

                        },
                      tooltip: 'Add Form',
                      child: const Icon(Icons.add),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}