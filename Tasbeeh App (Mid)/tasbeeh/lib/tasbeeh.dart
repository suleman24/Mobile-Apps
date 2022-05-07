import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tasbeeh extends StatefulWidget {
  const tasbeeh({required this.docid,Key? key}) : super(key: key);
  final  docid;


  @override
  _tasbeehState createState() => _tasbeehState();
}

class _tasbeehState extends State<tasbeeh> {
  var s=FirebaseFirestore.instance.collection('tasbeeh').snapshots();

  var counter=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Tasbeeh'),
        backgroundColor: Colors.blue[800],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                Container(
                  child: Text('Total :${widget.docid} ',style: TextStyle(fontSize: 22,color: Colors.red),),
                ),
                Container(
                  child: Text('Remaining : 90 ',style: TextStyle(fontSize: 22,color: Colors.red)),
                )
              ],),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height:50,
                    child:  ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue[300]),

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
                height: 100,
                width: 100,

                child: TextButton(onPressed: ()
                    {
                      print(widget.docid);
                      setState(() {
                        counter++;
                      });
                    }
                    ,
                    child:
                Text('O',style: TextStyle(color: Colors.white,fontSize: 50),),

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                      shape:MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(color:Colors.deepPurple),

                          )
                      )

                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


