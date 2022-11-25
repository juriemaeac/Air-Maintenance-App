import 'dart:io';
import 'package:airapp/database/maintenanceTask_model.dart';
import 'package:airapp/pdfMaintenanceTask/maintenance_pdf_api.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfMaintenanceApi {
  //
  static Future<File> generate(MaintenanceTask maintenance) async {
    final pdf = Document();
    final imageAvionics =
        await rootBundle.loadString('assets/images/avionicsLogo.svg');
    final imageSchool =
        await rootBundle.loadString('assets/images/philscaLogo.svg');

    getRating(String rating) {
      String equivRating = "";
      if (rating == "0") {
        equivRating = "Satisfactory";
      } else if (rating == "1") {
        equivRating = "Not Satisfactory";
      } else {
        equivRating = "N/A";
      }
      return equivRating;
    }

    String a1 = getRating(maintenance.findingsA1 ?? "");
    String a2 = getRating(maintenance.findingsA2 ?? "");
    String a3 = getRating(maintenance.findingsA3 ?? "");
    String a4 = getRating(maintenance.findingsA4 ?? "");
    String a5 = getRating(maintenance.findingsA5 ?? "");
    String a6 = getRating(maintenance.findingsA6 ?? "");

    pdf.addPage(
      MultiPage(
        header: (context) {
          return Container(
            alignment: Alignment.center,
            child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgImage(svg: imageSchool, width: 50, height: 50),
                  pw.SizedBox(width: 30),
                  pw.Column(children: [
                    pw.Text(
                      'Republic of the Philippines\nPhilippine State College of Aeronautics',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    pw.Text(
                      'AVT DEPARTMENT',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      'Piccio Garden, Villamor Pasay City\n\n',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    pw.Text(
                      'MAINTEANCE TASK CARD\n\n',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  pw.SizedBox(width: 30),
                  SvgImage(svg: imageAvionics, width: 60, height: 60),
                ]),
          );
        },
        margin: pw.EdgeInsets.all(50),
        build: (context) => [
          pw.Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Section A\n\n',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black),
                  ),
                ],
              ),
              pw.SizedBox(width: 10),
              pw.Table.fromTextArray(
                context: context,
                headerCount: 0,
                data: <List<dynamic>>[
                  <String>[
                    'USER PhilSCA\n\n',
                    'TASK CARD NUMBER\n\n${maintenance.taskCardNumber}',
                    'TASKCARD SPECIFICATION\n\n ${maintenance.taskCardSpecification}',
                    'REVISION 00\n\n ${maintenance.taskCardRevision}',
                    'REV. DATE',
                  ],
                ],
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                },
                cellHeight: 35,
              ),
              pw.Table.fromTextArray(
                context: context,
                headerCount: 0,
                data: <List<dynamic>>[
                  <String>[
                    'W/O SPECIFICATION\n\n${maintenance.taskCardSpecification}',
                    'W/O SCHEDULE START\n\n${maintenance.woScheduleStart}',
                    'LOCATION\n\n${maintenance.location}',
                  ],
                ],
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                },
                cellHeight: 35,
              ),
              pw.Table.fromTextArray(
                context: context,
                headerCount: 0,
                data: <List<dynamic>>[
                  <String>[
                    'AIRCRAFT TYPE\n\n${maintenance.aircraftType}',
                    'A/C REG [If applicable]\n\n${maintenance.acReg}',
                    'A/C Serial No. [If applicable]\n\n${maintenance.acSerial}',
                  ],
                ],
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                },
                cellHeight: 35,
              ),
              pw.Table.fromTextArray(
                context: context,
                headerCount: 0,
                data: <List<dynamic>>[
                  <String>[
                    'TASK REFERENCE:',
                    'AREA\n\n${maintenance.area}',
                    'STUDENT\n\n${maintenance.student}',
                    'INSTRUCTOR\n\n${maintenance.instructor}',
                    'TASKCARD TYPE:\n\n${maintenance.taskCardType}',
                  ],
                ],
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(2),
                },
                cellHeight: 35,
              ),
              pw.Table.fromTextArray(
                context: context,
                headerCount: 0,
                data: <List<dynamic>>[
                  <String>[
                    'ATA\n\n${maintenance.ata}',
                    'MM Effectivity\n\n${maintenance.mmEffectivity}',
                    'IPC Effectivity\n\n${maintenance.ipcEffectivity}',
                    'MAN-HOURS\n\n${maintenance.manHours}',
                    'MEN\n\n${maintenance.men}',
                    'USER\n\n${maintenance.user}',
                  ],
                ],
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                  5: FlexColumnWidth(1),
                },
                cellHeight: 35,
              ),
              pw.Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Take Note: If not applicable put N/A.\n\nNotes:\n\nAttachments: Cessna 150/152 or Specific aircraft that will be used in the application\nService Checklist Rev.___ dtd dd/mm/year\n\n\n',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                ],
              ),
              pw.Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                pw.Text('A/C REG: ',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black)),
                pw.Text('${maintenance.acReg}  ',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black)),
                pw.Text('USER: ',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black)),
                pw.Text('${maintenance.user}  ',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black)),
                pw.Text('DATE: ',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black)),
                pw.Text('${maintenance.dateB}  \n\n',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black)),
              ]),
              pw.Table.fromTextArray(
                context: context,
                headerCount: 0,
                data: <List<dynamic>>[
                  <String>[
                    'ITEM',
                    'User/Action Description',
                    'STUDENT\n\n${maintenance.studentB}',
                    'INSTRUCTOR\n\n${maintenance.instructorB}',
                    'INSPECTOR [AVIONIC/MECHANIC]\n\n${maintenance.inspectorB}',
                  ],
                ],
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(0.5),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(2),
                },
                cellHeight: 35,
              ),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                context: context,
                headerCount: 0,
                data: <List<dynamic>>[
                  <String>[
                    'No. ${maintenance.itemNum}\n\nMh',
                    'ACCOMPLISH CESSNA 150/152 SERVICE TASKCARD/CHECKLIST IN ACCORDANCE WITH ATTACHED\n\n${maintenance.userActionDescription}',
                    'SUBMITTED BY: [Attached Signature]\n\n${maintenance.submittedBy}',
                    'REVIEWED AND CORRECT BY:[Attached Signature]\n\n${maintenance.reviewedBy}',
                  ],
                ],
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(0.5),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1.5),
                  3: FlexColumnWidth(1.5),
                },
                cellHeight: 35,
              ),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                context: context,
                headerCount: 0,
                data: <List<dynamic>>[
                  <String>[
                    'COMPLETED BY:\n\n${maintenance.completedBy}',
                    'DATE OF COMPLETION:\n\n${maintenance.dateCompletionB}',
                    'DEPARTMENT:\n\n${maintenance.departmentB}',
                  ],
                ],
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(1.5),
                  1: FlexColumnWidth(1.5),
                  2: FlexColumnWidth(1.5),
                },
                cellHeight: 35,
              ),
              pw.SizedBox(height: 30),
              pw.Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  pw.Text('\n\nCESSNA 150/152 SERVICE CHECK/TASK - CHECKLIST'),
                  pw.Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pw.Text('A/C REG: ',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text('${maintenance.acReg}  ',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text('USER: ',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text('${maintenance.user}  ',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text('DATE: ',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text('${maintenance.dateB}  \n\n',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: PdfColors.black)),
                      ]),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    pdf.addPage(
      MultiPage(
        header: (context) {
          return Container(
            alignment: Alignment.center,
            child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgImage(svg: imageSchool, width: 50, height: 50),
                  pw.SizedBox(width: 30),
                  pw.Column(children: [
                    pw.Text(
                      'Republic of the Philippines\nPhilippine State College of Aeronautics',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    pw.Text(
                      'AVT DEPARTMENT',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      'Piccio Garden, Villamor Pasay City\n\n',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    pw.Text(
                      'MAINTEANCE TASK CARD\n\n',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  pw.SizedBox(width: 30),
                  SvgImage(svg: imageAvionics, width: 60, height: 60),
                ]),
          );
        },
        margin: pw.EdgeInsets.all(50),
        build: (context) => [
          pw.Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Checklist Notes:\n\n'),
                ],
              ),
              pw.Text(
                '1.	This checklist/task card is applicable to Cessna 150/152 or Airbus A320s Family.\n2.	Review the checklist before proceeding to this activity.\n3.	Read the Application guide/instructions of this application before proceeding to the next section. \n4.	Make sure to input your signature after completing the activity.\n\n',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Reminders:\n\n',
                  ),
                ],
              ),
              pw.Text(
                '-	Ensure that the valve toggles and cockpit switches are situated properly.\n-	Turn on the batteries and note the fuel gauge readings for later comparison with your visual assessment.\n-	Make sure the magnetos are off and turn the battery off.\n-	Make sure your seatbelts are secure and free of fraying or loose objects in the cockpit.\n-	Learn where the spare fuses are and how many there are if your plane has them.',
              ),
              pw.SizedBox(height: 30),
              pw.Text(
                  'SECTION B\n\nWALK AROUND - FUSELAGE, WINGS, TAILS\n\nRefer: D2064-1-13 - MODEL 152 SERIES\n\nCheck the fuselage, wings, stabilizers, tail, radome, aerials, lightning diverter strips, static dischargers and control surfaces for the following:\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              pw.Text(
                  '* Check for the condition, damage, and leakage\n* Check that access / service panels are locked securely and that inlets/outlets are free from obstruction.\n* Pay particular attention to the navigation antennas, i.e, GPS, VOR, and DME and fuselage skin in the vicinity of these antennas.\n* Check the overboard discharge indicators for the crew oxygen bottle (fwd fuselage RH side) and APU fire extinguisher bottle (lower aft fuselage)\n* Check for fluid leakage in the drain masts/drains in the APU area.\n* Check for the condition of passenger / crew doors, emergency exit doors and cargo doors.\n* Check all pitot tubes, static ports, and angle-of-attack sensors and the surrounding fuselage skin for damage, deformation, and obstruction.\n\n'),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Findings:  ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  pw.Text('$a1\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Indicate logbook:  ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  pw.Text('${maintenance.findingsLogbook1}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Description of the problem and Solution:\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('${maintenance.findingsSolution1}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Initials/Recommendations/Inspection Result:\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('${maintenance.findingsResult1}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.SizedBox(height: 30),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'WALK-AROUND - EXTERIOR INSPECTION\n\n',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              pw.Text(
                  'Refer: Cessna Model 150-Manual Figure 1-1\n\nPerform the following tasks: General Aircraft Condition, Filler Caps  and Inspection Plates : Perform a visual check for condition and damage\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text(
                      '* Landing gears and doors: Perform a visual check for condition and damage\n* Shock absorber/strut: Perform a visual check for leaks and extension\n\n'),
                ],
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Findings:  ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  pw.Text('$a2\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [],
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Indicate logbook:  ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  pw.Text('${maintenance.findingsLogbook2}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Description of the problem and Solution:\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('${maintenance.findingsSolution2}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Initials/Recommendations/Inspection Result:\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('${maintenance.findingsResult2}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.SizedBox(height: 30),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'CD2064-1-13 - MODEL 152 MANUAL (16-12 to 31)\n\nCheck Battery System - Troubleshooting the battery:\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              pw.Text(
                'Note: The battery is 24 volts and thru 15280459. A1522759 and FA1520346 a 14 ampere-hour capacity battery is installed as standard, a 17 ampere-hour capacity battery is optional Beginning with 15280460. A1522760 and FA1520347 the battery is 24 volts with a 12.75 ampere-hour capacity as standard and a 15.5 ampere-hour capacity battery as optional. The battery is mounted on the forward side of the firewall and is equipped with non-spill caps\n\n',
                textAlign: pw.TextAlign.justify,
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Check the Alternator - ENGINE NOT RUNNING.\n\nRefer: CesRefer: CD2064-1-13 - MODEL 152 MANUAL ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text(
                      '(16-42. TROUBLESHOOTING -- ALTERNATOR SYSTEM (BEGINNING 1979 MODELS))\n\n'),
                ],
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Findings:  ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  pw.Text('$a3\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Indicate logbook:\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  pw.Text('${maintenance.findingsLogbook3}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Description of the problem and Solution:\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('${maintenance.findingsSolution3}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Initials/Recommendations/Inspection Result:\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('${maintenance.findingsResult3}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.SizedBox(height: 30),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'CD2064-1-13 - MODEL 152 MANUAL (16-12;16-32)\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text(
                      'Perform a general visual inspection of battery and alternator system\n\n'),
                ],
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Findings:  ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  pw.Text('$a4\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Indicate logbook:  ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  pw.Text('${maintenance.findingsLogbook4}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Description of the problem and Solution:\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('${maintenance.findingsSolution4}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Initials/Recommendations/Inspection Result:\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('${maintenance.findingsResult4}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.SizedBox(height: 30),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Check the Lighting System - 16-48. AIRCRAFT LIGHTING SYSTEM\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Findings:  ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  pw.Text('$a5\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Indicate logbook:  ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  pw.Text('${maintenance.findingsLogbook5}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Description of the problem and Solution:\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('${maintenance.findingsSolution5}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Initials/Recommendations/Inspection Result:\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('${maintenance.findingsResult5}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.SizedBox(height: 30),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Refer: CD2064-1-13 - MODEL 152 MANUAL (16-48)\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text(
                      'Flashing Beacon does not light - Refer to 16-50 Troubleshooting \n\n'),
                ],
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text('Findings:   ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  pw.Text(
                    '$a6\n\n',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text('Indicate logbook:  ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  pw.Text(
                    '${maintenance.findingsLogbook6}\n\n',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text('Description of the problem and Solution:\n\n  ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('${maintenance.findingsSolution6}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('Initials/Recommendations/Inspection Result:\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.Text('${maintenance.findingsResult6}\n\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    return MaintenancePdfApi.saveDocument(
        name: 'Maintenance Task Card.pdf', pdf: pdf);
  }
}
