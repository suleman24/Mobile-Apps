import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manager/download/student_contact_Pdfservices.dart';
import 'package:manager/download/student_personal_Pdfservices.dart';
import 'package:manager/download/student_sub_class_Pdfservices.dart';

import '../authentication.dart';





class student_personal extends StatefulWidget {
  @override
  _student_personalState createState() => _student_personalState();
}

class _student_personalState extends State<student_personal> {

  var name;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Click on any class'),
        backgroundColor: Colors.blue[800],
      ),
      body:
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('classes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
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

  var name;


  List Pdfdata = [];

  List student_personal_data = [];
  getstudentpersonal() async {
    await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('students').get().then((value) {
      for(var i in value.docs) {
        student_personal_data.add(i.data());
      }
    });
  }
  final student_personal_Pdfservices _pdfservices_studentpersonal=student_personal_Pdfservices();


  @override
  Widget build(BuildContext context) {
    var docid=snapshot.docs[index].id;
    name=snapshot.docs[index]['name'];

    TextEditingController updatee = TextEditingController();
    return GestureDetector(
      onTap: ()async {


        await getstudentpersonal();
        final data=await _pdfservices_studentpersonal.createPdf(student_personal_data);
        _pdfservices_studentpersonal.saveAndLanchFile(data, "Student_Personal_Info.pdf");
        student_personal_data.clear();
      },
      child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,  // red as border color
              ),
              borderRadius: BorderRadius.all(Radius.circular(2))),

          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // changing from 200 to 150 as to look better
                    height: 50.0,
                    width: 50.0,
                    child: ClipOval(
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'images/download.png',
                        ),
                      ),
                    ),
                  ),

                  Text(
                    snapshot.docs[index]['name'],
                    style:
                    TextStyle(fontSize: 25, color:Colors.blue[900], fontWeight: FontWeight.w900),
                  ),
                ],
              ))),
    );
  }
}