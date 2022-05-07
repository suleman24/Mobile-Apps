import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';

import 'home.dart';

class tasbeeh extends StatefulWidget {
  const tasbeeh({required this.countt,Key? key}) : super(key: key);
  final countt;


  @override
  _tasbeehState createState() => _tasbeehState();
}

class _tasbeehState extends State<tasbeeh> {
  var s=FirebaseFirestore.instance.collection('tasbeeh').snapshots();

  late int num=int.parse(widget.countt);

  var counter=0;

  @override


  void initState() {
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Tasbeeh'),
        backgroundColor: Colors.blue[800],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/tasbeehh.png"),
                fit: BoxFit.fitWidth
              )
            ),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
            Container(
              height: 50,
            width: 50,
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/muhammad.png"),
              fit: BoxFit.fitWidth
          )
        ),),
                    Container(
                      height: 25,
                      child: Text(
                        "Pray to Allah",style: TextStyle(fontSize: 20,color: Colors.amber),
                      ),
                    ),

                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/allah.png"),
                              fit: BoxFit.fitWidth
                          )
                      ),),
                  ],
                ),

               

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          height:50,
                          child:  ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.red[300]),

                                  shape:MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),

                                      )
                                  )

                              ),


                              onPressed: () {

                              },
                              child: Text("Total: ${widget.countt}",style: TextStyle(color: Colors.white,fontSize: 13),)),
                        ),

                      ],
                    ),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          height:50,
                          child:  ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.red[300]),

                                  shape:MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),

                                      )
                                  )

                              ),


                              onPressed: () {

                              },
                              child: Text("Remaining: $num",style: TextStyle(color: Colors.white,fontSize: 12),)),
                        ),

                      ],
                    ),

                  ],),



                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 320,
                      height:50,
                      child:  ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.black54),

                              shape:MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )
                              )

                          ),


                          onPressed: () {

                          },
                          child: Text("$counter",style: TextStyle(color: Colors.white,fontSize: 25),)),
                    ),

                  ],
                ),
                SizedBox(
                  height:30,
                ),

                SizedBox(
                    height: 120,
                    width: 120,

                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          counter++;
                          num--;

                          if(num==0)
                            {
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
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => home()));


                                    },
                                    width: 120,

                                  )
                                ],
                              ).show();
                            }

                        });
                      },
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundImage: AssetImage('images/button.png'),
                      ),
                    )

                ),
                SizedBox(
                  height:20,
                ),
              ],
            ),
          )















        ),
      ),
    );
  }
}


