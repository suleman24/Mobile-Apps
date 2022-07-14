import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manager/subjects.dart';

import '../authentication.dart';

class studentfee extends StatefulWidget {
  const studentfee(
      {required this.name, required this.fee, required this.docid,required this.cname,required this.index,required this.subjects, Key? key,
        this.jan, this.feb, this.mar, this.apr, this.may, this.jun, this.jul, this.aug, this.sep, this.oct, this.nov, this.dec, this.imageUrl,})
      : super(key: key);

  final name;
  final cname;

  final fee;
  final docid;
  final index;
  final subjects;

  final imageUrl;

  final jan;
  final feb;
  final mar;
  final apr;
  final may;
  final jun;
  final jul;
  final aug;
  final sep;
  final oct;
  final nov;
  final dec;

  @override
  _studentfeeState createState() => _studentfeeState();
}

class _studentfeeState extends State<studentfee> {
  late int classfee = widget.fee;
  late var sname = widget.name;
  late var classname = widget.cname;
  late int index = widget.index;
  late int subjects = int.parse(widget.subjects);
  late var docid = widget.docid;

  late String imageUrl = widget.imageUrl;

  int subjectcount=0;
  late var totalfee = subjects * classfee;
  var items = ['Payed','Not Payed'];


  late var janvalue=widget.jan;
  late var febvalue=widget.feb;
  late var marvalue=widget.mar;
  late var aprvalue=widget.apr;
  late var mayvalue=widget.may;
  late var junvalue=widget.jun;
  late var julvalue=widget.jul;
  late var augvalue=widget.aug;
  late var sepvalue=widget.sep;
  late var octvalue=widget.oct;
  late var novvalue=widget.nov;
  late var decvalue=widget.dec;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fee Deatils'),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child:
              Card(
                elevation: 50,
                shadowColor: Colors.blue[800],
                color: Colors.white,
                child: Container(
                    height: 180,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue, // red as border color
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    child: Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 50,
                                  child: ClipOval(
                                    child: (imageUrl != null)
                                        ? Image.network(imageUrl)
                                        : null,


                                  ),

                                ),
                                Text(
                                  '$sname',
                                  style: TextStyle(fontSize: 18, color: Colors.blue[900]),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("Total Subjects : $subjects",style: TextStyle(fontSize: 12,),),
                            Text("Total Fee : $totalfee",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.pinkAccent),)
                          ],
                        )
                    )
                ),
              ),
            ),




            Container(
                height: 750,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.all(Radius.circular(2))),
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("January : ",style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.w900),),
                            Text('February : ',style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.w900)),
                            Text('March : ',style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.w900)),
                            Text('April : ',style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.w900)),
                            Text('May : ',style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.w900)),
                            Text('June : ',style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.w900)),
                            Text('July : ',style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.w900)),
                            Text('August : ',style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.w900)),
                            Text('September : ',style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.w900)),
                            Text('October : ',style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.w900)),
                            Text('November : ',style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.w900)),
                            Text('December : ',style: TextStyle(fontSize: 20,color: Colors.blue[900],fontWeight: FontWeight.w900)),
                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 60,
                              width: 120,
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  value: janvalue,
                                  items: items.map((item)=> DropdownMenuItem<String>(
                                    value: item,
                                    child: Text('$item',style: TextStyle(fontSize:janvalue=="Payed"?14:12,color: janvalue=="Payed"?Colors.pink:Colors.black87),),
                                  ))
                                      .toList(),

                                  onChanged:(item)=> setState(()=> janvalue=item!)
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 120,
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  value: febvalue,
                                  items: items.map((item)=> DropdownMenuItem<String>(
                                    value: item,
                                    child: Text('$item',style: TextStyle(fontSize:febvalue=="Payed"?14:12,color: febvalue=="Payed"?Colors.pink:Colors.black87),),
                                  ))
                                      .toList(),

                                  onChanged:(item)=> setState(()=> febvalue=item!)
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 120,
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  value: marvalue,
                                  items: items.map((item)=> DropdownMenuItem<String>(
                                    value: item,
                                    child: Text('$item',style: TextStyle(fontSize:marvalue=="Payed"?14:12,color: marvalue=="Payed"?Colors.pink:Colors.black87),),
                                  ))
                                      .toList(),

                                  onChanged:(item)=> setState(()=> marvalue=item!)
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 120,
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  value: aprvalue,
                                  items: items.map((item)=> DropdownMenuItem<String>(
                                    value: item,
                                    child: Text('$item',style: TextStyle(fontSize:aprvalue=="Payed"?14:12,color: aprvalue=="Payed"?Colors.pink:Colors.black87),),
                                  ))
                                      .toList(),

                                  onChanged:(item)=> setState(()=> aprvalue=item!)
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 120,
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  value: mayvalue,
                                  items: items.map((item)=> DropdownMenuItem<String>(
                                    value: item,
                                    child: Text('$item',style: TextStyle(fontSize:mayvalue=="Payed"?14:12,color: mayvalue=="Payed"?Colors.pink:Colors.black87),),
                                  ))
                                      .toList(),

                                  onChanged:(item)=> setState(()=> mayvalue=item!)
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 120,
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  value: junvalue,
                                  items: items.map((item)=> DropdownMenuItem<String>(
                                    value: item,
                                    child: Text('$item',style: TextStyle(fontSize:junvalue=="Payed"?14:12,color: junvalue=="Payed"?Colors.pink:Colors.black87),),
                                  ))
                                      .toList(),

                                  onChanged:(item)=> setState(()=> junvalue=item!)
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 120,
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  value: julvalue,
                                  items: items.map((item)=> DropdownMenuItem<String>(
                                    value: item,
                                    child: Text('$item',style: TextStyle(fontSize:julvalue=="Payed"?14:12,color: julvalue=="Payed"?Colors.pink:Colors.black87),),
                                  ))
                                      .toList(),

                                  onChanged:(item)=> setState(()=> julvalue=item!)
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 120,
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  value: augvalue,
                                  items: items.map((item)=> DropdownMenuItem<String>(
                                    value: item,
                                    child: Text('$item',style: TextStyle(fontSize:augvalue=="Payed"?14:12,color: augvalue=="Payed"?Colors.pink:Colors.black87),),
                                  ))
                                      .toList(),

                                  onChanged:(item)=> setState(()=> augvalue=item!)
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 120,
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  value: sepvalue,
                                  items: items.map((item)=> DropdownMenuItem<String>(
                                    value: item,
                                    child: Text('$item',style: TextStyle(fontSize:sepvalue=="Payed"?14:12,color: sepvalue=="Payed"?Colors.pink:Colors.black87),),
                                  ))
                                      .toList(),

                                  onChanged:(item)=> setState(()=> sepvalue=item!)
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 120,
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  value: octvalue,
                                  items: items.map((item)=> DropdownMenuItem<String>(
                                    value: item,
                                    child: Text('$item',style: TextStyle(fontSize:octvalue=="Payed"?14:12,color: octvalue=="Payed"?Colors.pink:Colors.black87),),
                                  ))
                                      .toList(),

                                  onChanged:(item)=> setState(()=> octvalue=item!)
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 120,
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  value: novvalue,
                                  items: items.map((item)=> DropdownMenuItem<String>(
                                    value: item,
                                    child: Text('$item',style: TextStyle(fontSize:novvalue=="Payed"?14:12,color: novvalue=="Payed"?Colors.pink:Colors.black87),),
                                  ))
                                      .toList(),

                                  onChanged:(item)=> setState(()=> novvalue=item!)
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 120,
                              child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  value: decvalue,
                                  items: items.map((item)=> DropdownMenuItem<String>(
                                    value: item,
                                    child: Text('$item',style: TextStyle(fontSize:decvalue=="Payed"?14:12,color: decvalue=="Payed"?Colors.pink:Colors.black87),),
                                  ))
                                      .toList(),

                                  onChanged:(item)=> setState(()=> decvalue=item!)
                              ),
                            ),


                          ],
                        ),

                      ],
                    )
                )
            ),

            SizedBox(
              height: 30,
            ),


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                shape: StadiumBorder(),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () async {

                    final uid=AuthenticationHelper().getID();
                    FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('students').doc(docid).update({

                      "jan":janvalue,
                      "feb":febvalue,
                      "mar":marvalue,
                      "apr":aprvalue,
                      "may":mayvalue,
                      "jun":junvalue,
                      "jul":julvalue,
                      "aug":augvalue,
                      "sep":sepvalue,
                      "oct":octvalue,
                      "nov":novvalue,
                      "dec":decvalue

                    });


                    showDialog(context: context, builder: (context)=> AlertDialog(
                        title: Text('Fee Updated',style: TextStyle(fontSize: 20,color: Colors.deepPurple)),

                        actions: <Widget>[
                          new
                          RaisedButton(
                            shape: StadiumBorder(),
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),



                        ],
                      ));












                },
                child: Center(
                  child: Text(
                    'Done',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),



            SizedBox(
              height: 40,
            ),







          ],

        ),
      )
    );
  }
}

