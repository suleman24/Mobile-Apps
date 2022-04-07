import 'package:flutter/material.dart';
import 'package:myquizapp/QuestionBank.dart';
import 'package:myquizapp/home.dart';

import 'package:flutter/rendering.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'multichoice.dart';

QuestionBrain questionBrain = QuestionBrain();

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:myapp(),
  ));
}



class myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          body:
          SplashScreenView(
            navigateRoute: myquiz(),
            duration: 6000,
            imageSize: 200,
            imageSrc: "images/icon.png",
            backgroundColor: Colors.blue[500],
            text: 'Take a Quiz',textStyle:TextStyle(fontSize: 30,color: Colors.amber[300]),
          ),
        )
    );
  }
}





















class about extends StatefulWidget {

  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("About"),
        centerTitle: true,
        actions:<Widget>[CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20.0,
          backgroundImage: AssetImage('images/me.png'),
        ),],
      ),

      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              child:
              Column(
                children: [

                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    backgroundImage: AssetImage('images/me.png'),
                  ),


                  Text('Suleman Anwar', style:TextStyle(fontSize: 20,color: Colors.white,)),
                  Text('FA19-BCS-061',style:TextStyle(fontSize: 20,color: Colors.white,)),


                ],),),

            ListTile(
                hoverColor: Colors.indigo,
                title: Text('Home',style:TextStyle(fontSize: 20,color: Colors.white,)),
                onTap:() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => myquiz()));

                }),

            ListTile(
                hoverColor: Colors.indigo,
                title: Text('True/False',style:TextStyle(fontSize: 20,color: Colors.white,)),
                onTap:() {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>MultiQuiz()));

                }),
            ListTile(
                hoverColor: Colors.indigo,
                title: Text('Multiple Choice',style:TextStyle(fontSize: 20,color: Colors.white,)),
                onTap:() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MultiQuiz()));

                }),

            ListTile(
                hoverColor: Colors.indigo,
                title: Text('About',style:TextStyle(fontSize: 20,color: Colors.white,)),
                onTap:() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => about()));

                }),
          ],

        ),),

      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70.0,
                backgroundImage: AssetImage('images/me.png'),
              ),
              Text(
                'Suleman Anwar',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Card(
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.location_city,
                      color: Colors.cyan,
                    ),
                    title: Text(
                      '24/WB Vehari, Punjab, Pakistan',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 20.0,
                      ),
                    ),
                  )),
              Card(
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.cyan,
                    ),
                    title: Text(
                      '+92 308 8648424',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 20.0,
                      ),
                    ),
                  )),
              Card(
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.cyan,
                    ),
                    title: Text(
                      'suleman.anwar.424@gmail.com',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.cyan,
                      ),
                    ),
                  ))
            ],
          )),


    );

  }
}

