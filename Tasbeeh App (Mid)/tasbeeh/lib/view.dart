import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'tasbeeh.dart';
import 'package:path/path.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class view extends StatefulWidget {
  @override
  _viewState createState() => _viewState();
}

class _viewState extends State<view> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Tasbeeh'),
        backgroundColor: Colors.blue[800],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('tasbeeh').snapshots(),
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
    return Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                 Row(
                   children: [
                     Container(
                       // changing from 200 to 150 as to look better
                       height: 50.0,
                       width: 50.0,
                       child: ClipOval(
                         child: Image(
                           fit: BoxFit.cover,
                           image: AssetImage(
                             'images/tasbeehh.png',
                           ),
                         ),
                       ),
                     ),

                     Text(
                       snapshot.docs[index]['name'],
                       style:
                       TextStyle(fontSize: 25, color: Colors.white),
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
                           var ref=FirebaseFirestore.instance.collection("tasbeeh").doc(docid);
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
                             title: Text('Enter new name for Tasbeeh'),
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
                                   FirebaseFirestore.instance.collection("tasbeeh").doc(docid).update({
                                     'name':updatee.text,
                                   });
                                   Navigator.of(context).pop();
                                 },
                               ),



                             ],
                           ));
                         },
                         icon: Icon(FontAwesomeIcons.penToSquare),
                         color: Colors.white70,
                       ),




                     ),
                   ],
                 ),






















                ])));
  }
}
