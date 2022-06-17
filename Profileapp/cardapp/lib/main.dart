import 'package:flutter/material.dart';

void main() {
  runApp(cardapp());
}

class cardapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FA19-BCS-061',
        home: Scaffold(
          backgroundColor: Colors.deepPurple,
          appBar: AppBar(

            title: Text('Flutter App Developer'),
            backgroundColor: Colors.deepPurpleAccent,
            centerTitle: true,
            actions:<Widget>[CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20.0,
              backgroundImage: AssetImage('images/me.jpg'),
              
            ),],
          ),
          body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70.0,
                    backgroundImage: AssetImage('images/me.jpg'),
                  ),
                  Text(
                    'Suleman Anwar',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                    width: 150.0,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.location_city,
                          color: Colors.cyan,
                        ),
                        title: Text(
                          '24/WB Vehari, Punjab, Pakistan',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 20.0,
                          ),
                        ),
                      )),
                  Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.cyan,
                        ),
                        title: Text(
                          '+92 308 8648424',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 20.0,
                          ),
                        ),
                      )),
                  Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.cyan,
                        ),
                        title: Text(
                          'suleman.anwar.424@gmail.com',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.cyan,
                              ),
                        ),
                      ))
                ],
              )),
        ),
      );
  }
}