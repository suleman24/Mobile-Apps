import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'academies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: academies()));
}