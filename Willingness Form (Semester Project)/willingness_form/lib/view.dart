import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:willingness_form/willingness_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:willingness_form/authentication.dart';

import 'login.dart';

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Center(child: Text('All Forms')),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      shape: StadiumBorder(),
                      textColor: Colors.white,
                      color: Colors.pinkAccent,
                      child: Text('Logout',style: TextStyle(fontSize: 10),),
                      onPressed:(){

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => login()),
                              (Route<dynamic> route) => false,
                        );
                      }





                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){


                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => willingness_form()),
                      (Route<dynamic> route) => false,
                );
              },
              tooltip: 'Add Form',
              child: const Icon(Icons.add),
            ),

            body:StreamBuilder(
              stream: FirebaseFirestore.instance.collection('semesterproject').doc(AuthenticationHelper().getID()).collection('willingness_form').snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) return Center(
                  child: CircularProgressIndicator(),);

                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        child: CardList(snapshot: snapshot.data,index: index),
                      );
                    });

              },
            )
        )
    );
  }
}









class CardList extends StatelessWidget {
  CardList({required this.snapshot,required this.index});
  final QuerySnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    var docid=snapshot.docs[index].id;

    return  Center(
      child: Column(
        children: [
          Card(
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
                            Flexible(
                              child: Column(
                                children: [
                                  Text(
                                    snapshot.docs[index]['supervisorname'],

                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.w500,
                                    ), //Textstyle
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.docs[index]['project'],

                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.w500,
                                    ), //Textstyle
                                  ),
                                ],
                              ),
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
                            Flexible(
                              child: Column(
                                children: [
                                  Text(
                                    snapshot.docs[index]['s1name'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue[800],
                                      fontWeight: FontWeight.w500,
                                    ), //Textstyle
                                  ),
                                  Text(
                                    snapshot.docs[index]['s2name'],

                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue[800],
                                      fontWeight: FontWeight.w500,
                                    ), //Textstyle
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child:
                            Column(
                              children: [
                                Text(
                                  snapshot.docs[index]['s1reg'],

                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue[700],
                                    fontWeight: FontWeight.w400,
                                  ), //Textstyle
                                ),
                                Text(
                                  snapshot.docs[index]['s2reg'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue[700],
                                    fontWeight: FontWeight.w400,
                                  ), //Textstyle
                                ),
                              ],
                            ),)

                          ],
                        ),

                      ],
                    ),// SizedBox
                  ],
                ), //Column
              ), //Padding
            ), //SizedBox
          ),



          SizedBox(
            height: 20,
          ),

        ],
      ),
    );
  }
}