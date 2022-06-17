import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'dart:math';

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
            navigateRoute: ludo(),
            duration: 10000,
            imageSize: 200,
            imageSrc: "images/dice.png",
            backgroundColor: Colors.cyan,
            text: 'Welcome',textStyle:TextStyle(fontSize: 30,color: Colors.amberAccent),
          ),
        )
    );
  }
}
class ludo extends StatefulWidget {


  @override
  _ludoState createState() => _ludoState();
}

class _ludoState extends State<ludo> {
  int d1=1;
  int d2=1;
  int d3=1;
  int d4=1;


  int p1=0;
  int p2=0;
  int p3=0;
  int p4=0;




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text('Dice Roll Game'),
          centerTitle: true,
          actions:<Widget>[CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20.0,
            backgroundImage: AssetImage('images/me.png'),

          ),],

        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column( children: [

                Expanded(
                  child: TextButton(

                    onPressed: () {  },
                    child: Text('Player 1 \n Score : $p1',style: TextStyle(fontSize: 20,color: Colors.white,)),
                  ),
                ),


                Expanded(
                    child: Row(children: [Expanded(
                      child:TextButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                        child: Image.asset('images/dice$d1.png',
                        ),


                        onPressed: () {
                          if(p2<30&&p3<30&&p4<30) {
                            setState(() {
                              d1 = Random().nextInt(6) + 1;
                              if (p1 + d1 <= 30) {
                                p1 = p1 + d1;
                                if(p1==30)
                                {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        title: Text("Winner"),
                                        content: Text("Player 1 is the winner and the score is 30"),
                                      );
                                    },

                                  );
                                };
                              };
                            });
                            print(d1);
                          };

                        },
                      ),
                    )],)

                ),





                Expanded(
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('Player 2 \n Score : $p2',style: TextStyle(fontSize: 20,color: Colors.white)),
                  ),
                ),



                Expanded(
                    child: Row(children: [Expanded(
                      child:TextButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                        child: Image.asset('images/dice$d2.png',
                        ),


                        onPressed: () {
                          if(p1<30&&p3<30&&p4<30) {
                            setState(() {
                              d2 = Random().nextInt(6) + 1;
                              if (p2 + d2 <= 30) {
                                p2 = p2 + d2;
                                if(p2==30)
                                {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        title: Text("Winner"),
                                        content: Text("Player 2 is the winner and the score is 30"),
                                      );
                                    },

                                  );
                                };
                              };
                            });
                            print(d1);
                          };

                        },
                      ),
                    )],)

                ),

              ]
              ),
            ),


            SizedBox(width:20),
















            Expanded(
              child: Column( children: [

                Expanded(
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('Player 3 \n Score : $p3',style: TextStyle(fontSize: 20,color: Colors.white)),
                  ),
                ),


                Expanded(
                    child: Row(children: [Expanded(
                      child:TextButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow)),
                        child: Image.asset('images/dice$d3.png',
                        ),

                        onPressed: () {
                          if(p2<30&&p1<30&&p4<30) {
                            setState(() {
                              d3 = Random().nextInt(6) + 1;
                              if (p3 + d3 <= 30) {
                                p3 = p3 + d3;
                                if(p3==30)
                                {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        title: Text("Winner"),
                                        content: Text("Player 3 is the winner and the score is 30"),
                                      );
                                    },

                                  );
                                };
                              };
                            });
                            print(d3);
                          };},
                      ),
                    )],)

                ),





                Expanded(
                  child: TextButton(
                    onPressed: () {  },
                    child: Text('Player 4 \n Score : $p4',style: TextStyle(fontSize: 20,color: Colors.white)),
                  ),
                ),



                Expanded(
                    child: Row(children: [Expanded(
                      child:TextButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                        child: Image.asset('images/dice$d4.png',
                        ),


                        onPressed: () {
                          if(p2<30&&p3<30&&p1<30) {
                            setState(() {
                              d4 = Random().nextInt(6) + 1;
                              if (p4 + d4 <= 30) {
                                p4 = p4 + d4;
                                if(p4==30)
                                {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        title: Text("Winner"),
                                        content: Text("Player 4 is the winner and the score is 30"),
                                      );
                                    },

                                  );
                                };
                              };
                            });
                            print(d1);
                          };

                        },
                      ),
                    )],)

                ),

              ]
              ),
            ),

          ],
        ),
      ),
    );
    return Container();
  }
}

