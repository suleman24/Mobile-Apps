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
        child:  SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/loginnn.jpg"),
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
                    backgroundImage: AssetImage('images/loginn.png'),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 50,
                    shadowColor: Colors.blue[800],
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child:

                      Form(
                        key: _form,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Enter Email",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
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
                              validator: (value) {
                                // Check if this field is empty
                                if (value == null || value.isEmpty) {
                                  return 'Email field is required';
                                }

                                // using regular expression
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return "Please enter a valid email address";
                                }

                                // the email is valid
                                return null;
                              },
                            ),

                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Enter Password",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
                            ),
                            TextFormField(
                              controller: password,
                                validator: (String? value) {
                                  if (value != null && value.isEmpty) {
                                    return "Password is Required";
                                  }
                                  return null;
                                },
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

                                  hintText: "*******"

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
                                    _saveForm();
                                    if(_isValid==true){
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


                                    }




                                  },





                                )
                            ),

                            SizedBox(
                              height: 40,
                            ),

                            Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                    height:40,
                                    width:120,
                                    child:
                                    RaisedButton(
                                        shape: StadiumBorder(),
                                        textColor: Colors.white,
                                        color: Colors.pinkAccent,
                                        child: Text('Go to Signup',style: TextStyle(fontSize: 10),),
                                        onPressed:(){

                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => signupp()));

                                        }





                                    )
                                ),
                              ],
                            ),



                          ],
                        ),
                      ),
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

