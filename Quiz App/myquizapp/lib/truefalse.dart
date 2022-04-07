import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myquizapp/QuestionBank.dart';
import 'package:myquizapp/home.dart';
import 'package:myquizapp/tfresult.dart';
import 'dart:async';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'main.dart';


class QuizPage extends StatefulWidget {
  _QuizPageState createState() => _QuizPageState();
}


class _QuizPageState extends State<QuizPage> {
  int t=0;
  int f=0;
  int total=QuestionBrain().count();
  int remaining=QuestionBrain().count();
  int _counter=10;
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
          if(questionBrain.count()==false)
          {
            remaining= remaining-1;
            _counter=10;
            questionBrain.nextQuestion();
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

  int rightans()
  {
    return t;
  }
  int remainingg(){
    remaining = remaining - t+f;
    return remaining;
  }

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    bool? questionAnswer = questionBrain.getQuestionAnswer();
    setState(() {
      if (questionBrain.isFinished() == true) {
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
        questionBrain.reset();
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
        questionBrain.nextQuestion();
        _counter=10;
      }
      remaining--;
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
                              MaterialPageRoute(builder: (context) => tfresult(t:t,f:f)));

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
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      questionBrain.getQuestionText().toString(),
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
                  padding: const EdgeInsets.fromLTRB(40.0,8,40.0,8),
                  child: FlatButton(
                    onPressed: () {
                      checkAnswer(true);
                    },
                    color: Colors.teal[700],
                    splashColor: Colors.teal[900],
                    highlightColor: Colors.teal[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      'True',
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
                  padding: const EdgeInsets.fromLTRB(40.0,8,40.0,8),
                  child: FlatButton(
                    onPressed: () {
                      checkAnswer(false);
                    },
                    color: Colors.red[800],
                    splashColor: Colors.red[700],
                    highlightColor: Colors.red[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      'False',
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