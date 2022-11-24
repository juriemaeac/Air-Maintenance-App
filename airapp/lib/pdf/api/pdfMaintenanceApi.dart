import 'dart:io';
import 'package:airapp/database/scheduledInspection_model.dart';
import 'package:airapp/pdf/api/pdf_api.dart';
import 'package:airapp/pdf/model/invoice.dart';
import 'package:airapp/pdf/model/studentPDF.dart';
import 'package:airapp/pdf/utils.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfMaintenanceApi {
  static Future<File> generate(ScheduledInspection inspection) async {
    getRating(int rating) {
      String equivRating = "";
      if (rating == 1) {
        equivRating = "Satisfactory";
      } else if (rating == 2) {
        equivRating = "Not Satisfactory";
      } else if (rating == 3) {
        equivRating = "Warning";
      } else {
        equivRating = "N/A";
      }
      return equivRating;
    }

    String a11 = getRating(inspection.sipA11Findings ?? 3);
    String a12 = getRating(inspection.sipA12Findings ?? 3);
    String a13 = getRating(inspection.sipA13Findings ?? 3);
    String a14 = getRating(inspection.sipA14Findings ?? 3);
    String a2 = getRating(inspection.sipA2Findings ?? 3);
    String a3 = getRating(inspection.sipA3Findings ?? 3);
    String a4 = getRating(inspection.sipA4Findings ?? 3);
    String a5 = getRating(inspection.sipA5Findings ?? 3);
    String a6 = getRating(inspection.sipA6Findings ?? 3);
    String a7 = getRating(inspection.sipA7Findings ?? 3);
    String b1 = getRating(inspection.sipB1Findings ?? 3);
    String b21 = getRating(inspection.sipB21Findings ?? 3);
    String b22 = getRating(inspection.sipB22Findings ?? 3);
    String b23 = getRating(inspection.sipB23Findings ?? 3);
    String b24 = getRating(inspection.sipB24Findings ?? 3);
    String b25 = getRating(inspection.sipB25Findings ?? 3);
    String b31 = getRating(inspection.sipB31Findings ?? 3);
    String b32 = getRating(inspection.sipB32Findings ?? 3);
    String b41 = getRating(inspection.sipB41Findings ?? 3);
    String b42 = getRating(inspection.sipB42Findings ?? 3);
    String b43 = getRating(inspection.sipB43Findings ?? 3);
    String b44 = getRating(inspection.sipB44Findings ?? 3);
    String b51 = getRating(inspection.sipB51Findings ?? 3);
    String b52 = getRating(inspection.sipB52Findings ?? 3);
    String b53 = getRating(inspection.sipB53Findings ?? 3);
    String b54 = getRating(inspection.sipB54Findings ?? 3);
    String b55 = getRating(inspection.sipB55Findings ?? 3);
    String b61 = getRating(inspection.sipB61Findings ?? 3);
    String b62 = getRating(inspection.sipB62Findings ?? 3);
    String b63 = getRating(inspection.sipB63Findings ?? 3);
    String b64 = getRating(inspection.sipB64Findings ?? 3);
    String b71 = getRating(inspection.sipB71Findings ?? 3);
    String b72 = getRating(inspection.sipB72Findings ?? 3);
    String b73 = getRating(inspection.sipB73Findings ?? 3);
    String b74 = getRating(inspection.sipB74Findings ?? 3);
    String b75 = getRating(inspection.sipB75Findings ?? 3);
    String b81 = getRating(inspection.sipB81Findings ?? 3);
    String b82 = getRating(inspection.sipB82Findings ?? 3);
    String b83 = getRating(inspection.sipB83Findings ?? 3);
    String b84 = getRating(inspection.sipB84Findings ?? 3);
    String b85 = getRating(inspection.sipB85Findings ?? 3);
    String b86 = getRating(inspection.sipB86Findings ?? 3);
    String b91 = getRating(inspection.sipB91Findings ?? 3);
    String b92 = getRating(inspection.sipB92Findings ?? 3);

    final pdf = Document();
    //final imageSvg = await rootBundle.loadString('assets/logo.svg');

    pdf.addPage(
      MultiPage(
        margin: pw.EdgeInsets.all(50),
        build: (context) => [
          pw.Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pw.SizedBox(width: 10),
              buildHeaderScheduled(),
              pw.SizedBox(width: 40),
              //display table
              pw.Table.fromTextArray(
                context: context,
                data: <List<dynamic>>[
                  <String>[
                    '\n\n\n\n\n\n',
                    'Preparatory works',
                    'Findings',
                    'Initials'
                  ],
                  <String>[
                    '1.1',
                    'Check the status of Applicable Airworthiness Directives',
                    a11,
                    '${inspection.sipA11Initials}'
                  ],
                  <String>[
                    '1.2',
                    'Check the status of Applicable Service Bulletins',
                    a12,
                    '${inspection.sipA12Initials}'
                  ],
                  <String>[
                    '1.3',
                    'Check the status of Log Books (reported problems)',
                    a13,
                    '${inspection.sipA13Initials}'
                  ],
                  <String>[
                    '1.4',
                    ' Registration Certificate',
                    a14,
                    '${inspection.sipA14Initials}'
                  ],
                  <String>[
                    '2.',
                    'Inspect life limited parts (replaced, overhauled)',
                    a2,
                    '${inspection.sipA2Initials}'
                  ],
                  <String>[
                    '3.',
                    'Drain the fuel tanks. Inspect drain valves for condition, obstruction and blockage.',
                    a3,
                    '${inspection.sipA3Initials}'
                  ],
                  <String>[
                    '4.',
                    'Clean the aircraft fully (exterior, interior).',
                    a4,
                    '${inspection.sipA4Initials}'
                  ],
                  <String>[
                    '5.',
                    'Visual inspection of interior marking and placards for condition (legibility and intactness).',
                    a5,
                    '${inspection.sipA5Initials}'
                  ],
                  <String>[
                    '6.',
                    'Visual inspection of exterior marking and placards for condition (legibility and intactness).',
                    a6,
                    '${inspection.sipA6Initials}'
                  ],
                  <String>[
                    '7.',
                    'Jack the aircraft.',
                    a7,
                    '${inspection.sipA7Initials}'
                  ],
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
              buildHeaderPeriodic(),
              pw.SizedBox(width: 40),
              //display table
              pw.Table.fromTextArray(
                context: context,
                data: <List<dynamic>>[
                  <String>[
                    '\n\n\n\n\n',
                    'Preparatory works',
                    'Findings',
                    'Initials'
                  ],
                  <String>[
                    '1.',
                    'Engine Inspection.\nFor engine inspection, refer to Maintenance Manual (Line Maintenance) for Rotax Engine Type 912 Series (Ref. No. MML-912, Part. No. 899191), latest issue.',
                    b1,
                    '${inspection.sipB1Initials}'
                  ],
                  <String>[
                    '2.',
                    'Engine Cowlings and Firewall',
                    '----------',
                    '----------'
                  ],
                  <String>[
                    'n2.1',
                    'Remove engine cowlings. Clean and perform visual inspection for cracks, damages, loose or missing fasteners. Inspect the condition of oil inspection door.',
                    b21,
                    '${inspection.sipB21Initials}'
                  ],
                  <String>[
                    '2.2',
                    'Visual inspection of engine cowlings fireproofing for condition and attachment (only bottom cowling)',
                    b22,
                    '${inspection.sipB22Initials}'
                  ],
                  <String>[
                    '2.3',
                    'Visual inspection of firewall and seals for cracks, condition and attachment.',
                    b23,
                    '${inspection.sipB23Initials}'
                  ],
                  <String>[
                    '2.4',
                    'Visual inspection of landing lights for condition, attachment and security.',
                    b24,
                    '${inspection.sipB24Initials}'
                  ],
                  <String>[
                    '2.5',
                    'Visual inspection of all parts installed at firewall for condition, attachment and security.',
                    b25,
                    '${inspection.sipB25Initials}'
                  ],
                  <String>['3.', 'Battery', '----------', '----------'],
                  <String>[
                    '3.1',
                    'Remove battery cover. Visual inspection of terminals and cables corrosion, tightening and condition. Inspection of battery charge condition.',
                    b31,
                    '${inspection.sipB31Initials}'
                  ],
                  <String>[
                    '3.2',
                    'Visual inspection of battery attachment and condition of fireproofing. Install battery cover.',
                    b32,
                    '${inspection.sipB32Initials}'
                  ],
                  <String>[
                    '4',
                    'Engine Mount',
                    '----------',
                    '----------',
                  ],
                  <String>[
                    '4.1',
                    'Visual inspection of engine mounts for weld cracks, bending, corrosion and distortion.',
                    b41,
                    '${inspection.sipB41Initials}'
                  ],
                  <String>[
                    '4.2',
                    'Visual inspection of rubber silent blocks for cracks, excessive deformation and condition.',
                    b42,
                    '${inspection.sipB42Initials}'
                  ],
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

                  <String>[
                    '4.3',
                    'Visual inspection of engine attachment, bolts and nuts security (engine — engine mount, engine mount - firewall)',
                    b43,
                    '${inspection.sipB43Initials}'
                  ],
                  <String>[
                    '4.4',
                    'Remove the engine mount attaching bolts. Visual inspection of bolts for cracks, deformation and damage. Install the bolts and inspect for proper nut torque.',
                    b44,
                    '${inspection.sipB44Initials}'
                  ],
                  <String>[
                    '5',
                    'Fuel System',
                    '----------',
                    '----------',
                  ],
                  <String>[
                    '5.1',
                    'Remove the fuel filter covers.',
                    b51,
                    '${inspection.sipB51Initials}'
                  ],
                  <String>[
                    '5.2',
                    'Visual inspection of fuel hoses and connections for condition, leak and security. Visual inspection of fireproof insulation for conditions, integrity, chafing and security.',
                    b52,
                    '${inspection.sipB52Initials}'
                  ],
                  <String>[
                    '5.3',
                    'Check and clean the strainers. Replace fuel filters.',
                    b53,
                    '${inspection.sipB53Initials}'
                  ],
                  <String>[
                    '5.4',
                    'Check the vent hoses at the bottom of fuselage for damage, obstruction and blockage.',
                    b54,
                    '${inspection.sipB54Initials}'
                  ],
                  <String>[
                    '5.5',
                    'Install the fuel filter covers.',
                    b55,
                    '${inspection.sipB55Initials}'
                  ],
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
              buildHeaderPeriodic1(),
              pw.SizedBox(width: 40),
              //display table
              pw.Table.fromTextArray(
                context: context,
                data: <List<dynamic>>[
                  <String>[
                    '\n\n\n\n\n',
                    'Engine Group (continued)',
                    'Findings',
                    'Initials'
                  ],
                  <String>[
                    '6',
                    'Oil System',
                    '----------',
                    '----------',
                  ],
                  <String>[
                    '6.1',
                    'Visual inspection of oil tank for condition, attachment and security.',
                    b61,
                    '${inspection.sipB61Initials}'
                  ],
                  <String>[
                    '6.2',
                    'Visual inspection of oil cooler and oil thermostat for condition, leak, attachment and security.',
                    b62,
                    '${inspection.sipB62Initials}'
                  ],
                  <String>[
                    '6.3',
                    'Visual inspection of hoses and connections for condition, leak and security. Visual inspection of fireproof insulation for conditions, integrity, chafing and security.',
                    b63,
                    '${inspection.sipB63Initials}'
                  ],
                  <String>[
                    '6.4',
                    'Check oil level. Add oil if necessary.',
                    b64,
                    '${inspection.sip64Initials}'
                  ],
                  <String>[
                    '7',
                    'Cooling System',
                    '----------',
                    '----------',
                  ],
                  <String>[
                    '7.1',
                    'Visual inspection of water radiator and water thermostat for condition, leak, attachment and security.',
                    b71,
                    '${inspection.sipB71Initials}'
                  ],
                  <String>[
                    '7.2',
                    'Visual inspection of hoses and tubes for condition, leak, attachment and security.',
                    b72,
                    '${inspection.sipB72Initials}'
                  ],
                  <String>[
                    '7.3',
                    'Visual inspection of overflow bottle for condition, attachment and security.',
                    b73,
                    '${inspection.sipB73Initials}'
                  ],
                  <String>[
                    '7.4',
                    'Check the coolant level in the expansion tank and overflow bottle. Add coolant if necessary.',
                    b74,
                    '${inspection.sipB74Initials}'
                  ],
                  <String>[
                    '7.5',
                    'Check the coolant condition. Change as necessary.',
                    b75,
                    '${inspection.sipB75Initials}'
                  ],
                  <String>[
                    '8',
                    'induction System',
                    '----------',
                    '----------',
                  ],
                  <String>[
                    '8.1',
                    'Visual inspection of carburetors, drip trays and control cables for condition, attachment and security.',
                    b81,
                    '${inspection.sipB81Initials}'
                  ],
                  <String>[
                    '8.2',
                    'Visual inspection of airbox and airbox-carburetors hoses for condition, attachment and security.',
                    b82,
                    '${inspection.sipB82Initials}'
                  ],
                  <String>[
                    '8.3',
                    'Visual inspection air filter holder for condition, attachment and security. Check the operation of carburetor preheating control.',
                    b83,
                    '${inspection.sipB83Initials}'
                  ],
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
                  <String>[
                    '8.4',
                    'Visual inspection of air filter for condition, contamination, attachment and security. Clean or replace impure filter.',
                    b84,
                    '${inspection.sipB84Initials}'
                  ],
                  <String>[
                    '8.5',
                    'Visual inspection of intake manifold and air hoses for condition, attachment and security.',
                    b85,
                    '${inspection.sipB85Initials}'
                  ],
                  <String>[
                    '8.6',
                    'Visual inspection of shroud and air hose for condition, attachment and security.',
                    b86,
                    '${inspection.sipB86Initials}'
                  ],
                  <String>[
                    '9',
                    'Exhaust System',
                    '----------',
                    '----------',
                  ],
                  <String>[
                    '9.1',
                    'Visual inspection of muffler for condition, attachment, cracks, corrosion, deformations or damages and security.',
                    b91,
                    '${inspection.sipB91Initials}'
                  ],
                  <String>[
                    '9.2',
                    'Visual inspection of exhaust pipes for condition, attachment, cracks, corrosion, deformations or damages and security.',
                    b92,
                    '${inspection.sipB92Initials}'
                  ],
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

    return PdfApi.saveDocument(name: 'Maintenance Task Card.pdf', pdf: pdf);
  }

  static Widget buildHeaderScheduled() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pw.Text(
            'SCHEDULED INSPECTION PROGRAM\nRefer: Cessna Service Manual\n\n\n',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: PdfColors.black),
          ),
        ],
      );
  static Widget buildHeaderPeriodic() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pw.Text(
            'PERIODIC INSPECTION PROGRAM\nRefer: Cessna Service Manual\n\n\n',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: PdfColors.black),
          ),
        ],
      );
  static Widget buildHeaderPeriodic1() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Refer: Cessna Service Manual\n',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: PdfColors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              pw.Text(
                'PERIODIC INSPECTIONS\n\n\n',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: PdfColors.black),
              ),
            ],
          ),
        ],
      );
}
