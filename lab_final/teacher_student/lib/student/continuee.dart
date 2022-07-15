import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teacher_student/student/studenthome.dart';

class continuee extends StatefulWidget {
  const continuee({Key? key, this.uid, this.password, this.name}) : super(key: key);
  final uid;
  final password;
  final name;

  @override
  _continueeState createState() => _continueeState();
}

class _continueeState extends State<continuee> {
  late var uid = widget.uid;
  late var password = widget.password;
  late var name = widget.name;

  var sname;
  var docid;

  var phone;
  var email;
  var classs;
  var subjects;
  var image;

  var s1 = null;
  var s2 = null;
  var s3 = null;
  var s4 = null;
  var s5 = null;
  var s6 = null;
  var s7 = null;
  var s8 = null;

  var t1 = null;
  var t2 = null;
  var t3 = null;
  var t4 = null;
  var t5 = null;
  var t6 = null;
  var t7 = null;
  var t8 = null;

  var jan = null;
  var feb= null;
  var mar= null;
  var apr= null;
  var may= null;
  var jun= null;
  var jul= null;
  var aug= null;
  var sep= null;
  var oct= null;
  var nov= null;
  var dec= null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Continue'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('manager')
            .doc(uid)
            .collection('students')
            .where("password", whereIn: [password, 'null']).snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          DocumentSnapshot snap = snapshot.data.docs[0];
          sname = snap['name'].toString();

          if (snapshot.data!.docs.length == 1) {
            snap = snapshot.data.docs[0];
            docid = snapshot.data.docs[0].id;
          } else {
            snap = snapshot.data.docs[1];
            docid = snapshot.data.docs[1].id;
          }
          sname = snap['name'].toString();
          classs = snap['class'].toString();
          phone = snap['phone'].toString();
          email = snap['email'].toString();
          image = snap['image'].toString();
          subjects = snap['subjects'].toString();
          s1 = snap['s1'].toString();
          s2 = snap['s2'].toString();
          s3 = snap['s3'].toString();
          s4 = snap['s4'].toString();
          s5 = snap['s5'].toString();
          s6 = snap['s6'].toString();
          s7 = snap['s7'].toString();
          s8 = snap['s8'].toString();
          //
          t1 = snap['t1'].toString();
          t2 = snap['t2'].toString();
          t3 = snap['t3'].toString();
          t4 = snap['t4'].toString();
          t5 = snap['t5'].toString();
          t6 = snap['t6'].toString();
          t7 = snap['t7'].toString();
          t8 = snap['t8'].toString();

          jan = snap['jan'].toString();
          feb = snap['feb'].toString();
          mar = snap['mar'].toString();
          apr = snap['apr'].toString();
          may = snap['may'].toString();
          jun = snap['jun'].toString();
          jul = snap['jul'].toString();
          aug = snap['aug'].toString();
          sep = snap['sep'].toString();
          oct = snap['oct'].toString();
          nov = snap['nov'].toString();
          dec = snap['dec'].toString();

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (sname != 'No Student')
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 50),
                      child: Container(
                        height: 170,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            onTap: () {

                            },
                            child: Material(
                              color: Colors.white,
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(25.0),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                            'Login Successful',
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              color: Colors.pinkAccent,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                            'to',
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              color: Colors.pinkAccent,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                            name,
                                            style: TextStyle(
                                              fontSize: 28.0,
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 50),
                      child: Container(
                        height: 170,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            onTap: () {

                            },
                            child: Material(
                              color: Colors.white,
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(25.0),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                            'Welcome',
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                            sname,
                                            style: TextStyle(
                                              fontSize: 30.0,
                                              color: Colors.teal[800],
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: Container(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => studenthome(uid:uid,name:sname,
                                      phone:phone,email:email,classname:classs,subjects:subjects,image:image
                                      ,password: password,

                                    s1:s1,
                                    s2:s2,
                                    s3:s3,
                                    s4:s4,
                                    s5:s5,
                                    s6:s6,
                                    s7:s7,
                                    s8:s8,

                                    t1:t1,
                                    t2:t2,
                                    t3:t3,
                                    t4:t4,
                                    t5:t5,
                                    t6:t6,
                                    t7:t7,
                                    t8:t8,

                                    jan :jan,
                                    feb: feb,
                                    mar: mar,
                                    apr: apr,
                                    may: may,
                                    jun: jun,
                                    jul: jul,
                                    aug: aug,
                                    sep: sep,
                                    oct: oct,
                                    nov: nov,
                                    dec: dec,

                                  )));
                            },
                            child: Material(
                              color: Colors.blue,
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(25.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        'Continue',
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              else
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => teacherlogin()));
                    },
                    child: Material(
                      color: Colors.white,
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(25.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Center(
                              child: Text(
                                'Invalid Password',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.pinkAccent,
                                  fontWeight: FontWeight.w700,
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
          );
        },
      ),
    );
  }
}
