import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tasbeeh.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';


class counter extends StatefulWidget {
  @override
  _counterState createState() => _counterState();
}

class _counterState extends State<counter> {

  List<Object> tasbeehlist = [];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tasbeeh'),
        backgroundColor: Colors.blue[800],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              
              
            ],
          ),
        ),
      ),
    );

  }
  
  
  Future gettasbeehlist() async{
    final tid = AuthService().currentUser?.tid;
    var data = await FirebaseFirestore.instance.collection('tasbeeh').doc(tid).collection('')
  }
}

