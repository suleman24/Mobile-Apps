import 'package:bmi/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

import 'container.dart';
import 'icontext.dart';
import 'constant.dart';
import 'result.dart';
import 'calculator.dart';


int minnum =1;
int maxnum=100;


int number = (minnum+Random().nextInt(maxnum - minnum));




void random(){
  number = (minnum+Random().nextInt(maxnum - minnum));
}


enum mode{
  easy,
  tough,
}

class inputpage extends StatefulWidget {



  @override
  _inputpageState createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {

  mode selectmode=mode.easy;

  double minn=1;
  double  maxx=100;






  int max=60;
  int min=40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guess Game'),
        centerTitle: true,
        backgroundColor: Color(0xFF111328),
      ),

      drawer: Drawer(
        backgroundColor: Color(0xFF111328),
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
          ],
        ),),


      body:  Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child:Row(
              children: <Widget>[
                Expanded(
                  child: repeatcontainer(
                    onpressed: (){
                      setState(() {
                        selectmode=mode.easy;
                        minn=1;
                        maxx=100;
                        maxnum=100;
                        random();
                      });
                    },
                    colors: selectmode == mode.easy?activecolor:deactivecolor,
                    cardwidget: repeattextandicon(
                      iconData: FontAwesomeIcons.faceSmile,
                      label: 'Easy\n\n1-100',
                    ),
                  ),
                ),

                Expanded(
                  child: repeatcontainer(
                    onpressed: (){
                      setState(() {
                        selectmode=mode.tough;
                        minn=1;
                        maxx=100;
                        maxnum=100;
                        random();

                      });
                    },
                    colors: selectmode == mode.tough?activecolor:deactivecolor,

                    cardwidget: repeattextandicon(
                      iconData: FontAwesomeIcons.faceSadCry,
                      label: 'Tough\n\n1-100',
                    ),

                  ),
                )

              ],
            )
            ),

            Expanded(child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: repeatcontainer(
                  colors: Color(0xFF1D1E33),


                  cardwidget:selectmode == mode.tough?null:
                              Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Guess the Number',style: mylabelstyle),




                      Slider(

                          value: number.toDouble(),

                          min: minn,
                          max: maxx,
                          activeColor: Color(0xFF12e3ff),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newvalue){
                            setState(() {
                            });
                          }
                      ),



                    ],
                  ),


                ) ),
              ],
            )
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: repeatcontainer(
                  colors: Color(0xFF1D1E33),
                  cardwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('MIN',style: mylabelstyle,),
                      Text('$min',style: mynumberstyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundicon(
                              iconData: FontAwesomeIcons.minus,
                              onpress: (){
                                setState(() {
                                  min--;
                                });
                              }
                          ),
                          SizedBox(width: 15.0),
                          roundicon(
                              iconData: FontAwesomeIcons.plus,
                              onpress: (){
                                setState(() {
                                  min++;
                                });
                              }
                          ),

                        ],
                      )
                    ],
                  ),
                )),
                Expanded(child: repeatcontainer(
                  colors: Color(0xFF1D1E33),
                  cardwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('MAX',style: mylabelstyle,),
                      Text('$max',style: mynumberstyle,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundicon(
                              iconData: FontAwesomeIcons.minus,
                              onpress: (){
                                setState(() {
                                  max--;
                                });
                              }
                          ),
                          SizedBox(width: 15.0),
                          roundicon(
                              iconData: FontAwesomeIcons.plus,
                              onpress: (){
                                setState(() {
                                max++;
                                });
                              }
                          ),

                        ],
                      )
                    ],
                  ),
                ) ),



              ],
            ),

            GestureDetector(
              onTap: (){
                calculator calc = calculator(num: number, max: max, min: min);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>result(
                  bmiresult: calc.calculate() ,text: calc.getresult(),interpretation: calc.getinterpretation(),
                )));
                random();
              },
              child: Container(
                child: Center(
                    child:
                    Text('Guess',style: mybuttonlstyle,))
                ,
                color: Color(0xFF7d0f32),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 70.0,
              ),
            ),

          ],
        ),
      ),


    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<mode>('selectmode', selectmode));
  }
}


class roundicon extends StatelessWidget {
  roundicon({required this.iconData,required this.onpress

  });

  final IconData iconData;
  final VoidCallback? onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onpress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 45,
        width: 45,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),


    );
  }
}

