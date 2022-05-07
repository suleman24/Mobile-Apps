import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tasbeeh.dart';

import 'package:firebase_database/ui/firebase_animated_list.dart';


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
        title: Text('My Tasbeeh'),
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
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
    TextEditingController updatee = TextEditingController();
    return GestureDetector(
      onTap: (){

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tasbeeh(docid: data,)));
      },
      child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.blue[400],
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      snapshot.docs[index]['name'],
                      style:
                      TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Text(
                      snapshot.docs[index]['count'],
                      style:
                      TextStyle(fontSize: 25, color: Colors.white),
                    ),

                  ]))),
    );
  }
}

