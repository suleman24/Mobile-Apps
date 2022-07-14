import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manager/signup.dart';
import 'package:manager/students.dart';

import 'authentication.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'home.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';




class addstudentteacher extends StatefulWidget {
  const addstudentteacher({Key? key, this.classname, this.name, this.email, this.phone, this.password, this.subjects,
    this.image, this.s1, this.s2, this.s3, this.s4, this.s5, this.s6, this.s7, this.s8,


  }) :super(key: key);



  final classname;
  final name;
  final email;
  final phone;
  final  password;
  final subjects;
  final image;
  final s1;
  final s2;
  final s3;
  final s4;
  final s5;
  final s6;
  final s7;
  final s8;

  @override
  _addstudentteacherState createState() => _addstudentteacherState();
}

class _addstudentteacherState extends State<addstudentteacher> {
  String imageUrl = "https://firebasestorage.googleapis.com/v0/b/academia-39c5c.appspot.com/o/test%2Fstudent.jpg?alt=media&token=7f5610b2-bdc8-4b71-b099-3bdbddd7f3d3";




  var key1 = GlobalKey();
  late String classname = widget.classname;
  late String name = widget.name;
  late String email = widget.email;
  late String phone = widget.phone;
  late String password = widget.password;
  late String subjects = widget.subjects;



  late String s1name = widget.s1;
  late String s2name = widget.s2;
  late String s3name = widget.s3;
  late String s4name = widget.s4;
  late String s5name = widget.s5;
  late String s6name = widget.s6;
  late String s7name = widget.s7;
  late String s8name = widget.s8;

  late String image = widget.image;



  Future<void> addData(
      name,
      email,
      phone,
      password,
      subjects
      ) async {

      final uid = AuthenticationHelper().getID();


      FirebaseFirestore.instance
          .collection("manager")
          .doc(uid)
          .collection('students')
          .add({
        "class":classname,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "subjects": subjects,
        "image" : image,
        "s1":s1name,
        "s2":s2name,
        "s3":s3name,
        "s4":s4name,
        "s5":s5name,
        "s6":s6name,
        "s7":s7name,
        "s8":s8name,

        "jan":"Not Payed",
        "feb":"Not Payed",
        "mar":"Not Payed",
        "apr":"Not Payed",
        "may":"Not Payed",
        "jun":"Not Payed",
        "jul":"Not Payed",
        "aug":"Not Payed",
        "sep":"Not Payed",
        "oct":"Not Payed",
        "nov":"Not Payed",
        "dec":"Not Payed",



      });

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Done"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => students()));

                  },
                  child: Text("Ok"))
            ],
            content:
            Container(child: Text("Student Information Added")),
          ));





  }
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar: AppBar(
        title:Text('Add Student'),
      ),

      body:Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: 70,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers')
                        .where("class", whereIn: [classname, 'null']).
                        snapshots(),


                    builder: (context, AsyncSnapshot snapshot) {



                          DocumentSnapshot? snap= snapshot.data.docs[0];

                      if(snap==null)
                        return Text('No teacher for this subject');

                          String s1 = "No Teacher";
                      if(snap['name'].toString() != 'null')
                        {
                        s1 = snap['name'].toString();

                        }

                      return Row(
                        children: [
                          Text(s1name),
                          Text(s1)
                        ],
                      );
                    },
                  ),
                ),



                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  shape: StadiumBorder(),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () async {



                      addData(
                          name,
                          email,
                          phone,
                          password,
                          subjects
                      );

                      print("ok");



                  },
                  child: Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}

























