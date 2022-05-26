import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:willingness_form/login.dart';
import 'package:willingness_form/view.dart';
import 'package:willingness_form/willingness_form.dart';

import 'authentication.dart';

class signupp extends StatefulWidget {
  @override
  _signuppState createState() => _signuppState();
}

class _signuppState extends State<signupp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        backgroundColor: Colors.blue[800],
      ),
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/signupp.png"),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60.0,
                    backgroundImage: AssetImage('images/signup.jpg'),
                  ),
                ),
                Card(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 50,
                  shadowColor: Colors.blue[800],
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child:

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Enter Email",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),
                        ),
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: Colors.white
                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: Colors.white
                                  )

                              ),
                              hintText: "abc@gmail.com"
                          ),
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Enter Password",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),
                        ),
                        TextField(
                          controller: password,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: Colors.white
                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: Colors.white
                                  )

                              ),

                              hintText: "******"

                          ),
                        ),

                        SizedBox(
                          height: 80,
                        ),

                        SizedBox(
                            height:80,
                            width:150,
                            child:
                            RaisedButton(
                                shape: StadiumBorder(),
                                textColor: Colors.blue,
                                color: Colors.white,
                                child: Text('Sign up',style: TextStyle(fontSize: 20),),
                                onPressed:()async {
                                  AuthenticationHelper()
                                      .signUp(email.text, password.text)
                                      .then((result) {
                                    if (result == null) {
                                      print("OK");
                                    } else {
                                      print("NO");
                                    }
                                  });

                                          },

                            ),
                        ),

                        SizedBox(
                          height: 40,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                height:40,
                                width:120,
                                child:
                                RaisedButton(
                                    shape: StadiumBorder(),
                                    textColor: Colors.white,
                                    color: Colors.pinkAccent,
                                  child: Text('Go to Login',style: TextStyle(fontSize: 14),),
                                  onPressed:(){

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => login()));

                                  }





                                )
                            ),
                          ],
                        ),



                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}

