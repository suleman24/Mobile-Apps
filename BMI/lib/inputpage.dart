import 'package:bmi/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'container.dart';
import 'icontext.dart';

import 'constant.dart';


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

  int sliderheight=180;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        
      ),
      body: Column(
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
                    iconData: FontAwesomeIcons.male,
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
                    iconData: FontAwesomeIcons.female,
                    label: 'Female',
                  ),

                ),
              )

            ],
          )
          ),

          Expanded(child:Row(
            children: <Widget>[
              Expanded(child: repeatcontainer(
                colors: Color(0xFF1D1E33),
                cardwidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height',style: mylabelstyle),

                    Row(
                      children: [
                        Text('$sliderheight', style: mynumberstyle),
                        Text('cm',style: mylabelstyle,),
                      ],
                    ),

                    Slider(
                        value: sliderheight.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newvalue){
                          setState(() {
                            sliderheight = newvalue.round();
                          });
                        }
                    )
                  ],
                ),
              ) ),
            ],
          )
          ),



          Expanded(child:Row(
            children: <Widget>[
              Expanded(child: repeatcontainer(
                colors: Color(0xFF1D1E33),
              ) ),

              Expanded(child: repeatcontainer(
                colors: Color(0xFF1D1E33),

              ))

            ],
          )
          ),



        ],
      ),

    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<gender>('selectgender', selectgender));
  }
}
