import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'inputpage.dart';

void main() {
  runApp(myapp());
}


class myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          body:
          SplashScreenView(
            navigateRoute: guessingnumber(),
            duration: 3000,
            imageSize: 200,
            imageSrc: "images/guess.png",
            backgroundColor: Color(0xFF111328),
            text: 'Guess the number',textStyle:TextStyle(fontSize: 30,color: Colors.amber[300]),
          ),
        )
    );
  }
}



class guessingnumber extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: inputpage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    );
  }
}






