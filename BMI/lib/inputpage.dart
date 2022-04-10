import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'container.dart';
import 'icontext.dart';

const activecolor = Color(0xFF1D1E33);
const deactivecolor = Color(0xFF111328);



class inputpage extends StatefulWidget {



  @override
  _inputpageState createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {
  Color malecolor = deactivecolor;
  Color femalecolor = deactivecolor;

  void updatecolor(int gender)
  {
    if(gender==1)
    {
      Color malecolor = activecolor;
      Color femalecolor = deactivecolor;
    }
    if(gender==2)
    {
      Color malecolor = deactivecolor;
      Color femalecolor = activecolor;
    }
  }


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
              Expanded(child: GestureDetector(
                onTap: ()
                {
                  setState(() {
                    updatecolor(1);
                  });
                },
                child: repeatcontainer(
                  colors: malecolor,
                  cardwidget: repeattextandicon(
                    iconData: FontAwesomeIcons.male,
                    label: 'Male',
                  ),
                ),
              ) ),

              Expanded(child: GestureDetector(
                onTap: ()
                {
                  setState(() {
                    updatecolor(2);
                  });
                },
                child: repeatcontainer(
                  colors: femalecolor,

                  cardwidget: repeattextandicon(
                    iconData: FontAwesomeIcons.female,
                    label: 'Female',
                  ),

                ),
              ))

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
}
