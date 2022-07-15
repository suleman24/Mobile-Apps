import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manager/signup.dart';
import 'package:manager/teachers.dart';

import 'authentication.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'home.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:uuid/uuid.dart';



class addteacher extends StatefulWidget {
  const addteacher({Key? key,}) : super(key: key);

  @override
  _addteacherState createState() => _addteacherState();
}

class _addteacherState extends State<addteacher> {
  String imageUrl = "https://firebasestorage.googleapis.com/v0/b/academia-39c5c.appspot.com/o/test%2Fteacher.jpg?alt=media&token=aaed908f-3370-497c-8b43-2cb92d32eece";
  File? image;
  var path;
  var file;


  final picker = ImagePicker();

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();

    final imagePicker = ImagePicker();
    String imageFile;

    var uuid = Uuid();
    var image;
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image!.path);

      if (image != null){
        //Upload to Firebase
        var snapshot = await _storage.ref()
            .child('teacher/').child(Uuid().v1())
            .putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Path Received');
      }

    } else {
      print('Grant Permissions and try again');
    }




  }








Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedFile!.path);
    });







  }


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


  File? pickedimage=null;

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
        setState(() => {name= newValue.toString()})
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
        setState(() => {email= newValue.toString()})
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


  Future<void> addData(
      name,
      email,
      phone,
      password
      ) async {
    if (classvalue == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Select Class & Subject'),
      ));
    } else {
      final uid = AuthenticationHelper().getID();


      FirebaseFirestore.instance
          .collection("manager")
          .doc(uid)
          .collection('teachers')
          .add({
        "class":classname,
        "subject":subjectname,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "image" : imageUrl,

      });

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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => teachers(),
                      ),
                    );

                  },
                  child: Text("Ok"))
            ],
            content:
            Container(child: Text("Teacher Information Added")),
          ));
      classvalue = null;
      subjectvalue = null;
    }
  }
  @override
  Widget build(BuildContext context) {



    return  Scaffold(
      appBar: AppBar(
        title:Text('Add Teachers'),
      ),

      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.teal,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(55))
                          ),

                          child:
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 50,
                              child: ClipOval(
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    child: (imageUrl != null)
                                        ? Image.network(imageUrl)
                                        : null,

                                  )
                              ),

                            ),

                          ),

                      ),

                      Positioned(
                          top: 120,
                          left: 120,
                          child:
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.teal[400]
                            ),
                            child: IconButton(
                              icon: Icon(  Icons.camera_alt_rounded,size: 30,color: Colors.white,
                              ),
                              onPressed: () async{
                                // final pickedFile = await picker.getImage(source: ImageSource.gallery);
                                // setState(() {
                                //   image = File(pickedFile!.path);
                                // });






                                //
                                // final image =  await ImagePicker().pickImage(source: ImageSource.gallery);
                                //
                                // if(image==null) return;
                                //
                                // final imageTemporary = File(image.path);
                                //
                                // setState(() {
                                //   this.image =imageTemporary;
                                //
                                //   path = image.path;
                                //   final filename = image.name;
                                //
                                //   print(path);
                                //   print(filename);
                                //
                                //   print(":::::::::::::::::::::");

                                // });


                                // getImage();


                                uploadImage();
                              },
                            ),
                          )


                      )
                    ],
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
                    stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('classes').snapshots(),



                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return SnackBar(
                            content: Text(snapshot.error.toString()));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      List<DropdownMenuItem<String>> classitems = [];

                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        DocumentSnapshot snap = snapshot.data.docs[i];


                        if (!classitems.contains(snap.id)) {
                          classitems.add(DropdownMenuItem(
                            child: SizedBox(
                                width: 400, child: Text(snap['name'])),
                            value: snap.id.toString(),
                          ));
                        }


                      }




                      return DropdownButtonFormField(
                        isExpanded: true,
                        value: classvalue,
                        key: key1,
                        items: classitems,
                        onChanged: (newValue) {
                          setState(() async{
                            classvalue = newValue.toString();

                            print(classitems);
                            print('***********************************************************');
                            DocumentSnapshot variable = await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('classes').doc(classvalue).get();
                            var clname=variable.get('name');
                            print(clname.toString());
                            classname=clname.toString();
                            print('ok');


                          });

                        },
                      );
                    },
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Text('Select Subject'),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').snapshots(),



                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return SnackBar(
                            content: Text(snapshot.error.toString()));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      List<DropdownMenuItem<String>> subjectitems = [];

                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        DocumentSnapshot snap = snapshot.data.docs[i];


                        if (!subjectitems.contains(snap.id)) {
                          subjectitems.add(DropdownMenuItem(
                            child: SizedBox(
                                width: 400, child: Text(snap['name'])),
                            value: snap.id.toString(),
                          ));
                        }


                      }




                      return DropdownButtonFormField2(
                        isExpanded: true,
                        value: subjectvalue,
                        key: key1,
                        items: subjectitems,
                        onChanged: (newValue) {
                          setState(() async {
                            classvalue = newValue.toString();


                            print(subjectitems);
                            print('***********************************************************');
                            print(subjectvalue);
                            DocumentSnapshot variablee = await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').doc(classvalue).get();
                            var subname=variablee.get('name');
                            print(subname.toString());
                            subjectname=subname.toString();
                            print('ok');


                          });

                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    shape: StadiumBorder(),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () async {










                      if (_formkey.currentState!.validate()) {
                        addData(
                          name,
                          email,
                          phone,
                          password,
                        );

                        print("ok");
                        final uid=AuthenticationHelper().getID();






                      } else {
                        print("something wrong");
                      }
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
      ),
    );
  }


}







