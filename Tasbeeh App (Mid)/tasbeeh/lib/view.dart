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

  TextEditingController updatee = TextEditingController();





  update(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter new name for Tasbeeh'),
            content: TextField(
              controller: updatee,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: "Name"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }





  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Tasbeeh'),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:[
                                Text(document['name'],style: TextStyle(fontSize: 25,color: Colors.white),),

                                TextButton(onPressed: ()
                                {
                                }
                                  ,
                                  child:
                                  Text('Delete',style: TextStyle(color: Colors.red[300],fontSize: 20),),

                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                                      shape:MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),

                                          )
                                      )

                                  ),

                                ),
                                TextButton(onPressed: ()=> update(context),
                                  child:
                                  Text('Update',style: TextStyle(color: Colors.green[300],fontSize: 20),),

                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                                      shape:MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),

                                          )
                                      )

                                  ),

                                ),

                              ]
                            )
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

