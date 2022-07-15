import 'package:flutter/material.dart';

import 'continuee.dart';



class teacherlogin extends StatefulWidget {
  const teacherlogin({Key? key, this.uid, this.name
  }) :super(key: key);
  final uid;
  final name;


  @override
  _teacherloginState createState() => _teacherloginState();
}

class _teacherloginState extends State<teacherlogin> {

  late var uid = widget.uid;
  late var name = widget.name;


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _form = GlobalKey<FormState>();



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
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: InkWell(
                                onTap: (){
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) => teacherlogin()));
                                },
                                child: Material(
                                  color: Colors.white,
                                  elevation: 10.0,
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                             name,
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              color: Colors.pinkAccent,

                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),


                            SizedBox(
                              height: 30,
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
                              height: 50,
                            ),

                            SizedBox(
                                height:60,
                                width:150,
                                child:
                                RaisedButton(
                                  shape: StadiumBorder(),
                                  textColor: Colors.blue,
                                  color: Colors.white,
                                  child: Text('Login',style: TextStyle(fontSize: 20),),
                                  onPressed:(){

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => continuee(uid:uid,name:name,password: password.text)));

                                  },





                                )
                            ),

                            SizedBox(
                              height: 30,
                            ),

                            SizedBox(
                              height: 30,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

}