import 'package:bmi/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'container.dart';
import 'icontext.dart';

import 'constant.dart';
import 'result.dart';

import 'calculator.dart';

enum gender{
  male,
  female,
}

class inputpage extends StatefulWidget {



  @override
  _inputpageState createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {

  gender selectgender=gender.male;

  int height=180;
  int weight=60;
  int age=18;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        
      ),
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
                          selectgender=gender.male;
                        });
                      },
                      colors: selectgender == gender.male?activecolor:deactivecolor,
                      cardwidget: repeattextandicon(
                        iconData: FontAwesomeIcons.person,
                        label: 'Male',
                      ),
                    ),
                   ),

                  Expanded(
                    child: repeatcontainer(
                      onpressed: (){
                        setState(() {
                          selectgender=gender.female;
                        });
                      },
                      colors: selectgender == gender.female?activecolor:deactivecolor,

                      cardwidget: repeattextandicon(
                        iconData: FontAwesomeIcons.personDress,
                        label: 'Female',
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
                    cardwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Height',style: mylabelstyle),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('$height', style: mynumberstyle),
                            Text('cm',style: mylabelstyle,),
                          ],
                        ),

                        Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            activeColor: Color(0xFFEB1555),
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newvalue){
                              setState(() {
                                height = newvalue.round();
                              });
                            }
                        )
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
                        Text('Weight',style: mylabelstyle,),
                        Text('$weight',style: mynumberstyle,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundicon(
                                iconData: FontAwesomeIcons.minus,
                                onpress: (){
                                  setState(() {
                                    weight--;
                                  });
                                 }
                            ),
                            SizedBox(width: 15.0),
                            roundicon(
                                iconData: FontAwesomeIcons.plus,
                                onpress: (){
                                  setState(() {
                                    weight++;
                                  });
                                }
                            ),

                          ],
                        )
                      ],
                    ),
                  ) ),

                  Expanded(child: repeatcontainer(
                    colors: Color(0xFF1D1E33),
                    cardwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age',style: mylabelstyle,),
                        Text('$age',style: mynumberstyle,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundicon(
                                iconData: FontAwesomeIcons.minus,
                                onpress: (){
                                  setState(() {
                                    age--;
                                  });
                                }
                            ),
                            SizedBox(width: 15.0),
                            roundicon(
                                iconData: FontAwesomeIcons.plus,
                                onpress: (){
                                  setState(() {
                                    age++;
                                  });
                                }
                            ),

                          ],
                        )
                      ],
                    ),
                  ))

                ],
              ),

              GestureDetector(
                onTap: (){
                  calculator calc = calculator(height: height, weight: weight);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>result(
                    bmiresult: calc.calculate() ,text: calc.getresult(),interpretation: calc.getinterpretation(),
                  )));

                },
                child: Container(
                  child: Center(
                      child:
                      Text('Calculate',style: mybuttonlstyle,))
                  ,
                  color: Color(0xFFEB1555),
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
    properties.add(EnumProperty<gender>('selectgender', selectgender));
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

