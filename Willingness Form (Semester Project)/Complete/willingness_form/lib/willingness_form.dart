import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:willingness_form/view.dart';
import '../constants/constant.dart';


class willingness_form extends StatefulWidget {
  const willingness_form({Key? key}) : super(key: key);

  @override
  _willingness_formState createState() => _willingness_formState();
}

class _willingness_formState extends State<willingness_form> {
  var key1 = GlobalKey();
  String project = "";
  String _student_one_name = "";
  String _student_one_github = "";
  String _student_one_reg = "";

  String _student_two_name = "";
  String _student_two_github = "";
  String _student_two_reg = "";

  String _supervisor_name = "";
  String _supervisor_github = "";
  final cont1 = TextEditingController();
  final cont2 = TextEditingController();
  final cont3 = TextEditingController();
  final cont4 = TextEditingController();
  final cont5 = TextEditingController();
  final cont6 = TextEditingController();
  final cont7 = TextEditingController();
  final cont8 = TextEditingController();
  TextEditingController projectname = TextEditingController();
  bool _secnd_name = false;
  bool _secnd_reg = false;
  bool _secnd_Git = false;


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  var _selectedValue = null;

  Widget _build_student_one_name() {
    return TextFormField(
      controller: cont1,
      decoration: InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Student name is required.";
        } else {
          if (!ValidateName(value!)) {
            return "Correct the name format, e.g., Suleman Anwar";
          }
        }
      },
      onChanged: (newValue) => {
        setState(() => {_student_one_name = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {_student_one_name = newValue.toString()})
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

  Widget _build_student_one_github() {
    return TextFormField(
      controller: cont2,
      decoration: InputDecoration(labelText: 'GitHub ID'),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "GitHub ID is required.";
        }
      },
      onChanged: (newValue) => {
        setState(() => {_student_one_github = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {_student_one_github = newValue.toString()})
      },
    );
  }

  Widget _build_student_one_reg() {
    return TextFormField(
      controller: cont3,
      decoration: InputDecoration(
        labelText: 'Registration No.',
        hintText: 'i.e FA19-BCS-061',
      ),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Registration no. is required.";
        } else {
          if (!ValidateReg(value!)) {
            return "Correct the registration format, e.g., FA19-BCS-061";
          }
        }
      },
      onChanged: (newValue) => {
        setState(() => {_student_one_reg = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {_student_one_reg = newValue.toString()})
      },
    );
  }

  Widget _build_student_two_name() {
    return TextFormField(
      controller: cont4,
      decoration: InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (_secnd_name || _secnd_Git || _secnd_reg) {
          if (value.toString().isEmpty) {
            return "Student name is required.";
          } else {
            if (!ValidateName(value!)) {
              return "Correct the name format, e.g., Suleman Anwar";
            }
          }
        }
      },
      onChanged: (newValue) => {
        if (newValue == "") {_secnd_name = false} else {_secnd_name = true},
        setState(() => {_student_two_name = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {_student_two_name = newValue.toString()})
      },
    );
  }

  Widget _build_student_two_github() {
    return TextFormField(
      controller: cont5,
      decoration: InputDecoration(labelText: 'GitHub ID'),
      validator: (value) {
        if (_secnd_name || _secnd_Git || _secnd_reg) {
          if (value.toString().isEmpty) {
            return "GitHub ID is required.";
          }
        }
      },
      onChanged: (newValue) => {
        if (newValue == "") {_secnd_Git = false} else {_secnd_Git = true},
        setState(() => {_student_two_github = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {_student_two_github = newValue.toString()})
      },
    );
  }

  Widget _build_student_two_reg() {
    return TextFormField(
      controller: cont6,
      decoration: InputDecoration(
        labelText: 'Registration No.',
        hintText: 'i.e FA19-BCS-061',
      ),
      validator: (value) {
        if (_secnd_name || _secnd_Git || _secnd_reg) {
          if (value.toString().isEmpty) {
            return "Registration no. is required.";
          }
          if (value!.isNotEmpty) {
            if (!ValidateReg(value)) {
              return "Correct the registration format, e.g., FA19-BCS-061";
            }
          }
        }
      },
      onChanged: (newValue) => {
        if (newValue == "") {_secnd_reg = false} else {_secnd_reg = true},
        setState(() => {_student_two_reg = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {_student_two_reg = newValue.toString()})
      },
    );
  }

  Widget _build_supervisor_name() {
    return TextFormField(
      controller: cont7,
      decoration: InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Supervisor name is required.";
        } else {
          if (!ValidateName(value!)) {
            return "Correct the name format, e.g., M Abdullah";
          }
        }
      },
      onChanged: (newValue) => {
        setState(() => {_supervisor_name = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {_supervisor_name = newValue.toString()})
      },
    );
  }

  Widget _build_supervisor_github() {
    return TextFormField(
      controller: cont8,
      decoration: InputDecoration(labelText: 'GitHub ID'),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "GitHub ID is required.";
        }
      },
      onChanged: (newValue) => {
        setState(() => {
          _supervisor_github = newValue.toString(),
        })
      },
      onSaved: (newValue) => {
        setState(() => {_supervisor_github = newValue.toString()})
      },
    );
  }

  Stream _projects =
  FirebaseFirestore.instance.collection("projects").snapshots();

  Future<void> addData(
      _student_one_name,
      _student_one_github,
      _student_one_reg,
      _student_two_name,
      _student_two_github,
      _student_two_reg,
      _supervisor_name,
      _supervisor_github) async {
    if (_selectedValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Select Your Project To Submit'),
      ));
    } else {
      
      FirebaseFirestore.instance
          .collection("semesterproject")
          .doc(aJw55p2s1udv0Jvjz8ZrGK1UyJI3)
          .collection('willingness_form')
          .add({
        "project":project,
        "s1name": _student_one_name,
        "s1reg": _student_one_reg,
        "s1github": _student_one_github,
        "s2name": _student_two_name,
        "s2reg": _student_two_reg,
        "s2github": _student_two_github,

        "supervisorname": _supervisor_name,
        "supervisorgithub": _supervisor_github,
      });

      CollectionReference proj =
      FirebaseFirestore.instance.collection('projects');
      dynamic value = _selectedValue;
      _selectedValue = null;
      proj.doc(value).set({
        "status": true,
      },
          SetOptions(merge: true)).then((value) {
        setState(() {
          _student_one_name = "";
          _student_one_github = "";
          _student_one_reg = "";

          _student_two_name = "";
          _student_two_github = "";
          _student_two_reg = "";

          _supervisor_name = "";
          _supervisor_github = "";
 
          cont1.clear();
          cont2.clear();
          cont3.clear();
          cont4.clear();
          cont5.clear();
          cont6.clear();
          cont7.clear();
          cont8.clear();

          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Recorded"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => view()),
                        );
                      },
                      child: Text("Ok"))
                ],
                content:
                Container(child: Text("FYP Information is Recorded!")),
              ));
          _selectedValue = null;
        });
      }).catchError((Error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(Error.toString()),
        ));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Center(child: Text('Supervisor Willingness Form')),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  shape: StadiumBorder(),
                  textColor: Colors.white,
                  color: Colors.pinkAccent,
                  child: Text(
                    'View',
                    style: TextStyle(fontSize: 10),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => view()),
                    );
                  }),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [



                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('projects')
                        .snapshots(),


                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return SnackBar(
                            content: Text(snapshot.error.toString()));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      List<DropdownMenuItem<String>> projectItems = [];

                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        DocumentSnapshot snap = snapshot.data.docs[i];
                        if (snap['status'] == "false") {
                              if (!projectItems.contains(snap.id)) {
                                projectItems.add(DropdownMenuItem(
                                  child: SizedBox(
                                      width: 400, child: Text(snap['title'])),
                                  value: snap.id.toString(),
                                ));
                              }
                            

                        }
                      }


                      List projectsss = [];

                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        DocumentSnapshot snap = snapshot.data.docs[i];
                        print(snap['title']);
                        if (snap['status'] == "false" ) {

                          if(snap['title'].toString().toLowerCase().contains(projecttitle.toLowerCase())){
                            if (!projectsss.contains(snap.id)) {

                              projectsss.add(snap['title']);
                            }
                        }}
                      }


                      return DropdownButton(
                        isExpanded: true,
                        value: _selectedValue,
                        key: key1,
                        items: projectItems,
                        onChanged: (newValue) {
                          setState((){
                            _selectedValue = newValue.toString();
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
                      Text("Student 1 Information",
                          style: Constant.boldRegularHeadings),
                      _build_student_one_name(),
                      _build_student_one_github(),
                      _build_student_one_reg(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "Student 2 Information",
                        style: Constant.boldRegularHeadings,
                      ),
                      _build_student_two_name(),
                      _build_student_two_github(),
                      _build_student_two_reg(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "Supervisor Information",
                        style: Constant.boldRegularHeadings,
                      ),
                      _build_supervisor_name(),
                      _build_supervisor_github(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      color: Colors.indigo,
                      onPressed: () async {
                        await data();



                        if (_formkey.currentState!.validate()) {
                          addData(
                              _student_one_name,
                              _student_one_github,
                              _student_one_reg,
                              _student_two_name,
                              _student_two_github,
                              _student_two_reg,
                              _supervisor_name,
                              _supervisor_github);

                      }},
                      
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void>data()async{
    print(_selectedValue);
    DocumentSnapshot variable = await FirebaseFirestore.instance.collection('projects').doc(_selectedValue).get();
    var title=variable.get('title');
    print(title.toString());

    project=title.toString();

    print('ok');

  }

}
