import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tasbeeh.dart';
import 'package:path/path.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';


class view extends StatefulWidget {
  @override
  _viewState createState() => _viewState();
}

class _viewState extends State<view> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tasbeeh'),
        backgroundColor: Colors.blue[800],
      ),
      body:


    );

  }

}

