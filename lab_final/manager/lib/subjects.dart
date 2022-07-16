import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'authentication.dart';




class subjects extends StatefulWidget {
  @override
  _subjectsState createState() => _subjectsState();
}

class _subjectsState extends State<subjects> {

  TextEditingController subjectname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subject'),
        backgroundColor: Colors.blue[800],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Center(
            child: CircularProgressIndicator(),);

          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  child: CardList(snapshot: snapshot.data,index: index),
                );
              });

        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async{

          await showDialog(context: context, builder: (context)=> AlertDialog(
            title: Text('Enter name of Subject',style: TextStyle(fontSize: 20,color: Colors.deepPurple),),
            content: TextField(
              controller: subjectname,
              textInputAction: TextInputAction.go,

              decoration: InputDecoration(hintText: "Name"),
            ),
            actions: <Widget>[
              new
              RaisedButton(
                shape: StadiumBorder(),
                textColor: Colors.white,
                color: Colors.blue,
                child: Text('OK'),
                onPressed: () {

                  final uid=AuthenticationHelper().getID();

                  FirebaseFirestore.instance.collection("manager").doc(uid).collection('subjects').add({'name': subjectname.text,});

                },
              ),



            ],
          ));
        },
        tooltip: 'Add Subject',
        child: const Icon(Icons.add),
      ),
    );
  }
}
class CardList extends StatelessWidget {
  CardList({required this.snapshot,required this.index});
  final QuerySnapshot snapshot;
  final int index;


  @override
  Widget build(BuildContext context) {
    var docid=snapshot.docs[index].id;
    TextEditingController updatee = TextEditingController();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 50,
      shadowColor: Colors.blue[800],
      color: Colors.white,
      child: Container(
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,  // red as border color
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 50.0,
                          width: 50.0,
                          child: ClipOval(
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'images/book.jpg',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          snapshot.docs[index]['name'],
                          style:
                          TextStyle(fontSize: 25, color: Colors.blue[900]),
                        ),
                      ],
                    ),

                    SizedBox(
                      width: 30,
                    ),

                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,

                          child: IconButton(
                            onPressed: () async{
                              var ref=FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').doc(docid);
                              ref.delete();
                            },
                            icon: Icon(FontAwesomeIcons.trashCanArrowUp),
                            color: Colors.redAccent[700],
                            //cart+ icon from FontAwesome
                          ),

                        ),
                        Container(
                          height: 50,
                          width: 50,

                          child:
                          IconButton(
                            onPressed:
                                () async{
                              await showDialog(context: context, builder: (context)=> AlertDialog(
                                title: Text('Enter new name of subject',style: TextStyle(fontSize: 20,color: Colors.deepPurple)),
                                content: TextField(
                                  controller: updatee,
                                  textInputAction: TextInputAction.go,

                                  decoration: InputDecoration(hintText: "Name"),
                                ),
                                actions: <Widget>[
                                  new
                                  RaisedButton(
                                    shape: StadiumBorder(),
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    child: Text('OK'),
                                    onPressed: () {
                                      FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').doc(docid).update({
                                        'name':updatee.text,
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),



                                ],
                              ));
                            },
                            icon: Icon(FontAwesomeIcons.penToSquare),
                            color: Colors.teal,
                          ),




                        ),
                      ],
                    ),





                  ]))),
    );
  }


}