import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'authentication.dart';




class teachers extends StatefulWidget {
  @override
  _teachersState createState() => _teachersState();
}

class _teachersState extends State<teachers> {

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> _formkeyvalue = new GlobalKey<FormState>();

  final uid=AuthenticationHelper().getID();
  var classname = null;

  List<String> classes=['6th','7th','8th','9th','10th'];

  var subjectname = null;

  List<String> subject=['Chemistry','Biology','Computer','Maths','English'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teachers'),
        backgroundColor: Colors.blue[800],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Center(
            child: CircularProgressIndicator(),);

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

      floatingActionButton: FloatingActionButton(
        onPressed: () async{

          await showDialog(context: context, builder: (context)=> AlertDialog(
            title: Text('Enter Teacher Details',style: TextStyle(fontSize: 20,color: Colors.blue[700]),),
            content: SingleChildScrollView(
              child: Form(
                key: _formkeyvalue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: name,
                        textInputAction: TextInputAction.go,

                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.blueGrey
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.teal
                                )

                            ),

                            hintText: "Name"

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: phone,
                        textInputAction: TextInputAction.go,

                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.blueGrey
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.teal
                                )

                            ),

                            hintText: "Phone #"

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: email,
                        textInputAction: TextInputAction.go,

                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.blueGrey
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.teal
                                )

                            ),

                            hintText: "Email"

                        ),
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          value: classname,
                          items: classes.map((item)=> DropdownMenuItem<String>(
                            value: item,
                            child: Text('$item',style: TextStyle(fontSize: 12,fontFamily: 'Bold'),),
                          ))
                              .toList(),

                          onChanged:(item)=> setState(()=> classname=item!)
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          value: subjectname,
                          items: subject.map((item)=> DropdownMenuItem<String>(
                            value: item,
                            child: Text('$item',style: TextStyle(fontSize: 12,fontFamily: 'Bold'),),
                          ))
                              .toList(),

                          onChanged:(item)=> setState(()=> subjectname=item!)
                      ),
                    ),







                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: password,
                        textInputAction: TextInputAction.go,

                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.blueGrey
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.teal
                                )

                            ),

                            hintText: "password"

                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
            actions: <Widget>[
              new
              RaisedButton(
                shape: StadiumBorder(),
                textColor: Colors.white,
                color: Colors.blue,
                child: Text('Add'),
                onPressed: () {

                  final uid=AuthenticationHelper().getID();

                  FirebaseFirestore.instance.collection("manager").doc(uid).collection('teachers').add({'name': name.text,
                    'phone':phone.text,'email':email.text,'class':classname,'subject':subjectname,'password':password.text
                  });



                },
              ),



            ],
          ));
        },
        tooltip: 'Add Teacher',
        child: const Icon(Icons.add),
      ),
    );
  }


}
class CardList extends StatelessWidget {
  CardList({required this.snapshot,required this.index});
  final QuerySnapshot snapshot;
  final int index;


  @override
  Widget build(BuildContext context) {
    var docid=snapshot.docs[index].id;
    TextEditingController updatee = TextEditingController();
    return Card(
      elevation: 50,
      shadowColor: Colors.blue[800],
      color: Colors.white,
      child: Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,  // red as border color
              ),
              borderRadius: BorderRadius.all(Radius.circular(2))),
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Name',
                              style:
                              TextStyle(fontSize: 20, color: Colors.blue[900]),
                            ),
                            Text(
                              'Phone#',
                              style:
                              TextStyle(fontSize: 20, color: Colors.blue[900]),
                            ),
                            Text(
                              'Email',
                              style:
                              TextStyle(fontSize: 20, color: Colors.blue[900]),
                            ),
                            Text(
                              'Class',
                              style:
                              TextStyle(fontSize: 20, color: Colors.blue[900]),
                            ),
                            Text(
                              'Subject',
                              style:
                              TextStyle(fontSize: 20, color: Colors.blue[900]),
                            ),
                            Text(
                              'Password',
                              style:
                              TextStyle(fontSize: 20, color: Colors.blue[900]),
                            ),
                          ],
                        ),

                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              snapshot.docs[index]['name'],
                              style:
                              TextStyle(fontSize: 25, color: Colors.blue[900]),
                            ),
                            Text(
                              snapshot.docs[index]['phone'],
                              style:
                              TextStyle(fontSize: 15, color: Colors.blue[700]),
                            ),
                            Text(
                              snapshot.docs[index]['email'],
                              style:
                              TextStyle(fontSize: 15, color: Colors.blue[700]),
                            ),
                            Text(
                              snapshot.docs[index]['class'],
                              style:
                              TextStyle(fontSize: 20, color: Colors.blue[500]),
                            ),
                            Text(
                              snapshot.docs[index]['subject'],
                              style:
                              TextStyle(fontSize: 20, color: Colors.blue[500]),
                            ),
                            Text(
                              snapshot.docs[index]['password'],
                              style:
                              TextStyle(fontSize: 20, color: Colors.blue[500]),
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
                        SizedBox(
                          height: 100,
                          width: 50,

                          child: IconButton(
                            onPressed: () async{
                              var ref=FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers').doc(docid);
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

                          child:
                          IconButton(
                            onPressed:
                                () async{
                              await showDialog(context: context, builder: (context)=> AlertDialog(
                                title: Text('Enter new name of Teacher',style: TextStyle(fontSize: 20,color: Colors.deepPurple)),
                                content: TextField(
                                  controller: updatee,
                                  textInputAction: TextInputAction.go,

                                  decoration: InputDecoration(hintText: "Name"),
                                ),
                                actions: <Widget>[
                                  new
                                  RaisedButton(
                                    shape: StadiumBorder(),
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    child: Text('OK'),
                                    onPressed: () {
                                      FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers').doc(docid).update({
                                        'name':updatee.text,
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),



                                ],
                              ));
                            },
                            icon: Icon(FontAwesomeIcons.penToSquare),
                            color: Colors.teal,
                          ),




                        ),
                      ],
                    ),





                  ]))),
    );
  }


}