import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';

import 'home.dart';

class tasbeeh extends StatefulWidget {
  const tasbeeh({required this.countt,required this.usercount,required this.docid,Key? key}) : super(key: key);
  final countt;
  final usercount;
  final docid;


  @override
  _tasbeehState createState() => _tasbeehState();
}

class _tasbeehState extends State<tasbeeh> {
  var s=FirebaseFirestore.instance.collection('tasbeeh').snapshots();

  late int rem=int.parse(widget.countt);
  late var usercountt=widget.usercount;
  late var docidd=widget.docid;


  late int num = rem;
  late int counter=usercountt;

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
                                child: Text("Remaining: $rem",style: TextStyle(color: Colors.white,fontSize: 12),)),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      SizedBox(
                          height: 120,
                          width: 120,

                          child: GestureDetector(
                            onTap: (){


                              setState(() {
                                FirebaseFirestore.instance.collection("tasbeeh").doc(docidd).update({
                                  'usercount':counter+1});

                                if(num!=0)
                                {
                                  counter++;
                                  rem--;
                                }
                                else if(num==0)
                                {
                                  counter=counter;
                                  rem=rem;
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
                        height:40,
                        width:70,
                        child:
                        RaisedButton(
                            shape: StadiumBorder(),
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Text('Reset',style: TextStyle(fontSize: 12),),
                            onPressed:(){


                              setState(() {
                                counter=0;
                                rem=num;
                              });
                              FirebaseFirestore.instance.collection("tasbeeh").doc(docidd).update({
                                'usercount':counter});

                            }
                        ),
                      ),


                    ],
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


