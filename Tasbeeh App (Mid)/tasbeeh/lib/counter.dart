import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tasbeeh.dart';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class counter extends StatefulWidget {
  @override
  _counterState createState() => _counterState();
}

class _counterState extends State<counter> {

  var name;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Click on any of these to continue'),
        backgroundColor: Colors.blue[800],
      ),
      body:
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection('tasbeeh').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
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
      ),

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
    var data=snapshot.docs[index]['count'];
    var usercount=snapshot.docs[index]['usercount'];

    TextEditingController updatee = TextEditingController();
    return GestureDetector(
      onTap: (){

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tasbeeh(countt: data,usercount:usercount,docid:docid)));
      },
      child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.teal[300],
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                        Row(
                          children: [
                            Container(
                              // changing from 200 to 150 as to look better
                              height: 50.0,
                              width: 50.0,
                              child: ClipOval(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'images/tasbeeh1.png',
                                  ),
                                ),
                              ),
                            ),

                            Text(
                              snapshot.docs[index]['name'],
                              style:
                              TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ],
                        ),
                    Row(
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Counted',
                              style:
                              TextStyle(fontSize: 12, color: Colors.pink),
                            ),
                            Text(
                              '$usercount',
                              style:
                              TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          width:25,
                        ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Text(
                             'Total',
                             style:
                             TextStyle(fontSize: 12, color: Colors.pink),
                           ),
                           Text(
                             snapshot.docs[index]['count'],
                             style:
                             TextStyle(fontSize: 25, color: Colors.white),
                           ),
                         ],
                       ),
                        Container(
                          width:15,
                        ),

                      ],
                    )


                  ]))),
    );
  }
}

