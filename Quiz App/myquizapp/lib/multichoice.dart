
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'home.dart';
import 'multibank.dart';
import 'multiresult.dart';

MultiBrain abc=MultiBrain();




class MultiQuiz extends StatefulWidget {
  _MultiQuizState createState() => _MultiQuizState();
}


class _MultiQuizState extends State<MultiQuiz> {
  int t=0;
  int f=0;
  int _counter=10;

  int total=MultiBrain().count();
  int remaining=MultiBrain().count();

  Timer? _timer;
  void timerstart()
  {
    _counter=10;
    _timer=Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_counter>0)
        {
          _counter--;
        }
        else{
          if(abc.isFinished()==false)
          {
            _counter=10;
            abc.nextQuestion();
            scoreKeeper.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
            f++;
          }

        }
      });
    });
  }
  int remainingg(){
    remaining = remaining - t+f;
    return remaining;
  }

  List<Icon> scoreKeeper = [];

  void checkAnswer(String userAnswer) {
    String? questionAnswer = abc.getQuestionAnswer();
    setState(() {
      if (abc.isFinished() == true) {
        _timer?.cancel();
        f++;
        Alert(
          context: context,
          type: AlertType.success,

          title: "Finished",
          desc: "Right Answers : $t \nWrong Answers : $f",
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => myquiz()));

              },
              width: 120,
            )
          ],
        ).show();
        abc.reset();
        scoreKeeper = [];
      }else {
        if (questionAnswer == userAnswer) {
          t++;
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,

          ),);
        }
        else {
          f++;
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ),);
        }
        abc.nextQuestion();
        _counter=10;
      }
    });

  }

  @override
  void initState()
  {
    super.initState();
    timerstart();
    t=0;
    f=0;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Quiz'),
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
                tileColor: Colors.white,
                title: Text('Remaining Questions : $remaining ',style:TextStyle(fontSize: 20,color: Colors.blue,)),
                onTap:() {


                }),
            ListTile(
                tileColor: Colors.white,
                title: Text('Correct : $t ',style:TextStyle(fontSize: 20,color: Colors.blue,)),
                onTap:() {

                }),

            ListTile(
                tileColor: Colors.white,
                title: Text('Incorrect : $f',style:TextStyle(fontSize: 20,color: Colors.blue,)),
                onTap:() {

                }),
          ],

        ),),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(

                height:20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 70,
                    height:40,
                    child:  ElevatedButton(

                        style: ElevatedButton.styleFrom(
                            primary: Colors.red[500],
                            shadowColor: Colors.red[900]
                        ),

                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => multiresult(t:t,f:f)));

                        },
                        child: Text("Quit",style: TextStyle(color: Colors.white,fontSize: 15),)),
                  ),

                ],
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height:70,
                    child:  ElevatedButton(

                        style: ButtonStyle(
                            shape:MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: BorderSide(color:Colors.deepPurple),
                                )
                            )
                        ),
                        onPressed: () {

                        },
                        child: Text("$_counter",style: TextStyle(color: Colors.white,fontSize: 25),)),
                  ),

                ],
              ),

              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      abc.getQuestionText().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0,8,10.0,8),
                  child: FlatButton(
                    onPressed: () {
                      checkAnswer(abc.op1()!);
                    },
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      abc.op1()!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0,8,10.0,8),
                  child: FlatButton(
                    onPressed: () {
                      checkAnswer(abc.op2()!);
                    },
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      abc.op2()!,

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),




              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0,8,10.0,8),
                  child: FlatButton(
                    onPressed: () {
                      checkAnswer(abc.op3()!);
                    },
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      abc.op3()!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),










              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0,8,10.0,8),
                  child: FlatButton(
                    onPressed: () {
                      checkAnswer(abc.op4()!);
                    },
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      abc.op4()!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              ),
            ],
          ),
        ),
      ),

    );



  }
}