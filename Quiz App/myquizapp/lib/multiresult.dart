import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myquizapp/home.dart';
import 'package:myquizapp/multibank.dart';
import 'dart:async';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'main.dart';
import 'multichoice.dart';


class multiresult extends StatelessWidget { multiresult({required this.t,required this.f});

final int t;
final int f;


int q=MultiBrain().count();


@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home:SafeArea(
        child:Scaffold(
          appBar:AppBar(
            title: Text ('Result'),
            centerTitle: true,
          ),

          body:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              SizedBox(
                height: 20,
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(60.0,8,60.0,8),
                  child: FlatButton(
                      height: 30,
                      onPressed: () {
                      },
                      color: Colors.blue[400],


                      child: Text("Total Questions : 10",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Bold'),)),

                ),
              ),

              SizedBox(
                height: 70,
              ),




              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40.0,15,40.0,15),
                  child: FlatButton(
                      onPressed: () {
                      },
                      color: Colors.teal[400],
                      splashColor: Colors.teal[500],
                      highlightColor: Colors.teal[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text("Right Answers : $t",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Bold'),)),

                ),
              ),





              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40.0,20,40.0,20),
                  child: FlatButton(
                      onPressed: () {
                      },
                      color: Colors.redAccent[400],
                      splashColor: Colors.red[500],
                      highlightColor: Colors.red[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text("Wrong : $f",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Bold'),)),

                ),
              ),
              SizedBox(
                height: 70,
              ),


              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100.0,8,100.0,8),
                  child: FlatButton(
                      height: 40,
                      onPressed: () {

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => myquiz()));

                      },
                      color: Colors.indigoAccent,

                      child: Text(" Home ",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Bold'),)),

                ),
              ),
              SizedBox(
                height: 70,
              ),

            ],
          ),
        )
    ),
  );

}
}