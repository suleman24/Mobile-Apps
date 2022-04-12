import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'container.dart';
import 'icontext.dart';

const activecolor = Color(0xFF1D1E33);
const deactivecolor = Color(0xFF111328);

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        
      ),
      body: Column(
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
