import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasbeeh/counter.dart';
import 'package:tasbeeh/tasbeeh.dart';
import 'package:tasbeeh/view.dart';
import 'home.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
        home:MyApp()
      )
      );
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
            duration: 4000,
            imageSize: 200,
            imageSrc: "images/bismillah.png",
            backgroundColor: Colors.blue[500],
            text: 'Pray to Allah',textStyle:TextStyle(fontSize: 30,color: Colors.amber[300]),
          ),
        )
    );
  }
}


