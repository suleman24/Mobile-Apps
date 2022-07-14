import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import '../authentication.dart';

class DownloadFile {
  // static Future<String> download() async {
  //
  //   var ref=FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers');
  //
  //
  //   final String half = (await getExternalStorageDirectory())!.path;
  //
  //   String path = DateTime.now().toString();
  //   path = path
  //       .replaceAll(":", "")
  //       .replaceAll("-", "")
  //       .replaceAll(" ", "")
  //       .replaceAll(".", "");
  //   path = path + ".xlsx";
  //   path = half + path;
  //   final book = Workbook();
  //   final Worksheet sheet = book.worksheets[0];
  //   sheet.getRangeByName("A1").setText("Sr No.");
  //   sheet.getRangeByName("B1").setText("Name");
  //   sheet.getRangeByName("C1").setText("Phone Number");
  //
  //   // sheet.getRangeByName("K1").setText("Date");
  //
  //   await ref.get().then((value) {
  //     int a = 2;
  //     value.docs.forEach((element) {
  //       // if ((element["status"]).toString() == "false") {
  //       sheet.getRangeByName("A$a").setText("${a - 1}");
  //       sheet.getRangeByName("B$a").setText(element["name"]);
  //       sheet.getRangeByName("C$a").setText(element["phone"]);
  //       a++;
  //     });
  //   });
  //   final List<int> bytes = book.saveAsStream();
  //   File f = File(path);
  //   print(path);
  //   await f.writeAsBytes(bytes);
  //   book.dispose();
  //   Fluttertoast.showToast(
  //       msg: "File downloaded! Path:$path",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.black,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  //   return path;
  // }





}






