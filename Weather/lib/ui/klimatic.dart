import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/api.dart' as util;
import 'package:http/http.dart' as http;
import '../constants.dart';
import 'dart:convert';

class klimatic extends StatefulWidget {

  @override
  _klimaticState createState() => _klimaticState();
}

class _klimaticState extends State<klimatic> {


  void showStuff() async {
    Map data = await getWeather(util.apiId, util.defaultCity);
    print(data.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Klimatic'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: (){},

              icon: Icon(Icons.menu))
        ],
      ),

      body: Stack(
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage('images/umbrella.png'),
              height: 1250.0,
              width: 600.0,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: Text(
              '${_cityEntered == null ? util.defaultCity : _cityEntered}',
              style: city(),
            ),
          ),
          Center(
            child: Image(
              image: AssetImage('images/light_rain.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30.0, 90.0, 0.0, 0.0),
            child: updateTempWidget(
                '${_cityEntered == null ? util.defaultCity : _cityEntered}'),
          ),
        ],
      ),
    );
  }


  Future<Map> getWeather(String appId, String city) async {
    String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid='
        '${util.apiId}&units=imperial';
    //http://api.openweathermap.org/data/2.5/weather?q=vehari&appid=ee595cbdb0db0ef5d11b9caf5a8eb1ea&units=metric

    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }

}


