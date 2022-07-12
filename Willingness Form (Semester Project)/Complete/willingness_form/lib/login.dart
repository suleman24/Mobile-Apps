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
  final _form = GlobalKey<FormState>();
  bool _isValid = false;

  void _saveForm() {
    setState(() {
      _isValid = _form.currentState!.validate();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: SafeArea(
          child: 
            Column(
              children: [
                      Form(
                        key: _form,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                                  SizedBox(
                              height: 5,
                            ),
                             Text("Enter Email",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
                            
                            TextFormField(
                              controller: email,
                                  hintText: "abc@gmail.com"
                              ),
                            
                            

                            SizedBox(
                              height: 30,
                            ),
                             Text("Enter Password",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
                            
                            TextFormField(
                              controller: password,
                                  hintText: "*******"

                              ),
                            
                            SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: Text(
                                "Developed by: Suleman & Umar",style: TextStyle(color: Colors.black),
                              ),
                            ),
                          
                          ])
                      )
              ]
            )
      )
  }
}




