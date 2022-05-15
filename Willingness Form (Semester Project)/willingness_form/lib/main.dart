import 'package:flutter/material.dart';
import 'package:willingness_form/splashscreen.dart';

void main() {
  runApp( splashscreen());
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




