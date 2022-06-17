// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fypadmin/UploadFile.dart';
import 'package:fypadmin/downloadFile.dart';
import 'package:flutter_share/flutter_share.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> shareFile(String path) async {
    await FlutterShare.shareFile(title: "CUI-FYP", filePath: path);
  }

  final decor = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  final boxDecor = BoxDecoration(
    color: Colors.blue.shade400,
    borderRadius: BorderRadius.circular(
      50,
    ),
  );
  bool uploading = false;
  bool downloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Home"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                if (!uploading) {
                  setState(() {
                    uploading = true;
                  });
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['xlsx'],
                  );
                  if (result != null) {
                    await UploadFile.read(result.files.first.path as String);
                  }
                  setState(() {
                    uploading = false;
                  });
                }
              },
              child: Container(
                height: 80,
                width: 260,
                padding: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: uploading ? 15 : 0,
                    bottom: uploading ? 15 : 0),
                decoration: boxDecor,
                child: FittedBox(
                  child: uploading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          "UPLOAD",
                          style: decor,
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () async {
                if (!downloading) {
                  setState(() {
                    downloading = true;
                  });

                  String path = await DownloadFile.download();
                  await shareFile(path);
                  setState(() {
                    downloading = false;
                  });
                }
              },
              child: Container(
                height: 80,
                width: 260,
                padding: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: downloading ? 15 : 0,
                    bottom: downloading ? 15 : 0),
                decoration: boxDecor,
                child: FittedBox(
                    child: downloading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "DOWNLOAD",
                            style: decor,
                          )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
