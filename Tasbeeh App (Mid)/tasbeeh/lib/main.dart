import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          body:
          SplashScreenView(
            navigateRoute: home(),
            duration: 1000,
            // imageSize: 200,
            // imageSrc: "images/icon.png",
            backgroundColor: Colors.blue[500],
            text: 'Pray to Allah',textStyle:TextStyle(fontSize: 30,color: Colors.amber[300]),
          ),
        )
    );
  }
}


