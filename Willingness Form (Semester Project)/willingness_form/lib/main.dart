import 'package:flutter/material.dart';
import 'package:willingness_form/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_signup.dart';

void main(){


  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home:splashscreen()
      )
  );
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hello World'),
    );
  }
}




