import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'authentication.dart';
import 'login.dart';

class signupp extends StatefulWidget {
  @override
  _signuppState createState() => _signuppState();
}

class _signuppState extends State<signupp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool _isValid = false;

  void _saveForm() {
    setState(() {
      _isValid = _form.currentState!.validate();
    });
  }

  var n=0;

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
                            child: Text("Enter Email",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),
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
                            child: Text("Enter Password",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),
                          ),
                          TextFormField(
                            controller: password,
                            validator: (String? password) {
                              if (password != null && password.isEmpty) {
                                return "Password is Required";
                              }
                              else if(password!.length<7)
                              {
                                return "Minimum Password length is 7 ";
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
                            height: 50,
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

                                    _saveForm();
                                    
                                     if(_isValid==true)
                                      {
                                        AuthenticationHelper()
                                            .signUp(email.text, password.text)
                                            .then((result) {
                                          if (result == null) {
                                            print("OK");
                                            showAlertDialog(context);
                                          } else {
                                            print("NO");
                                            showAlertDialogForError(context);
                                          }
                                        });



                                      }

                                            },

                              ),
                          ),

                          SizedBox(
                            height: 30,
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

                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => login()),
                                            (Route<dynamic> route) => false,
                                      );
                                    }





                                  )
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),

                          Center(
                            child: Text(
                              "Developed by: Suleman",style: TextStyle(color: Colors.black),
                            ),
                          )


                        ],
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

showAlertDialog(BuildContext context) {

  Widget continueButton = TextButton(
    child: Text("OK"),
    onPressed:  () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => login()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Signed Up"),
    content: Text("Your Account has been created"),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


showAlertDialogForError(BuildContext context) {

  Widget continueButton = TextButton(
    child: Text("OK"),
    onPressed:  () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => signupp()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text("This Account cannot be created"),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}