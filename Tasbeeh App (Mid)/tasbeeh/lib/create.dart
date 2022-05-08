import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'home.dart';
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
        child:  Container(

            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/border.png"),
                    fit: BoxFit.fill
                )
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child:















              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  TextField(
                    controller: tname,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Colors.blue
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Colors.teal
                            )

                        ),
                        labelText: "Name of Tasbeeh"
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  TextField(
                    controller: tcount,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Colors.blue
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Colors.teal
                            )

                        ),

                        labelText: "How many times?"

                    ),
                  ),

                  SizedBox(
                    height: 120,
                  ),

                  SizedBox(
                      height:80,
                      width:150,
                      child:
                      RaisedButton(
                          shape: StadiumBorder(),
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('Create'),
                          onPressed:(){

                            name=tname.text;
                            count=tcount.text;


                            FirebaseFirestore.instance.collection('tasbeeh').add({'name':'$name','count':'$count','usercount':0});

                            Alert(
                              context: context,
                              type: AlertType.success,

                              title: "Finished",
                              desc: "You have Completed the Tasbeeh",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {

                                  },
                                  width: 120,
                                )
                              ],
                            ).show();



                          }
                      )
                  ),




                ],
              ),
            )),
      ),
    );

  }
}

