import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:willingness_form/view.dart';
import 'package:willingness_form/willingness_form.dart';

import 'authentication.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(
                height: 200,
              ),
              Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 50,
                shadowColor: Colors.blue[800],
                color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child:

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

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
                            labelText: "Email"
                        ),
                      ),

                      SizedBox(
                        height: 40,
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

                            labelText: "Password"

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
                            child: Text('Login',style: TextStyle(fontSize: 20),),
                            onPressed:()async {
                              final user = await signup(email,password);
                              if(user!=null)
                              {
                                print("Signup Successful");
                              }
                              else
                              {
                                print("Not successful");
                              }

                            },





                          )
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      SizedBox(
                          height:60,
                          width:150,
                          child:
                          RaisedButton(
                              shape: StadiumBorder(),
                              textColor: Colors.blue,
                              color: Colors.white,
                              child: Text('Go to Signup',style: TextStyle(fontSize: 14),),
                              onPressed:(){}





                          )
                      ),



                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

