// ignore_for_file: unused_local_variable, avoid_function_literals_in_foreach_calls, import_of_legacy_library_into_null_safe

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fypadmin/UploadFile.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class DownloadFile {
  static Future<String> download() async {

    var ref = DatabaseCon.firestore
        .collection('allprojects');



    final String half = (await getExternalStorageDirectory())!.path;

    String path = DateTime.now().toString();
    path = path
        .replaceAll(":", "")
        .replaceAll("-", "")
        .replaceAll(" ", "")
        .replaceAll(".", "");
    path = path + ".xlsx";
    path = half + path;
    final book = Workbook();
    final Worksheet sheet = book.worksheets[0];
    sheet.getRangeByName("A1").setText("Sr No.");
    sheet.getRangeByName("B1").setText("Student 1 Name");
    sheet.getRangeByName("C1").setText("Student 1 Reg. No");
    sheet.getRangeByName("D1").setText("Git ID");
    sheet.getRangeByName("E1").setText("Student Name");
    sheet.getRangeByName("F1").setText("Reg No.");
    sheet.getRangeByName("G1").setText("Git ID");
    sheet.getRangeByName("H1").setText("Project Title");
    sheet.getRangeByName("I1").setText("Supervisor Name");
    sheet.getRangeByName("J1").setText("Git ID");
    // sheet.getRangeByName("K1").setText("Date");

    await ref.get().then((value) {
      int a = 2;
      value.docs.forEach((element) {
        // if ((element["status"]).toString() == "false") {
        sheet.getRangeByName("A$a").setText("${a - 1}");
        sheet.getRangeByName("B$a").setText(element["s1name"]);
        sheet
            .getRangeByName("C$a")
            .setText(element["s1reg"].toString().toUpperCase());
        sheet.getRangeByName("D$a").setText(element["s1github"]);
        sheet.getRangeByName("E$a").setText(element["s2name"]);
        sheet
            .getRangeByName("F$a")
            .setText(element["s2reg"].toString().toUpperCase());
        sheet.getRangeByName("G$a").setText(element["s2github"]);
        sheet.getRangeByName("H$a").setText(element["project"]);
        sheet.getRangeByName("I$a").setText(element["supervisorname"]);
        sheet.getRangeByName("J$a").setText(element["supervisorgithub"]);
        // sheet.getRangeByName("K$a").setText("Date");
        a++;
      });
    });
    final List<int> bytes = book.saveAsStream();
    File f = File(path);
    print(path);
    await f.writeAsBytes(bytes);
    book.dispose();
    Fluttertoast.showToast(
        msg: "File downloaded! Path:$path",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
    return path;
  }
}
