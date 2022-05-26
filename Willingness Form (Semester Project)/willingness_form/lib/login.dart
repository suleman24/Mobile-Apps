import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:willingness_form/signup.dart';
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
                      Center(
                        child:Text("LOGIN",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Colors.blue[700]),) ,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text("Enter Email",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.blue[700]),),
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
                      Text("Enter Password",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.blue[700]),),
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
                            child: Text('Login',style: TextStyle(fontSize: 20),),
                            onPressed:(){
                              AuthenticationHelper()
                                  .signIn(email.text,  password.text)
                                  .then((result) {
                                if (result == null) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => view()));
                                } else {
                                  print("NO");
                                }
                              });



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
                              onPressed:(){

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => signupp()));

                              }





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

