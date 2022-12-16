import 'dart:io';
import 'dart:typed_data';

import 'package:airapp/constants.dart';
import 'package:airapp/formsInspection/formCard.dart';
import 'package:airapp/home/manual/pdf/pdfViewer.dart';
import 'package:airapp/manualList.dart';
import 'package:airapp/navBar.dart';
import 'package:flutter/material.dart';
import 'package:airapp/authentication/login.dart';
import 'package:hive/hive.dart';
import 'package:signature/signature.dart';

import '../boxes/boxInspection.dart';
import '../database/scheduledInspection_model.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> with ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? accountID = "n/a";
  String? inspectionDate = "n/a";

  Uint8List? exportedImageStudent;
  Uint8List? exportedImageInstructor;

  SignatureController studentSignature = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.red,
    exportBackgroundColor: Colors.yellowAccent,
  );

  SignatureController instructorSignature = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.red,
    exportBackgroundColor: Colors.yellowAccent,
  );

  @override
  void initState() {
    super.initState();
    Hive.openBox<ScheduledInspection>(HiveBoxesInspection.inspection);
    accountID = userCredential.accountID;
    getDate();
  }

  void getDate() {
    DateTime date = DateTime.now();
    var dateTime = DateTime.parse(date.toString());
    var format1 =
        "${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}";
    inspectionDate = format1;
  }

  int? sipA11Findings = 0;
  String? sipA11Initials = "No Comment";
  _updateFindings11a(int findings) {
    setState(() => sipA11Findings = findings);
  }

  _updateInitials11a(String initials) {
    setState(() => sipA11Initials = initials);
  }

  int? sipA12Findings = 0;
  String? sipA12Initials = "No Comment";
  _updateFindings12a(int findings) {
    setState(() => sipA12Findings = findings);
  }

  _updateInitials12a(String initials) {
    setState(() => sipA12Initials = initials);
  }

  int? sipA13Findings = 0;
  String? sipA13Initials = "No Comment";
  _updateFindings13a(int findings) {
    setState(() => sipA13Findings = findings);
  }

  _updateInitials13a(String initials) {
    setState(() => sipA13Initials = initials);
  }

  int? sipA14Findings = 0;
  String? sipA14Initials = "No Comment";
  _updateFindings14a(int findings) {
    setState(() => sipA14Findings = findings);
  }

  _updateInitials14a(String initials) {
    setState(() => sipA14Initials = initials);
  }

  int? sipA2Findings = 0;
  String? sipA2Initials = "No Comment";
  _updateFindings2(int findings) {
    setState(() => sipA2Findings = findings);
  }

  _updateInitials2(String initials) {
    setState(() => sipA2Initials = initials);
  }

  int? sipA3Findings = 0;
  String? sipA3Initials = "No Comment";
  _updateFindings3(int findings) {
    setState(() => sipA3Findings = findings);
  }

  _updateInitials3(String initials) {
    setState(() => sipA3Initials = initials);
  }

  int? sipA4Findings = 0;
  String? sipA4Initials = "No Comment";
  _updateFindings4(int findings) {
    setState(() => sipA4Findings = findings);
  }

  _updateInitials4(String initials) {
    setState(() => sipA4Initials = initials);
  }

  int? sipA5Findings = 0;
  String? sipA5Initials = "No Comment";
  _updateFindings5(int findings) {
    setState(() => sipA5Findings = findings);
  }

  _updateInitials5(String initials) {
    setState(() => sipA5Initials = initials);
  }

  int? sipA6Findings = 0;
  String? sipA6Initials = "No Comment";
  _updateFindings6(int findings) {
    setState(() => sipA6Findings = findings);
  }

  _updateInitials6(String initials) {
    setState(() => sipA6Initials = initials);
  }

  int? sipA7Findings = 0;
  String? sipA7Initials = "No Comment";
  _updateFindings7(int findings) {
    setState(() => sipA7Findings = findings);
  }

  _updateInitials7(String initials) {
    setState(() => sipA7Initials = initials);
  }

  //--------------------------------------------------------//  //--------------------------------------------------------//
  int? sipB1Findings = 0;
  String? sipB1Initials = "No Comment";
  _updateFindings8(int findings) {
    setState(() => sipB1Findings = findings);
  }

  _updateInitials8(String initials) {
    setState(() => sipB1Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB21Findings = 0;
  String? sipB21Initials = "No Comment";
  _updateFindings10(int findings) {
    setState(() => sipB21Findings = findings);
  }

  _updateInitials10(String initials) {
    setState(() => sipB21Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB22Findings = 0;
  String? sipB22Initials = "No Comment";
  _updateFindings11(int findings) {
    setState(() => sipB22Findings = findings);
  }

  _updateInitials11(String initials) {
    setState(() => sipB22Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB23Findings = 0;
  String? sipB23Initials = "No Comment";
  _updateFindings12(int findings) {
    setState(() => sipB23Findings = findings);
  }

  _updateInitials12(String initials) {
    setState(() => sipB23Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB24Findings = 0;
  String? sipB24Initials = "No Comment";
  _updateFindings13(int findings) {
    setState(() => sipB24Findings = findings);
  }

  _updateInitials13(String initials) {
    setState(() => sipB24Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB25Findings = 0;
  String? sipB25Initials = "No Comment";
  _updateFindings14(int findings) {
    setState(() => sipB25Findings = findings);
  }

  _updateInitials14(String initials) {
    setState(() => sipB25Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB31Findings = 0;
  String? sipB31Initials = "No Comment";
  _updateFindings16(int findings) {
    setState(() => sipB31Findings = findings);
  }

  _updateInitials16(String initials) {
    setState(() => sipB31Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB32Findings = 0;
  String? sipB32Initials = "No Comment";
  _updateFindings17(int findings) {
    setState(() => sipB32Findings = findings);
  }

  _updateInitials17(String initials) {
    setState(() => sipB32Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB41Findings = 0;
  String? sipB41Initials = "No Comment";
  _updateFindings19(int findings) {
    setState(() => sipB41Findings = findings);
  }

  _updateInitials19(String initials) {
    setState(() => sipB41Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB42Findings = 0;
  String? sipB42Initials = "No Comment";
  _updateFindings20(int findings) {
    setState(() => sipB42Findings = findings);
  }

  _updateInitials20(String initials) {
    setState(() => sipB42Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB43Findings = 0;
  String? sipB43Initials = "No Comment";
  _updateFindings21(int findings) {
    setState(() => sipB43Findings = findings);
  }

  _updateInitials21(String initials) {
    setState(() => sipB43Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB44Findings = 0;
  String? sipB44Initials = "No Comment";
  _updateFindings22(int findings) {
    setState(() => sipB44Findings = findings);
  }

  _updateInitials22(String initials) {
    setState(() => sipB44Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB51Findings = 0;
  String? sipB51Initials = "No Comment";
  _updateFindings24(int findings) {
    setState(() => sipB51Findings = findings);
  }

  _updateInitials24(String initials) {
    setState(() => sipB51Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB52Findings = 0;
  String? sipB52Initials = "No Comment";
  _updateFindings25(int findings) {
    setState(() => sipB52Findings = findings);
  }

  _updateInitials25(String initials) {
    setState(() => sipB52Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB53Findings = 0;
  String? sipB53Initials = "No Comment";
  _updateFindings26(int findings) {
    setState(() => sipB53Findings = findings);
  }

  _updateInitials26(String initials) {
    setState(() => sipB53Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB54Findings = 0;
  String? sipB54Initials = "No Comment";
  _updateFindings27(int findings) {
    setState(() => sipB54Findings = findings);
  }

  _updateInitials27(String initials) {
    setState(() => sipB54Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB55Findings = 0;
  String? sipB55Initials = "No Comment";
  _updateFindings28(int findings) {
    setState(() => sipB55Findings = findings);
  }

  _updateInitials28(String initials) {
    setState(() => sipB55Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB61Findings = 0;
  String? sipB61Initials = "No Comment";
  _updateFindings30(int findings) {
    setState(() => sipB61Findings = findings);
  }

  _updateInitials30(String initials) {
    setState(() => sipB61Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB62Findings = 0;
  String? sipB62Initials = "No Comment";
  _updateFindings31(int findings) {
    setState(() => sipB62Findings = findings);
  }

  _updateInitials31(String initials) {
    setState(() => sipB62Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB63Findings = 0;
  String? sipB63Initials = "No Comment";
  _updateFindings32(int findings) {
    setState(() => sipB63Findings = findings);
  }

  _updateInitials32(String initials) {
    setState(() => sipB63Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB64Findings = 0;
  String? sipB64Initials = "No Comment";
  _updateFindings33(int findings) {
    setState(() => sipB64Findings = findings);
  }

  _updateInitials33(String initials) {
    setState(() => sipB64Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB71Findings = 0;
  String? sipB71Initials = "No Comment";
  _updateFindings35(int findings) {
    setState(() => sipB71Findings = findings);
  }

  _updateInitials35(String initials) {
    setState(() => sipB71Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB72Findings = 0;
  String? sipB72Initials = "No Comment";
  _updateFindings36(int findings) {
    setState(() => sipB72Findings = findings);
  }

  _updateInitials36(String initials) {
    setState(() => sipB72Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB73Findings = 0;
  String? sipB73Initials = "No Comment";
  _updateFindings37(int findings) {
    setState(() => sipB73Findings = findings);
  }

  _updateInitials37(String initials) {
    setState(() => sipB73Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB74Findings = 0;
  String? sipB74Initials = "No Comment";
  _updateFindings38(int findings) {
    setState(() => sipB74Findings = findings);
  }

  _updateInitials38(String initials) {
    setState(() => sipB74Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB75Findings = 0;
  String? sipB75Initials = "No Comment";
  _updateFindings39(int findings) {
    setState(() => sipB75Findings = findings);
  }

  _updateInitials39(String initials) {
    setState(() => sipB75Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB81Findings = 0;
  String? sipB81Initials = "No Comment";
  _updateFindings41(int findings) {
    setState(() => sipB81Findings = findings);
  }

  _updateInitials41(String initials) {
    setState(() => sipB81Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB82Findings = 0;
  String? sipB82Initials = "No Comment";
  _updateFindings42(int findings) {
    setState(() => sipB82Findings = findings);
  }

  _updateInitials42(String initials) {
    setState(() => sipB82Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB83Findings = 0;
  String? sipB83Initials = "No Comment";
  _updateFindings43(int findings) {
    setState(() => sipB83Findings = findings);
  }

  _updateInitials43(String initials) {
    setState(() => sipB83Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB84Findings = 0;
  String? sipB84Initials = "No Comment";
  _updateFindings44(int findings) {
    setState(() => sipB84Findings = findings);
  }

  _updateInitials44(String initials) {
    setState(() => sipB84Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB85Findings = 0;
  String? sipB85Initials = "No Comment";
  _updateFindings45(int findings) {
    setState(() => sipB85Findings = findings);
  }

  _updateInitials45(String initials) {
    setState(() => sipB85Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB86Findings = 0;
  String? sipB86Initials = "No Comment";
  _updateFindings46(int findings) {
    setState(() => sipB86Findings = findings);
  }

  _updateInitials46(String initials) {
    setState(() => sipB86Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB91Findings = 0;
  String? sipB91Initials = "No Comment";
  _updateFindings48(int findings) {
    setState(() => sipB91Findings = findings);
  }

  _updateInitials48(String initials) {
    setState(() => sipB91Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB92Findings = 0;
  String? sipB92Initials = "No Comment";
  _updateFindings49(int findings) {
    setState(() => sipB92Findings = findings);
  }

  _updateInitials49(String initials) {
    setState(() => sipB92Initials = initials);
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellowAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Inspection Form',
                style:
                    AppTextStyles.title.copyWith(color: AppColors.blueAccent)),
            GestureDetector(
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ManualList()));
                },
                child: Text('Manual',
                    style: AppTextStyles.title
                        .copyWith(color: AppColors.blueAccent)))
          ],
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Scrollbar(
            thumbVisibility: true, //always show scrollbar
            //trackVisibility: true,
            interactive: true,
            thickness: 10, //width of scrollbar
            radius: Radius.circular(20), //corner radius of scrollbar
            scrollbarOrientation:
                ScrollbarOrientation.right, //which side to show scrollbar
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //1
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Scheduled Inspection",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.headings
                              .copyWith(color: AppColors.yellowAccent)),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("1. Check status of:",
                          style: AppTextStyles.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        children: [
                          FormCard(
                            question: 'Applicable Airworthiness Directives',
                            number: '1.1',
                            findings: _updateFindings11a,
                            initials: _updateInitials11a,
                          ),
                          FormCard(
                            question: 'Applicable Service Bulletins',
                            number: '1.2',
                            findings: _updateFindings12a,
                            initials: _updateInitials12a,
                          ),
                          FormCard(
                            question: 'Log Books (reported problems)',
                            number: '1.3',
                            findings: _updateFindings13a,
                            initials: _updateInitials13a,
                          ),
                          FormCard(
                            question: 'Registration Certificate',
                            number: '1.4',
                            findings: _updateFindings14a,
                            initials: _updateInitials14a,
                          ),
                        ],
                      ),
                    ),
                    //2-7
                    FormCard(
                      question:
                          'Inspect life limited parts (replaced, overhauled)',
                      number: '2',
                      findings: _updateFindings2,
                      initials: _updateInitials2,
                    ),
                    FormCard(
                      question:
                          'Drain the fuel tanks. Inspect drain valves for condition, obstruction and blockage.',
                      number: '3',
                      findings: _updateFindings3,
                      initials: _updateInitials3,
                    ),
                    FormCard(
                      question:
                          'Clean the aircraft fully (exterior, interior).',
                      number: '4',
                      findings: _updateFindings4,
                      initials: _updateInitials4,
                    ),
                    FormCard(
                      question:
                          'Visual inspection of interior marking and placards for condition (legibility and intactness).',
                      number: '5',
                      findings: _updateFindings5,
                      initials: _updateInitials5,
                    ),
                    FormCard(
                      question:
                          'Visual inspection of exterior marking and placards for condition (legibility and intactness).',
                      number: '6',
                      findings: _updateFindings6,
                      initials: _updateInitials6,
                    ),
                    FormCard(
                      question: 'Jack the aircraft.',
                      number: '7',
                      findings: _updateFindings7,
                      initials: _updateInitials7,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Periodic Inspection",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.headings
                              .copyWith(color: AppColors.yellowAccent)),
                    ),
                    const SizedBox(height: 15),
                    FormCard(
                      question: 'Engine Inspection',
                      number: '1',
                      findings: _updateFindings8,
                      initials: _updateInitials8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("2. Engine Cowlings and Firewall",
                          style: AppTextStyles.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        children: [
                          FormCard(
                            question:
                                'Remove engine cowlings. Clean and perform visual inspection for cracks, damages, loose or missing fasteners. Inspect the condition of oil inspection door.',
                            number: '2.1',
                            findings: _updateFindings10,
                            initials: _updateInitials10,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of engine cowlings fireproofing for condition and attachment (only bottom cowling)',
                            number: '2.2',
                            findings: _updateFindings11,
                            initials: _updateInitials11,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of firewall and seals for cracks, condition and attachment.',
                            number: '2.3',
                            findings: _updateFindings12,
                            initials: _updateInitials12,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of landing lights for condition, attachment and security',
                            number: '2.4',
                            findings: _updateFindings13,
                            initials: _updateInitials13,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of all parts installed at firewall for condition, attachment and security.',
                            number: '2.5',
                            findings: _updateFindings14,
                            initials: _updateInitials14,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("3. Battery", style: AppTextStyles.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        children: [
                          FormCard(
                            question:
                                'Remove battery cover. Visual inspection of terminals and cables corrosion, tightening and condition. Inspection of battery charge condition',
                            number: '3.1',
                            findings: _updateFindings16,
                            initials: _updateInitials16,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of battery attachment and condition of fireproofing. Install battery cover.',
                            number: '3.2',
                            findings: _updateFindings17,
                            initials: _updateInitials17,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child:
                          Text("4. Engine Mount", style: AppTextStyles.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        children: [
                          FormCard(
                            question:
                                'Visual inspection of engine mounts for weld cracks, bending, corrosion and distortion.',
                            number: '4.1',
                            findings: _updateFindings19,
                            initials: _updateInitials19,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of rubber silent blocks for cracks, excessive deformation and condition.',
                            number: '4.2',
                            findings: _updateFindings20,
                            initials: _updateInitials20,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of engine attachment, bolts and nuts security (engine — engine mount, engine mount - firewall)',
                            number: '4.3',
                            findings: _updateFindings21,
                            initials: _updateInitials21,
                          ),
                          FormCard(
                            question:
                                'Remove the engine mount attaching bolts. Visual inspection of bolts for cracks, deformation and damage. Install the bolts and inspect for proper nut torque.',
                            number: '4.4',
                            findings: _updateFindings22,
                            initials: _updateInitials22,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("5. Fuel System", style: AppTextStyles.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        children: [
                          FormCard(
                            question: 'Remove the fuel filter covers.',
                            number: '5.1',
                            findings: _updateFindings24,
                            initials: _updateInitials24,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of fuel hoses and connections for condition, leak and security. Visual inspection of fireproof insulation for conditions, integrity, chafing and security',
                            number: '5.2',
                            findings: _updateFindings25,
                            initials: _updateInitials25,
                          ),
                          FormCard(
                            question:
                                'Check and clean the strainers. Replace fuel filters.',
                            number: '5.3',
                            findings: _updateFindings26,
                            initials: _updateInitials26,
                          ),
                          FormCard(
                            question:
                                'Check the vent hoses at the bottom of fuselage for damage, obstruction and blockage.',
                            number: '5.4',
                            findings: _updateFindings27,
                            initials: _updateInitials27,
                          ),
                          FormCard(
                            question: 'Install the fuel filter covers.',
                            number: '5.5',
                            findings: _updateFindings28,
                            initials: _updateInitials28,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("6. Oil System", style: AppTextStyles.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        children: [
                          FormCard(
                            question:
                                'Visual inspection of oil tank for condition, attachment and security.',
                            number: '6.1',
                            findings: _updateFindings30,
                            initials: _updateInitials30,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of oil cooler and oil thermostat for condition, leak, attachment and security.',
                            number: '6.2',
                            findings: _updateFindings31,
                            initials: _updateInitials31,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of hoses and connections for condition, leak and security. Visual inspection of fireproof insulation for conditions, integrity, chafing and security.',
                            number: '6.3',
                            findings: _updateFindings32,
                            initials: _updateInitials32,
                          ),
                          FormCard(
                            question: 'Check oil level. Add oil if necessary.',
                            number: '6.4',
                            findings: _updateFindings33,
                            initials: _updateInitials33,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child:
                          Text("7. Cooling System", style: AppTextStyles.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        children: [
                          FormCard(
                            question:
                                'Visual inspection of water radiator and water thermostat for condition, leak, attachment and security.',
                            number: '7.1',
                            findings: _updateFindings35,
                            initials: _updateInitials35,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of hoses and tubes for condition, leak, attachment and security.',
                            number: '7.2',
                            findings: _updateFindings36,
                            initials: _updateInitials36,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of overflow bottle for condition, attachment and security.',
                            number: '7.3',
                            findings: _updateFindings37,
                            initials: _updateInitials37,
                          ),
                          FormCard(
                            question:
                                'Check the coolant level in the expansion tank and overflow bottle. Add coolant if necessary.',
                            number: '7.4',
                            findings: _updateFindings38,
                            initials: _updateInitials38,
                          ),
                          FormCard(
                            question:
                                'Check the coolant condition. Change as necessary.',
                            number: '7.5',
                            findings: _updateFindings39,
                            initials: _updateInitials39,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("8. Induction System",
                          style: AppTextStyles.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        children: [
                          FormCard(
                            question:
                                'Visual inspection of carburetors, drip trays and control cables for condition, attachment and security.',
                            number: '8.1',
                            findings: _updateFindings41,
                            initials: _updateInitials41,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of airbox and airbox-carburetors hoses for condition, attachment and security.',
                            number: '8.2',
                            findings: _updateFindings42,
                            initials: _updateInitials42,
                          ),
                          FormCard(
                            question:
                                'Visual inspection air filter holder for condition, attachment and security. Check the operation of carburetor preheating control.',
                            number: '8.3',
                            findings: _updateFindings43,
                            initials: _updateInitials43,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of air filter for condition, contamination, attachment and security. Clean or replace impure filter.',
                            number: '8.4',
                            findings: _updateFindings44,
                            initials: _updateInitials44,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of intake manifold and air hoses for condition, attachment and security.',
                            number: '8.5',
                            findings: _updateFindings45,
                            initials: _updateInitials45,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of shroud and air hose for condition, attachment and security.',
                            number: '8.6',
                            findings: _updateFindings46,
                            initials: _updateInitials46,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child:
                          Text("9. Exhaust System", style: AppTextStyles.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        children: [
                          FormCard(
                            question:
                                'Visual inspection of muffler for condition, attachment, cracks, corrosion, deformations or damages and security.',
                            number: '9.1',
                            findings: _updateFindings48,
                            initials: _updateInitials48,
                          ),
                          FormCard(
                            question:
                                'Visual inspection of exhaust pipes for condition, attachment, cracks, corrosion, deformations or damages and security.',
                            number: '9.2',
                            findings: _updateFindings49,
                            initials: _updateInitials49,
                          ),
                        ],
                      ),
                    ),
                    Text('Student Signature:', style: AppTextStyles.title),
                    Signature(
                      controller: studentSignature,
                      width: 350,
                      height: 200,
                      backgroundColor: Colors.lightBlue[100]!,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                                onPressed: () {
                                  studentSignature.clear();
                                },
                                child: const Text(
                                  "Clear",
                                  style: TextStyle(fontSize: 20),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: BorderSide(
                                                color: Colors.red)))))),
                      ],
                    ),
                    Text(
                      "Instructor Signature:",
                      style: AppTextStyles.title,
                    ),
                    Signature(
                      controller: instructorSignature,
                      width: 350,
                      height: 200,
                      backgroundColor: Colors.lightBlue[100]!,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                                onPressed: () {
                                  instructorSignature.clear();
                                },
                                child: const Text(
                                  "Clear",
                                  style: TextStyle(fontSize: 20),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: BorderSide(
                                                color: Colors.red)))))),
                      ],
                    ),

                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          exportedImageStudent =
                              await studentSignature.toPngBytes();
                          exportedImageInstructor =
                              await instructorSignature.toPngBytes();
                          //saveForm();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  content: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Please confirm that you have completed the inspection and that the information is correct.",
                                            style: AppTextStyles.title,
                                          ),
                                          SizedBox(height: 20),
                                          Text.rich(
                                            TextSpan(
                                              text: 'Account ID:  ',
                                              style: AppTextStyles.subtitle2,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: accountID,
                                                    style: AppTextStyles
                                                        .subHeadings),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              text: 'Inspection Date:  ',
                                              style: AppTextStyles.subtitle2,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: inspectionDate,
                                                    style: AppTextStyles
                                                        .subHeadings),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('SCHEDULED INSPECTION',
                                                  style: AppTextStyles.title),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            '1. Status of:',
                                            style: AppTextStyles.subtitle2,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '1.1 Applicable Airworthiness Directive(s)\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipA11Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipA11Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '1.2 Applicable Service Bulletins\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipA12Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipA12Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '1.3 Log Books (reported problems)\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipA13Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipA13Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '1.4 Registration Certificate\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipA14Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipA14Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              text:
                                                  '2. Inspect life limited parts (replaced, overhauled)\n',
                                              style: AppTextStyles.subtitle2,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t${getRating(sipA2Findings!)}\n',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t$sipA2Initials',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              text:
                                                  '3. Drain the fuel tanks. Inspect drain valves for condition, obstruction and blockage.\n',
                                              style: AppTextStyles.subtitle2,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t${getRating(sipA3Findings!)}\n',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t$sipA3Initials',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              text:
                                                  '4. Clean the aircraft fully (exterior, interior).\n',
                                              style: AppTextStyles.subtitle2,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t${getRating(sipA4Findings!)}\n',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t$sipA4Initials',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              text:
                                                  '5. Visual inspection of interior marking and placards for condition (legibility and intactness).\n',
                                              style: AppTextStyles.subtitle2,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t${getRating(sipA5Findings!)}\n',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t$sipA5Initials',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              text:
                                                  '6. Visual inspection of exterior marking and placards for condition (legibility and intactness).\n',
                                              style: AppTextStyles.subtitle2,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t${getRating(sipA6Findings!)}\n',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t$sipA6Initials',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              text: '7. Jack the aircraft.\n',
                                              style: AppTextStyles.subtitle2,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t${getRating(sipA7Findings!)}\n',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t$sipA7Initials',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('PERIODIC INSPECTION',
                                                  style: AppTextStyles.title),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Text.rich(
                                            TextSpan(
                                              text:
                                                  '1. Engine Inspection.\nFor engine inspection, refer to Maintenance Manual (Line Maintenance) for Rotax Engine Type 912 Series (Ref. No MML-912, Part. No. 899191), latest issue.\n',
                                              style: AppTextStyles.subtitle2,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t${getRating(sipB1Findings!)}\n',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                                TextSpan(
                                                    text:
                                                        '\t\t\t\t$sipB1Initials',
                                                    style: AppTextStyles
                                                        .subHeadings),
                                              ],
                                            ),
                                          ),
                                          Text(
                                              '2. Engine Cowlings and Firewall',
                                              style: AppTextStyles.subtitle2),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '2.1 Remove engine cowlings. Clean and perform visual inspection for cracks, damages, loose or missing fasteners. Inspect the condition of oil inspection door.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB21Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB21Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '2.2 Visual inspection of engine cowlings fireproofing for condition and attachment (only bottom cowling)\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB22Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB22Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '2.3 Visual inspection of firewall and seals for cracks, condition and attachment.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB23Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB23Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '2.4 Visual inspection of landing lights for condition, attachment and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB24Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB24Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '2.5 Visual inspection of all parts installed at firewall for condition, attachment and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB25Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB25Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text('3. Battery',
                                              style: AppTextStyles.subtitle2),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '3.1 Remove battery cover. Visual inspection of terminals and cables corrosion, tightening and condition. Inspection of battery charge condition.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB31Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB31Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '3.2 Visual inspection of battery attachment and condition of fireproofing. Install battery cover.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB32Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB32Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text('4. Engine Mount',
                                              style: AppTextStyles.subtitle2),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '4.1 Visual inspection of engine mounts for weld cracks, bending, corrosion and distortion.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB41Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB41Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '4.2 Visual inspection of rubber silent blocks for cracks, excessive deformation and condition.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB42Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB42Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '4.3 Visual inspection of engine attachment, bolts and nuts security (engine — engine mount, engine mount - firewall)\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB43Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB43Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '4.4 Remove the engine mount attaching bolts. Visual inspection of bolts for cracks, deformation and damage. Install the bolts and inspect for proper nut torque.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB44Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB44Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text('5. Fuel System',
                                              style: AppTextStyles.subtitle2),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '5.1 Remove the fuel filter covers.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB51Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB51Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '5.2 Visual inspection of fuel hoses and connections for condition, leak and security. Visual inspection of fireproof insulation for conditions, integrity, chafing and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB52Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB52Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '5.3 Check and clean the strainers. Replace fuel filters.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB53Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB53Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '5.4 Check the vent hoses at the bottom of fuselage for damage, obstruction and blockage.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB54Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB54Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '5.5 Install the fuel filter covers.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB55Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB55Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text('6. Oil System',
                                              style: AppTextStyles.subtitle2),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '6.1 Visual inspection of oil tank for condition, attachment and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB61Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB61Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '6.2 Visual inspection of oil cooler and oil thermostat for condition, leak, attachment and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB62Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB62Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '6.3 Visual inspection of hoses and connections for condition, leak and security. Visual inspection of fireproof insulation for conditions, integrity, chafing and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB63Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB63Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '6.4 Check oil level. Add oil if necessary.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB64Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB64Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text('7. Cooling System',
                                              style: AppTextStyles.subtitle2),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '7.1 Visual inspection of water radiator and water thermostat for condition, leak, attachment and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB71Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB71Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '7.2 Visual inspection of hoses and tubes for condition, leak, attachment and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB72Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB72Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '7.3 Visual inspection of overflow bottle for condition, attachment and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB73Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB73Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '7.4 Check the coolant level in the expansion tank and overflow bottle. Add coolant if necessary.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB74Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB74Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '7.5 Check the coolant condition. Change as necessary.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB75Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB75Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text('8. Induction System',
                                              style: AppTextStyles.subtitle2),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '8.1 Visual inspection of carburetors, drip trays and control cables for condition, attachment and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB81Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB81Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '8.2 Visual inspection of airbox and airbox-carburetors hoses for condition, attachment and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB82Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB82Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '8.3 Visual inspection air filter holder for condition, attachment and security. Check the operation of carburetor preheating control.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB83Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB83Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '8.4 Visual inspection of air filter for condition, contamination, attachment and security. Clean or replace impure filter.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB84Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB84Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '8.5 Visual inspection of intake manifold and air hoses for condition, attachment and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${sipB85Findings.toString()}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB85Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '8.6 Visual inspection of shroud and air hose for condition, attachment and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB86Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB86Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text('9. Exhaust System',
                                              style: AppTextStyles.subtitle2),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '9.1 Visual inspection of muffler for condition, attachment, cracks, corrosion, deformations or damages and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB91Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB91Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    text:
                                                        '9.2 Visual inspection of exhaust pipes for condition, attachment, cracks, corrosion, deformations or damages and security.\n',
                                                    style:
                                                        AppTextStyles.subtitle2,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t${getRating(sipB92Findings!)}\n',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                      TextSpan(
                                                          text:
                                                              '\t\t\t\t$sipB92Initials',
                                                          style: AppTextStyles
                                                              .subHeadings),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Student Signature:",
                                            style: AppTextStyles.subtitle2,
                                          ),
                                          if (exportedImageStudent != null)
                                            Image.memory(
                                              exportedImageStudent!,
                                              // width: 300,
                                              // height: 250,
                                            ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Instructor Signature:",
                                            style: AppTextStyles.subtitle2,
                                          ),
                                          if (exportedImageInstructor != null)
                                            Image.memory(
                                              exportedImageInstructor!,
                                              // width: 300,
                                              // height: 250,
                                            ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                child: Text(
                                                  'Cancel',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context, false);
                                                },
                                              ),
                                              TextButton(
                                                child: Text(
                                                  'Submit',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          color: AppColors
                                                              .blueAccent),
                                                ),
                                                onPressed: () {
                                                  //insert signature upload to storage
                                                  saveForm();
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              NavBar()));
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          color: AppColors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Save',
                              style: AppTextStyles.subtitle2
                                  .copyWith(color: AppColors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  saveForm() {
    Box<ScheduledInspection> inspectionBox =
        Hive.box<ScheduledInspection>(HiveBoxesInspection.inspection);
    inspectionBox.add(ScheduledInspection(
      accountID: accountID,
      inspectionDate: inspectionDate,
      sipA11Findings: sipA11Findings,
      sipA11Initials: sipA11Initials,
      sipA12Findings: sipA12Findings,
      sipA12Initials: sipA12Initials,
      sipA13Findings: sipA13Findings,
      sipA13Initials: sipA13Initials,
      sipA14Findings: sipA14Findings,
      sipA14Initials: sipA14Initials,
      sipA2Findings: sipA2Findings,
      sipA2Initials: sipA2Initials,
      sipA3Findings: sipA3Findings,
      sipA3Initials: sipA3Initials,
      sipA4Findings: sipA4Findings,
      sipA4Initials: sipA4Initials,
      sipA5Findings: sipA5Findings,
      sipA5Initials: sipA5Initials,
      sipA6Findings: sipA6Findings,
      sipA6Initials: sipA6Initials,
      sipA7Findings: sipA7Findings,
      sipA7Initials: sipA7Initials,
      sipB1Findings: sipB1Findings,
      sipB1Initials: sipB1Initials,
      sipB21Findings: sipB21Findings,
      sipB21Initials: sipB21Initials,
      sipB22Findings: sipB22Findings,
      sipB22Initials: sipB22Initials,
      sipB23Findings: sipB23Findings,
      sipB23Initials: sipB23Initials,
      sipB24Findings: sipB24Findings,
      sipB24Initials: sipB24Initials,
      sipB25Findings: sipB25Findings,
      sipB25Initials: sipB25Initials,
      sipB31Findings: sipB31Findings,
      sipB31Initials: sipB31Initials,
      sipB32Findings: sipB32Findings,
      sipB32Initials: sipB32Initials,
      sipB41Findings: sipB41Findings,
      sipB41Initials: sipB41Initials,
      sipB42Findings: sipB42Findings,
      sipB42Initials: sipB42Initials,
      sipB43Findings: sipB43Findings,
      sipB43Initials: sipB43Initials,
      sipB44Findings: sipB44Findings,
      sipB44Initials: sipB44Initials,
      sipB51Findings: sipB51Findings,
      sipB51Initials: sipB51Initials,
      sipB52Findings: sipB52Findings,
      sipB52Initials: sipB52Initials,
      sipB53Findings: sipB53Findings,
      sipB53Initials: sipB53Initials,
      sipB54Findings: sipB54Findings,
      sipB54Initials: sipB54Initials,
      sipB55Findings: sipB55Findings,
      sipB55Initials: sipB55Initials,
      sipB61Findings: sipB61Findings,
      sipB61Initials: sipB61Initials,
      sipB62Findings: sipB62Findings,
      sipB62Initials: sipB62Initials,
      sipB63Findings: sipB63Findings,
      sipB63Initials: sipB63Initials,
      sipB64Findings: sipB64Findings,
      sip64Initials: sipB64Initials,
      sipB71Findings: sipB71Findings,
      sipB71Initials: sipB71Initials,
      sipB72Findings: sipB72Findings,
      sipB72Initials: sipB72Initials,
      sipB73Findings: sipB73Findings,
      sipB73Initials: sipB73Initials,
      sipB74Findings: sipB74Findings,
      sipB74Initials: sipB74Initials,
      sipB75Findings: sipB75Findings,
      sipB75Initials: sipB75Initials,
      sipB81Findings: sipB81Findings,
      sipB81Initials: sipB81Initials,
      sipB82Findings: sipB82Findings,
      sipB82Initials: sipB82Initials,
      sipB83Findings: sipB83Findings,
      sipB83Initials: sipB83Initials,
      sipB84Findings: sipB84Findings,
      sipB84Initials: sipB84Initials,
      sipB85Findings: sipB85Findings,
      sipB85Initials: sipB85Initials,
      sipB86Findings: sipB86Findings,
      sipB86Initials: sipB86Initials,
      sipB91Findings: sipB91Findings,
      sipB91Initials: sipB91Initials,
      sipB92Findings: sipB92Findings,
      sipB92Initials: sipB92Initials,
    ));
  }
}
