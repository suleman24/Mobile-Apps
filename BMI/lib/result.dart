import 'package:bmi/constant.dart';
import 'package:bmi/container.dart';
import 'package:bmi/inputpage.dart';
import 'package:bmi/main.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'container.dart';

class result extends StatelessWidget {

  result({
    required this.bmiresult,required this.text,required this.interpretation
});

  final String bmiresult;
  final String text;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child:Container(
                child: Center(
                  child: Text('Result',style: titletextstyle,),
                ),
              )

          ),


          Expanded(
            flex: 5,
              child:Padding(
                padding: EdgeInsets.all(30.0),
                child: repeatcontainer(
                  colors: activecolor,
                  cardwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('$bmiresult',style: resulttextstyle,),
                      Text('$text',style: bmitextstyle,),
                      Text('$interpretation',style: bodytextstyle,),
                    ],
                  ),
                ),
              )

          ),

          Expanded(
              child:  GestureDetector(
                onTap: (){
                  Navigator.pop(context, MaterialPageRoute(builder: (context)=>inputpage()));

                },
                child: Container(
                  child: Center(
                      child:
                      Text('Recalculate',style: mybuttonlstyle,))
                  ,
                  color: Color(0xFFEB1555),
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: 80.0,
                ),
              ),

          )
        ],
      )
    );
  }
}
