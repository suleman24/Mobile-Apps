// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:manager/download/student_contact.dart';
import 'package:manager/download/student_fee.dart';
import 'package:manager/download/student_personal.dart';
import 'package:manager/download/student_personal_Pdfservices.dart';
import 'package:manager/download/student_sub_class.dart';
import 'package:manager/download/teacher_personal_Pdfservices.dart';
import 'package:manager/download/teacher_sub_class_Pdfservices.dart';
import '../authentication.dart';
import 'teacher_contact_Pdfservices.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class download extends StatefulWidget {
  const download({Key? key}) : super(key: key);

  @override
  _downloadState createState() => _downloadState();
}

class _downloadState extends State<download> {

  List teacher_contatct_data = [];
  getteachercontact() async {
    await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers').
    where('name', isNotEqualTo: 'No Teacher').get().then((value) {
      for(var i in value.docs) {
        teacher_contatct_data.add(i.data());
      }
    });
  }
  final teacher_contact_Pdfservices _pdfservices_teachercontact=teacher_contact_Pdfservices();




  List teacher_personal_data = [];
  getteacherpersonal() async {
    await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers').
    where('name', isNotEqualTo: 'No Teacher').get().then((value) {
      for(var i in value.docs) {
        teacher_personal_data.add(i.data());
      }
    });
  }
  final teacher_personal_Pdfservices _pdfservices_teacherpersonal=teacher_personal_Pdfservices();





  List teacher_sub_class_data = [];
  getteachersub_class() async {
    await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers').
    where('name', isNotEqualTo: 'No Teacher').get().then((value) {
      for(var i in value.docs) {
        teacher_sub_class_data.add(i.data());
      }
    });
  }
  final teacher_sub_class_Pdfservices _pdfservices_teacher_sub_class=teacher_sub_class_Pdfservices ();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Download & Print"),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,


            children: [

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => student_fee()));

                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Student Fee',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,

                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(100.0),
                              child: Container(
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
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {

                    await getteachercontact();
                    final data=await _pdfservices_teachercontact.createPdf(teacher_contatct_data);
                    _pdfservices_teachercontact.saveAndLanchFile(data, "Teacher_class_&_subjeect.pdf");
                    teacher_contatct_data.clear();

                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Teachers Contacts',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,

                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(100.0),
                              child: Container(
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
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => student_contact()));

                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Students Contacts',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,

                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(100.0),
                              child: Container(
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
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {

                    await getteacherpersonal();
                    final data=await _pdfservices_teacherpersonal.createPdf(teacher_personal_data);
                    _pdfservices_teacherpersonal.saveAndLanchFile(data, "Teacher_Personal_Info.pdf");
                    teacher_personal_data.clear();

                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Teachers Details',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,

                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(100.0),
                              child: Container(
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
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => student_personal()));

                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Student Details',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,

                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(100.0),
                              child: Container(
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
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {


                    await getteachersub_class();
                    final data=await _pdfservices_teacher_sub_class.createPdf(teacher_sub_class_data);
                    _pdfservices_teacher_sub_class.saveAndLanchFile(data, "teachers_subject_&_class.pdf");
                    teacher_contatct_data.clear();

                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: [
                              Center(
                                child: Text(
                                  'Teachers Class',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '& Subjects',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(100.0),
                              child: Container(
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
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => student_sub_class()));
                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: [
                              Center(
                                child: Text(
                                  'Students Subjects',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Classwise',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(100.0),
                              child: Container(
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
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}




