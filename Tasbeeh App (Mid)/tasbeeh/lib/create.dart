import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tasbeeh.dart';

class create extends StatefulWidget {
  @override
  _createState createState() => _createState();
}

class _createState extends State<create> {
  TextEditingController tname = TextEditingController();
  TextEditingController tcount = TextEditingController();

  var name;
  var count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Tasbeeh'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

                  TextField(
                    controller: tname,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.blue
                          )
                        ),
                        labelText: "Name of Tasbeeh"
                    ),
                  ),



                    TextField(
                      controller: tcount,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3,
                                  color: Colors.blue
                              )
                          ),
                          labelText: "How many times?"

                      ),
                    ),


                   RaisedButton(
                       textColor: Colors.white,
                       color: Colors.blue,
                       child: Text('Create'),
                       onPressed:(){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => tasbeeh()));
                         setState(() {
                           name=tname;
                           count=tcount;
                         });
                       }
                   )



            ],
          ),
        ),
      ),
    );
  }
}
