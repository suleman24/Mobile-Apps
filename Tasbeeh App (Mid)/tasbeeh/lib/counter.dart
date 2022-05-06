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
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>tasbeeh()));

                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Center(
                        child:
                      Text(document['name'],style: TextStyle(fontSize: 25,color: Colors.white),),
                  )),
                ),
              );
            }).toList(),
          );
        },
      ),

    );

  }

}

