import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class create extends StatefulWidget {
  @override
  _createState createState() => _createState();
}

class _createState extends State<create> {
  TextEditingController tname = TextEditingController();
  TextEditingController tcount = TextEditingController();

  var name;
  var count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creae Tasbeeh'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
         
        ),
      ),
    );
  }
}
