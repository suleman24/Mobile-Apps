import 'package:bmi/constant.dart';
import 'package:bmi/container.dart';
import 'package:bmi/inputpage.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'container.dart';

class result extends StatelessWidget {

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
              child:repeatcontainer(
                colors: activecolor,
                cardwidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Normal',style: resulttextstyle,),
                    Text('18.3',style: bmitextstyle,),
                    Text('BMI is low',style: bodytextstyle,),
                  ],
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
