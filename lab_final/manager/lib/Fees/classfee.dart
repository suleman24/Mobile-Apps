import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../authentication.dart';
import 'studentfee.dart';

class classfee extends StatefulWidget {
  const classfee(
      {required this.name, required this.fee, required this.docid, Key? key})
      : super(key: key);

  final name;
  final fee;
  final docid;

  @override
  _classfeeState createState() => _classfeeState();
}

class _classfeeState extends State<classfee> {
  late int classfee = int.parse(widget.fee);
  late var classname = widget.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All students'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('manager')
              .doc(AuthenticationHelper().getID())
              .collection('students')
              .where("class", isEqualTo: classname)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );

            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: CardList(snapshot: snapshot.data, index: index,classname:classname,classfee:classfee),
                  );
                });
          },
        ),
      ),
    );
  }
}

class CardList extends StatefulWidget {
  CardList({required this.snapshot, required this.index,required this.classname,required this.classfee});
  final QuerySnapshot snapshot;
  final int index;

  final classname;
  final classfee;

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  late int fee = widget.classfee;
  late int index= widget.index;
  late var cname = widget.classname;

  @override
  Widget build(BuildContext context) {
    var docid = widget.snapshot.docs[widget.index].id;
    var name = widget.snapshot.docs[widget.index]['name'];
    var subjects = widget.snapshot.docs[widget.index]['subjects'];
    return GestureDetector(
      child: Card(
        elevation: 50,
        shadowColor: Colors.blue[800],
        color: Colors.white,
        child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blue, // red as border color
                ),
                borderRadius: BorderRadius.all(Radius.circular(2))),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50.0,
                  width: 50.0,
                  child: ClipOval(
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'images/student.jpg',
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.snapshot.docs[widget.index]['name'],
                  style: TextStyle(fontSize: 15, color: Colors.blue[900]),
                ),
              ],
            ))),
      ),



      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => studentfee(name: name,fee:fee,docid:docid,cname: cname,index:index,subjects:subjects)));
      }
    );
  }
}
