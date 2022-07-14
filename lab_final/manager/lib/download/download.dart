// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:manager/download/student_contact.dart';
import '../authentication.dart';
import 'teacher_contact_Pdfservices.dart';
import 'download_teacher_contacts.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class download extends StatefulWidget {
  const download({Key? key}) : super(key: key);

  @override
  _downloadState createState() => _downloadState();
}

class _downloadState extends State<download> {

  final decor = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  final boxDecor = BoxDecoration(
    color: Colors.blue.shade400,
    borderRadius: BorderRadius.circular(
      50,
    ),
  );
  bool uploading = false;
  bool downloading = false;


  List Pdfdata = [];

  getData() async {
    await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers').get().then((value) {
      for(var i in value.docs) {
        Pdfdata.add(i.data());
      }
    });
  }
  final teacher_contact_Pdfservices _pdfservices=teacher_contact_Pdfservices();


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

                    await getData();
                    final data=await _pdfservices.createPdf(Pdfdata);
                    _pdfservices.saveAndLanchFile(data, "teachercontact.pdf");
                    Pdfdata.clear();
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

            ],
          ),
        ),
      ),
    );
  }
}




