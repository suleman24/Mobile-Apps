import 'package:flutter/material.dart';
import 'package:willingness_form/view.dart';

class willingness_form extends StatefulWidget {
  const willingness_form({Key? key}) : super(key: key);

  @override
  State<willingness_form> createState() => _willingness_formState();
}

class _willingness_formState extends State<willingness_form> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Supervisor Willingness Form')),
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.stretch ,
                    children: [
                      Container(
                        child: DropdownButton<String>(
                          hint: Text('Choose a Category'),
                          items: <String>['A', 'B', 'C', 'D'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ),
                      Container(
                        child: DropdownButton<String>(
                          hint: Text('Please Choose a Project'),
                          items: <String>['A', 'B', 'C', 'D'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                          child: Text(
                              'Student 1 Information',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                decorationStyle: TextDecorationStyle.solid,
                                letterSpacing: -1.0,
                                wordSpacing: 5.0,
                                fontFamily: 'YourCustomFont',
                              )
                          )
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Name',
                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Student Name is required";
                              }
                              return null;
                            }),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'GitHub ID',
                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "GiGitHub ID is required";
                              }
                              return null;
                            }),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'FA19-BCS-068',
                              border: UnderlineInputBorder(),
                              labelText: 'Registration Number',

                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Registration Number is required";
                              }
                              if(!RegExp(r'^[A-Z0-9]+[-]+[A-Z]+[-]+[0-9]$').hasMatch(value!)){
                                //allow upper and lower case alphabets and space
                                return "Enter Correct Formate";
                              }
                              return null;
                            }),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                          child: Text(
                              'Student 2 Information',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                decorationStyle: TextDecorationStyle.solid,
                                letterSpacing: -1.0,
                                wordSpacing: 5.0,
                                fontFamily: 'YourCustomFont',
                              )
                          )
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Name',
                            )
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'GitHub ID',
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'FA19-BCS-068',
                            border: UnderlineInputBorder(),
                            labelText: 'Registration Number',

                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                          child: Text(
                              'Supervisor Information',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                decorationStyle: TextDecorationStyle.solid,
                                letterSpacing: -1.0,
                                wordSpacing: 5.0,
                                fontFamily: 'YourCustomFont',
                              )
                          )
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Name',
                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Name is required";
                              }
                              return null;
                            }),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'GitHub ID',
                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "GiGitHub ID is required";
                              }
                              return null;
                            }),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                          margin: const EdgeInsets.only(top: 40.0),
                          child: ElevatedButton(
                              child: const Text(
                                'SUBMIT',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.white,
                                  shadowColor: Colors.black,
                                  elevation: 20,
                                  padding: const EdgeInsets.all(15),
                                  minimumSize: const Size(50, 40)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) => view()));
                                  showAlertDialog(context);
                                }
                              }
                          )
                      ),
                      SizedBox(height: 25.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}


showAlertDialog(BuildContext context) {

  Widget continueButton = TextButton(
    child: Text("OK"),
    onPressed:  () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => view()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Congratulations"),
    content: Text("Your data saved Successfully"),
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