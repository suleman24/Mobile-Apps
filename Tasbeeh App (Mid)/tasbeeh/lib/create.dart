import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tasbeeh.dart';


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
        title: Text('Create Tasbeeh'),
        backgroundColor: Colors.blue[800],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

                  TextField(
                    controller: tname,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.blue
                          )
                        ),
                        labelText: "Name of Tasbeeh"
                    ),
                  ),



                    TextField(
                      controller: tcount,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3,
                                  color: Colors.blue
                              )
                          ),
                          labelText: "How many times?"

                      ),
                    ),


                  SizedBox(
                    height:80,
                    width:150,
                    child:
                    RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Create'),
                        onPressed:(){

                          name=tname.text;
                          count=tcount.text;


                          FirebaseFirestore.instance.collection('tasbeeh').add({'name':'$name','count':'$count'});



                          }
                    )
                  ),




            ],
          ),
        ),
      ),
    );

    }
  }

