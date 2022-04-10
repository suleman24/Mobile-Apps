import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class inputpage extends StatefulWidget {

  @override
  _inputpageState createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {
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
              Expanded(child: repeatcontainer(
                colors: Color(0xFF1D1E33),
                cardwidget: repeattextandicon(
                  iconData: FontAwesomeIcons.male,
                  label: 'Male',
                ),
              ) ),

              Expanded(child: repeatcontainer(
                colors: Color(0xFF1D1E33),

                cardwidget: repeattextandicon(
                  iconData: FontAwesomeIcons.female,
                  label: 'Female',
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

class repeattextandicon extends StatelessWidget {
  repeattextandicon({
    required this.iconData,required this.label
})
final IconData iconData;
final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(
          iconData,
          size: 85.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(label,style: TextStyle(fontSize: 18,),)
      ],
    );
  }
}

class repeatcontainer extends StatelessWidget {
  repeatcontainer({required this.colors,required this.cardwidget});
final Color colors;
final Widget cardwidget;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: cardwidget,
      decoration: BoxDecoration(
          color: Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(15.0)
      ),
    );
  }
}

