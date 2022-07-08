import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Check extends StatelessWidget {
  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return login();






    // if(_auth.currentUser==null){
    //   return login();
    // }
    // else{
    //   return view();
    // }
  }
}
