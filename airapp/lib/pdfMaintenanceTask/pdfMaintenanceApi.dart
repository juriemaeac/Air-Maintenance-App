import 'dart:io';
import 'package:airapp/database/maintenanceTask_model.dart';
import 'package:airapp/pdfMaintenanceTask/maintenance_pdf_api.dart';
import 'package:http/http.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfMaintenanceApi {
  static Future<File> generate(MaintenanceTask maintenance) async {
    final pdf = Document();
    pdf.addPage(
      MultiPage(
        margin: pw.EdgeInsets.all(50),
        build: (context) => [
          pw.Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pw.SizedBox(width: 10),
              buildHeader(),
              pw.SizedBox(width: 40),
              //display table
              pw.Table.fromTextArray(
                context: context,
                headerCount: 0,
                data: <List<dynamic>>[
                  // <String>[
                  //   '\n\n\n\n\n',
                  //   'Preparatory works',
                  //   'Findings',
                  //   'Initials'
                  // ],
                ],
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(0.3),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(2),
                },
                cellHeight: 35,
              ),
            ],
          ),
        ],
      ),
    );
    pdf.addPage(
      MultiPage(
        margin: pw.EdgeInsets.all(50),
        build: (context) => [
          pw.Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pw.SizedBox(width: 10),
              pw.SizedBox(width: 40),
              //display table
              pw.Table.fromTextArray(
                context: context,
                headerCount: 0,
                data: <List<dynamic>>[
                  // <String>[
                  //   '\n\n\n\n\n',
                  //   'Preparatory works',
                  //   'Findings',
                  //   'Initials'
                  // ],
                ],
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(0.3),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(2),
                },
                cellHeight: 35,
              ),
            ],
          ),
        ],
      ),
    );

    Header(
      level: 0,
      child: Text(
        'MAINTEANCE TASK CARD',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return MaintenancePdfApi.saveDocument(
        name: 'Maintenance Task Card.pdf', pdf: pdf);
  }

  static Widget buildHeader() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Section A',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: PdfColors.black),
          ),
        ],
      );
}
