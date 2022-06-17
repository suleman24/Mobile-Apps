import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseCon {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
}

class UploadFile {
  static List<dynamic> list = [];
  static late bool valid = true;
  static Future<void> read(String path) async {
    var bytes = File(path).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    for (var table in excel.tables.keys) {
      if (excel.tables[table]!.maxCols != 3) {
        valid = false;
        Fluttertoast.showToast(
            msg: "Incorrect File",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        list = [];
        excel.tables[table]!.removeRow(0);
        excel.tables[table]!.removeColumn(0);
        for (var element in excel.tables[table]!.rows) {
          if (element[1] != null) {
            list.add([
              element[0]!.value.toString().trim(),
              element[1]!.value.toString().trim()
            ]);
          }
        }
      }
      if (valid) {
        uploadList();
      }
    }
  }

  static void uploadList() async {
    var projects = DatabaseCon.firestore.collection("projects");
    var existing = [];
    await projects.get().then((value) {
      value.docs.forEach((element) {
        existing.add(element["title"].toString());
      });
    });
    if (list.isNotEmpty) {
      for (var item in list) {
        if (!existing.contains(item[0])) {
          await projects.add({"title": item[0], "status": item[1]});
        }
      }
    } else {
      for (var item in list) {
        await projects.add({"title": item[0], "status": item[1]});
      }
    }

    print(list[1]);
    Fluttertoast.showToast(
        msg: "Uploaded Succesully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
