import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class teacher_sub_class_Pdfservices{
  Future<Uint8List>createPdf(List data)async{

    final pw.Document doc = pw.Document();

    doc.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        header: (pw.Context context) {
          return pw.Container(
              alignment: pw.Alignment.center,
              margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
              padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
              child: pw.Column(
                  children: [

                    pw.Divider(
                      color: PdfColors.blue,

                      thickness: 5.0,



                    )
                  ]
              ));
        },
        build: (pw.Context context) => <pw.Widget>[
          pw.Table.fromTextArray(
              context: context,
              border: null,
              headerAlignment: pw.Alignment.centerLeft,
              headerDecoration: pw.BoxDecoration(color: PdfColors.blue),
              headerStyle: pw.TextStyle(fontSize: 20.0),
              cellStyle: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 20.0
              ),


              data: <List<String>>[

                <String>['Name', 'Class', 'Subject' ],
                for (int i = 0; i <data.length; i++)
                  <String>['${i+1}) ${data.elementAt(i)['name']}','${data.elementAt(i)['class']}','${data.elementAt(i)['subject']}'],
              ]),
          pw.Paragraph(text: ""),
          pw.Padding(padding: const pw.EdgeInsets.all(10)),
        ]

    ));

    return doc.save();



  }
  Future<void>saveAndLanchFile(List<int>bytes,String fileName)async{
    final path =(await getExternalStorageDirectory())?.path;
    final file=File("$path/$fileName");
    await file.writeAsBytes(bytes,flush: true);
    OpenFile.open("$path/$fileName");

  }
}