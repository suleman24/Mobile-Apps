import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manager/searchstudent.dart';
import 'addstudent.dart';
import 'authentication.dart';

class students extends StatefulWidget {
  const students({
    Key? key,
  }) : super(key: key);

  @override
  _studentsState createState() => _studentsState();
}

class _studentsState extends State<students> {
  TextEditingController searchfield = TextEditingController();

  String search = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: searchfield,
                  decoration: InputDecoration(hintText: "Search Student"),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: () {
                  search = searchfield.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => searchstudent(search: search)));
                },
              ),
              SizedBox(
                width: 30,
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addstudent()));
        },
        tooltip: 'Add Student',
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('manager')
              .doc(AuthenticationHelper().getID())
              .collection('students').where('name',isNotEqualTo: 'No Student')
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
                    child: CardList(snapshot: snapshot.data, index: index),
                  );
                });
          },
        ),
      ),
    );
  }
}

class CardList extends StatefulWidget {
  CardList({required this.snapshot, required this.index});
  final QuerySnapshot snapshot;
  final int index;

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  var key1 = GlobalKey();
  String classname = "";
  String subjectname = "";
  String name = "";
  String email = "";
  String phone = "";

  String password = "";

  final cont1 = TextEditingController();
  final cont2 = TextEditingController();
  final cont3 = TextEditingController();
  final cont4 = TextEditingController();

  TextEditingController tclassname = TextEditingController();
  TextEditingController tsubjectname = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  var classvalue = null;
  var subjectvalue = null;

  Widget build_name() {
    return TextFormField(
      controller: cont1,
      decoration: InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Name is Required";
        } else {
          if (!ValidateName(value!)) {
            return "Correct the name format, e.g., Suleman Anwar";
          }
        }
      },
      onChanged: (newValue) => {
        setState(() => {name = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {name = newValue.toString()})
      },
    );
  }

  bool ValidateReg(String str) {
    bool flag = RegExp(r"^(FA|SP)[0-9][0-9]-(BCS|MCS|BSE)-[0-9][0-9][0-9]$")
        .hasMatch(str.toUpperCase());
    return flag;
  }

  // bool ValidateGitID(String str) {
  //   bool flag = RegExp(r"[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38}$")
  //       .hasMatch(str.toUpperCase());
  //   return flag;
  // }

  bool ValidateName(String str) {
    bool flag = RegExp(r"^([a-zA-Z',.-]+( [a-zA-Z',.-]+)*){1,30}")
        .hasMatch(str.toUpperCase());
    return flag;
  }

  Widget build_email() {
    return TextFormField(
      controller: cont2,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Email is required.";
        }
      },
      onChanged: (newValue) => {
        setState(() => {email = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {email = newValue.toString()})
      },
    );
  }

  Widget build_phone() {
    return TextFormField(
      controller: cont3,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Phone #',
        hintText: 'i.e 03088648424',
      ),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Phone number is required.";
        }
      },
      onChanged: (newValue) => {
        setState(() => {phone = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {phone = newValue.toString()})
      },
    );
  }

  Widget build_password() {
    return TextFormField(
      controller: cont4,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '*******',
      ),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Password is required.";
        }
      },
      onChanged: (newValue) => {
        setState(() => {password = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {password = newValue.toString()})
      },
    );
  }

  Future<void> addData(name, email, phone, password) async {
    if (classvalue == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Select Class & Subject'),
      ));
    } else {
      final uid = AuthenticationHelper().getID();

      var docid = widget.snapshot.docs[widget.index].id;

      FirebaseFirestore.instance
          .collection('manager')
          .doc(AuthenticationHelper().getID())
          .collection('students')
          .doc(docid)
          .update({
        "class": classname,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      });

      setState(() {
        name = "";
        email = "";
        phone = "";

        password = "";

        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('Your Information is Submitted'),
        // ));
        cont1.clear();
        cont2.clear();
        cont3.clear();
        cont4.clear();

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Done"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Ok"))
                  ],
                  content:
                      Container(child: Text("Student Information Updated")),
                ));
        classvalue = null;
        subjectvalue = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var docid = widget.snapshot.docs[widget.index].id;
    TextEditingController updatee = TextEditingController();
    return Card(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 50,
      shadowColor: Colors.blue[800],
      color: Colors.white,
      child: Container(
          height: 570,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue, // red as border color
              ),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50,
                    child: ClipOval(
                        child: Container(
                          height: 80,
                          width: 80,
                          child: (widget.snapshot.docs[widget.index]
                          ['image'] !=
                              null)
                              ? Image.network(widget
                              .snapshot.docs[widget.index]['image'])
                              : null,
                        )),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.blue[900]),
                                  ),
                                  Text(
                                    'Phone#',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.blue[900]),
                                  ),
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.blue[900]),
                                  ),
                                  Text(
                                    'Class',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.blue[900]),
                                  ),
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.blue[900]),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    widget.snapshot.docs[widget.index]['name'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.snapshot.docs[widget.index]['phone'],
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.blue[700]),
                                  ),
                                  Text(
                                    widget.snapshot.docs[widget.index]['email'],
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.blue[700]),
                                  ),
                                  Text(
                                    widget.snapshot.docs[widget.index]['class'],
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.blue[500]),
                                  ),
                                  Text(
                                    widget.snapshot.docs[widget.index]
                                        ['password'],
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.blue[500]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                            ],
                          ),
                        ]),
                  ),

                  Center(child: Text(
                    'Subjects  &  Teacher',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w900),
                  ),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Container(
                      height: 230,
                      width: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [



                          Column(
                            children: [
                              if (widget.snapshot.docs[widget.index]['s1'] != 'null')
                              Padding(
                                padding: const EdgeInsets.fromLTRB(50, 5, 5, 5),
                                child: Text(
                                  widget.snapshot.docs[widget.index]['s1'],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.blue[400]),
                                ),
                              ),
                              if (widget.snapshot.docs[widget.index]['s2'] != 'null')
                                Padding(
                                padding: const EdgeInsets.fromLTRB(50, 5, 5, 5),
                                child: Text(
                                  widget.snapshot.docs[widget.index]['s2'],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.blue[400]),
                                ),
                              ),
                              if (widget.snapshot.docs[widget.index]['s3'] != 'null')
                                Padding(
                                padding: const EdgeInsets.fromLTRB(50, 5, 5, 5),
                                child: Text(
                                  widget.snapshot.docs[widget.index]['s3'],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.blue[400]),
                                ),
                              ),
                              if (widget.snapshot.docs[widget.index]['s4'] != 'null')
                                Padding(
                                padding: const EdgeInsets.fromLTRB(50, 5, 5, 5),
                                child: Text(
                                  widget.snapshot.docs[widget.index]['s4'],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.blue[400]),
                                ),
                              ),
                              if (widget.snapshot.docs[widget.index]['s5'] != 'null')
                                Padding(
                                padding: const EdgeInsets.fromLTRB(50, 5, 5, 5),
                                child: Text(
                                  widget.snapshot.docs[widget.index]['s5'],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.blue[400]),
                                ),
                              ),
                              if (widget.snapshot.docs[widget.index]['s6'] != 'null')
                                Padding(
                                padding: const EdgeInsets.fromLTRB(50, 5, 5, 5),
                                child: Text(
                                  widget.snapshot.docs[widget.index]['s6'],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.blue[400]),
                                ),
                              ),

                              if (widget.snapshot.docs[widget.index]['s7'] != 'null')
                                Padding(
                                padding: const EdgeInsets.fromLTRB(50, 5, 5, 5),
                                child: Text(
                                  widget.snapshot.docs[widget.index]['s7'],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.blue[400]),
                                ),
                              ),
                              if (widget.snapshot.docs[widget.index]['s8'] != 'null')
                                Padding(
                                padding: const EdgeInsets.fromLTRB(50, 5, 5, 5),
                                child: Text(
                                  widget.snapshot.docs[widget.index]['s8'],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.blue[400]),
                                ),
                              ),
                            ],
                          ),


                          Column(

                            children: [
                              if (widget.snapshot.docs[widget.index]
                              ['t1'] !=
                                  'No Teacher')
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20, 5, 50, 5),
                                  child: Text(
                                    widget.snapshot.docs[widget.index]
                                    ['t1'],
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.blue[400]),
                                  ),
                                ),

                              if (widget.snapshot.docs[widget.index]
                              ['t2'] !=
                                  'No Teacher')
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20, 5, 50, 5),
                                  child: Text(
                                    widget.snapshot.docs[widget.index]
                                    ['t2'],
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.blue[400]),
                                  ),
                                ),

                              if (widget.snapshot.docs[widget.index]
                              ['t3'] !=
                                  'No Teacher')
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20, 5, 50, 5),
                                  child: Text(
                                    widget.snapshot.docs[widget.index]
                                    ['t3'],
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.blue[400]),
                                  ),
                                ),

                              if (widget.snapshot.docs[widget.index]
                              ['t4'] !=
                                  'No Teacher')
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20, 5, 50, 5),
                                  child: Text(
                                    widget.snapshot.docs[widget.index]
                                    ['t4'],
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.blue[400]),
                                  ),
                                ),

                              if (widget.snapshot.docs[widget.index]
                              ['t5'] !=
                                  'No Teacher')
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20, 5, 50, 5),
                                  child: Text(
                                    widget.snapshot.docs[widget.index]
                                    ['t5'],
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.blue[400]),
                                  ),
                                ),


                              if (widget.snapshot.docs[widget.index]
                              ['t6'] !=
                                  'No Teacher')
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20, 5, 50, 5),
                                  child: Text(
                                    widget.snapshot.docs[widget.index]
                                    ['t6'],
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.blue[400]),
                                  ),
                                ),


                              if (widget.snapshot.docs[widget.index]
                              ['t7'] !=
                                  'No Teacher')
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20, 5, 50, 5),
                                  child: Text(
                                    widget.snapshot.docs[widget.index]
                                    ['t7'],
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.blue[400]),
                                  ),
                                ),


                              if (widget.snapshot.docs[widget.index]
                              ['t8'] !=
                                  'No Teacher')
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20, 5, 50, 5),
                                  child: Text(
                                    widget.snapshot.docs[widget.index]
                                    ['t8'],
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.blue[400]),
                                  ),
                                ),


                            ],
                          )


                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.blue,
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      onPressed: () async {
                        var ref = FirebaseFirestore.instance
                            .collection('manager')
                            .doc(AuthenticationHelper().getID())
                            .collection('students')
                            .doc(docid);
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
                    child: IconButton(
                      onPressed: () async {
                        await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('Update Student Details',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.deepPurple)),
                                  content: Container(
                                    child: Form(
                                      key: _formkey,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            StreamBuilder(
                                              stream: FirebaseFirestore.instance
                                                  .collection('manager')
                                                  .doc(AuthenticationHelper()
                                                      .getID())
                                                  .collection('classes')
                                                  .snapshots(),
                                              builder: (context,
                                                  AsyncSnapshot snapshot) {
                                                if (snapshot.hasError) {
                                                  return SnackBar(
                                                      content: Text(snapshot
                                                          .error
                                                          .toString()));
                                                }
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return CircularProgressIndicator();
                                                }

                                                List<DropdownMenuItem<String>>
                                                    classitems = [];

                                                for (int i = 0;
                                                    i <
                                                        snapshot
                                                            .data!.docs.length;
                                                    i++) {
                                                  DocumentSnapshot snap =
                                                      snapshot.data.docs[i];

                                                  if (!classitems
                                                      .contains(snap.id)) {
                                                    classitems
                                                        .add(DropdownMenuItem(
                                                      child: SizedBox(
                                                          width: 400,
                                                          child: Text(
                                                              snap['name'])),
                                                      value: snap.id.toString(),
                                                    ));
                                                  }
                                                }

                                                return DropdownButton(
                                                  isExpanded: true,
                                                  value: classvalue,
                                                  key: key1,
                                                  items: classitems,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      classvalue =
                                                          newValue.toString();

                                                      print(classitems);
                                                      print(
                                                          '***********************************************************');
                                                    });
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              children: [
                                                build_name(),
                                                build_email(),
                                                build_phone(),
                                                build_password()
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text('Select Class'),
                                            StreamBuilder(
                                              stream: FirebaseFirestore.instance
                                                  .collection('manager')
                                                  .doc(AuthenticationHelper()
                                                      .getID())
                                                  .collection('classes')
                                                  .snapshots(),
                                              builder: (context,
                                                  AsyncSnapshot snapshot) {
                                                if (snapshot.hasError) {
                                                  return SnackBar(
                                                      content: Text(snapshot
                                                          .error
                                                          .toString()));
                                                }
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return CircularProgressIndicator();
                                                }

                                                List<DropdownMenuItem<String>>
                                                    classitems = [];

                                                for (int i = 0;
                                                    i <
                                                        snapshot
                                                            .data!.docs.length;
                                                    i++) {
                                                  DocumentSnapshot snap =
                                                      snapshot.data.docs[i];

                                                  if (!classitems
                                                      .contains(snap.id)) {
                                                    classitems
                                                        .add(DropdownMenuItem(
                                                      child: SizedBox(
                                                          width: 400,
                                                          child: Text(
                                                              snap['name'])),
                                                      value: snap.id.toString(),
                                                    ));
                                                  }
                                                }

                                                return DropdownButton(
                                                  isExpanded: true,
                                                  value: classvalue,
                                                  key: key1,
                                                  items: classitems,
                                                  onChanged: (newValue) {
                                                    setState(() async {
                                                      classvalue =
                                                          newValue.toString();

                                                      print(classitems);
                                                      print(
                                                          '***********************************************************');
                                                      DocumentSnapshot
                                                          variable =
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'manager')
                                                              .doc(
                                                                  AuthenticationHelper()
                                                                      .getID())
                                                              .collection(
                                                                  'classes')
                                                              .doc(classvalue)
                                                              .get();
                                                      var clname =
                                                          variable.get('name');
                                                      print(clname.toString());
                                                      classname =
                                                          clname.toString();
                                                      print('ok');
                                                    });
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            RaisedButton(
                                              shape: StadiumBorder(),
                                              textColor: Colors.white,
                                              color: Colors.blue,
                                              onPressed: () async {
                                                if (_formkey.currentState!
                                                    .validate()) {
                                                  addData(
                                                    name,
                                                    email,
                                                    phone,
                                                    password,
                                                  );

                                                  print("ok");
                                                  final uid =
                                                      AuthenticationHelper()
                                                          .getID();
                                                } else {
                                                  print("something wrong");
                                                }
                                              },
                                              child: Center(
                                                child: Text(
                                                  'Update',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                      },
                      icon: Icon(FontAwesomeIcons.penToSquare),
                      color: Colors.teal,
                    ),
                  ),
                ],
              )
            ],
          ))),
    );
  }
}
