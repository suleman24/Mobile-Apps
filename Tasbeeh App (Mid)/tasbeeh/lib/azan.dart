import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class azan extends StatefulWidget {
  const azan({Key? key}) : super(key: key);

  @override
  State<azan> createState() => _azanState();
}

class _azanState extends State<azan> {
  late String _timeString;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedDateTime =
    DateFormat('kk:mm:ss').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
      print(_timeString);
    });
  }

  bool fajr = false;
  bool zuhr = false;
  bool asar = false;
  bool magrib = false;
  bool esha = false;



  var textValue = 'Switch is OFF';

  void fajrswitch(bool value) {

    if(fajr == false)
    {
      setState(() {
        fajr = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        fajr = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
  void zuhrswitch(bool value) {

    if(zuhr == false)
    {
      setState(() {
        zuhr = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        zuhr = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
  void asarswitch(bool value) {

    if(asar == false)
    {
      setState(() {
        asar = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        asar = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
  void magribswitch(bool value) {

    if(magrib == false)
    {
      setState(() {
        magrib = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        magrib = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
  void eshaswitch(bool value) {

    if(esha == false)
    {
      setState(() {
        esha = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        esha = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }






  TimeOfDay fajrtime = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay zuhrtime = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay asartime = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay magribtime = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay eshatime = TimeOfDay(hour: 7, minute: 15);


  void _selectfajrTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: fajrtime,
    );
    if (newTime != null) {
      setState(() {
        fajrtime = newTime;
      });
    }
  }
  void _selectzuhrTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: zuhrtime,
    );
    if (newTime != null) {
      setState(() {
        zuhrtime = newTime;
      });
    }
  }
  void _selectasarTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: asartime,
    );
    if (newTime != null) {
      setState(() {
        asartime = newTime;
      });
    }
  }

  void _selectmagribTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: magribtime,
    );
    if (newTime != null) {
      setState(() {
        magribtime = newTime;
      });
    }
  }
  void _selecteshaTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: eshatime,
    );
    if (newTime != null) {
      setState(() {
        eshatime = newTime;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Alarm'),
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  height: 140,
                  width: 140,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.0,
                    backgroundImage: AssetImage('images/mosque.png'),

                  ),

                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Column(
            children: [
              Center(

                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: (){},
                  shape: StadiumBorder(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Time : ',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            _timeString.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white

                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),

              ),
            ],
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),),
                side: BorderSide(width: 3, color: Colors.blue)),
            elevation: 50,
            shadowColor: Colors.blue[800],
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Fajr', style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: _selectfajrTime,
                        child: Text(' ${fajrtime.format(context)}'),
                      ),

                    ],
                  ),
                  Container(
                    child: Switch(
                      onChanged: fajrswitch,
                      value: fajr,
                      activeColor: Colors.blue[700],
                      activeTrackColor: Colors.blue[400],
                      inactiveThumbColor: Colors.white54,
                      inactiveTrackColor: Colors.black12,
                    ),
                  )

                ],
              ), //Column
            ), //SizedBox
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),),
                side: BorderSide(width: 3, color: Colors.blue)),
            elevation: 50,
            shadowColor: Colors.blue[800],
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Zuhr', style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: _selectzuhrTime,
                        child: Text(' ${zuhrtime.format(context)}'),
                      ),

                    ],
                  ),
                  Container(
                    child: Switch(
                      onChanged: zuhrswitch,
                      value: zuhr,
                      activeColor: Colors.blue[700],
                      activeTrackColor: Colors.blue[400],
                      inactiveThumbColor: Colors.white54,
                      inactiveTrackColor: Colors.black12,
                    ),
                  )

                ],
              ), //Column
            ), //SizedBox
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),),
                side: BorderSide(width: 3, color: Colors.blue)),
            elevation: 50,
            shadowColor: Colors.blue[800],
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Asar', style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: _selectasarTime,
                        child: Text(' ${asartime.format(context)}'),
                      ),

                    ],
                  ),
                  Container(
                    child: Switch(
                      onChanged: asarswitch,
                      value: asar,
                      activeColor: Colors.blue[700],
                      activeTrackColor: Colors.blue[400],
                      inactiveThumbColor: Colors.white54,
                      inactiveTrackColor: Colors.black12,
                    ),
                  )

                ],
              ), //Column
            ), //SizedBox
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),),
                side: BorderSide(width: 3, color: Colors.blue)),
            elevation: 50,
            shadowColor: Colors.blue[800],
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Magrib', style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: _selectmagribTime,
                        child: Text(' ${magribtime.format(context)}'),
                      ),

                    ],
                  ),
                  Container(
                    child: Switch(
                      onChanged: magribswitch,
                      value: magrib,
                      activeColor: Colors.blue[700],
                      activeTrackColor: Colors.blue[400],
                      inactiveThumbColor: Colors.white54,
                      inactiveTrackColor: Colors.black12,
                    ),
                  )

                ],
              ), //Column
            ), //SizedBox
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),),
                side: BorderSide(width: 3, color: Colors.blue)),
            elevation: 50,
            shadowColor: Colors.blue[800],
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Esha', style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: _selecteshaTime,
                        child: Text(' ${eshatime.format(context)}'),
                      ),

                    ],
                  ),
                  Container(
                    child: Switch(
                      onChanged: eshaswitch,
                      value: esha,
                      activeColor: Colors.blue[700],
                      activeTrackColor: Colors.blue[400],
                      inactiveThumbColor: Colors.white54,
                      inactiveTrackColor: Colors.black12,
                    ),
                  )

                ],
              ), //Column
            ), //SizedBox
          ),
        ],
      ),





    );
  }
}
