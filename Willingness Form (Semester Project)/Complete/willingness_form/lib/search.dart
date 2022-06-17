import 'package:flutter/material.dart';
import 'package:willingness_form/willingness_form.dart';


class search extends StatefulWidget {
  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  TextEditingController project = TextEditingController();
  late String search;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search or Continue'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Text('You may Enter a keyword to Search Project`s Titles accordingly or Continue',style: TextStyle(fontSize: 20)),

           TextField(
             controller: project,
             decoration: InputDecoration(
                 border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(25),
                     borderSide: const BorderSide(
                         width: 3,
                         color: Colors.blue
                     )
                 ),
                 enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(25),
                     borderSide: const BorderSide(
                         width: 3,
                         color: Colors.teal
                     )

                 ),
                 labelText: "Search Project"
             ),
           ),

           SizedBox(
             height:80,
             width:150,
             child: RaisedButton(
                 shape: StadiumBorder(),
                 textColor: Colors.white,
                 color: Colors.blue,
                 child: Text('Continue',style: TextStyle(fontSize: 20),),
                 onPressed:(){

                 search = project.text;

                 Navigator.push(context,
                     MaterialPageRoute(builder: (context) => willingness_form(projectsearch:search)));


                 }
             ),
           ),

           SizedBox(
             height: 50,
           )
         ],

        ),
      ),

    );
  }
}
