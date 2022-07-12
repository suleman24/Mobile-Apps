import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manager/subjects.dart';

import '../authentication.dart';

class studentfee extends StatefulWidget {
  const studentfee(
      {required this.name, required this.fee, required this.docid,required this.cname,required this.index,required this.subjects, Key? key,})
      : super(key: key);

  final name;
  final cname;

  final fee;
  final docid;
  final index;
  final subjects;

  @override
  _studentfeeState createState() => _studentfeeState();
}

class _studentfeeState extends State<studentfee> {
  late int classfee = widget.fee;
  late var sname = widget.name;
  late var classname = widget.cname;
  late int index = widget.index;
  late int subjects = int.parse(widget.subjects);

  int subjectcount=0;
  int totalfee=0;
  List items = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fee Deatils'),
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            width: 300,
            child: Row(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('students')
                      .where('class', isEqualTo: classname).snapshots(),



                  builder: (context, AsyncSnapshot snapshot) {

                    // DocumentSnapshot snap = snapshot.data.docs[index];
                  //
                  //   if(!items.contains('s1'))
                  //   items.add(snap['s1']);
                  //   items.add(snap['s4']);
                  //   // items.add(snap['s3']);
                  //   //
                  //
                  //   print('********************');
                  //   print(items);
                  // print('********************');
                  //
                  //
                    //subjectcount = snapshot.data.docs.length;
                   totalfee = subjects * classfee;

                    return Text('Total Fee : $totalfee');
                  },
                ),
              ],
            ),
          )
        ],

      )
    );
  }
}
