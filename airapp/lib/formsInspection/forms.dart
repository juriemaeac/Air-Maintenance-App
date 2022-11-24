import 'dart:io';

import 'package:airapp/constants.dart';
import 'package:airapp/formsInspection/formCard.dart';
import 'package:airapp/home/manual/pdf/pdfAPI.dart';
import 'package:airapp/home/manual/pdf/pdfViewer.dart';
import 'package:airapp/manualList.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> with ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? id = "empty";
  String? accountID = "empty";
  String? inspectionDate = "empty";

  int? sipA11Findings = 0;
  String? sipA11Initials = "empty";
  _updateFindings11a(int findings) {
    setState(() => sipA11Findings = findings);
  }

  _updateInitials11a(String initials) {
    setState(() => sipA11Initials = initials);
  }

  int? sipA12Findings = 0;
  String? sipA12Initials = "empty";
  _updateFindings12a(int findings) {
    setState(() => sipA12Findings = findings);
  }

  _updateInitials12a(String initials) {
    setState(() => sipA12Initials = initials);
  }

  int? sipA13Findings = 0;
  String? sipA13Initials = "empty";
  _updateFindings13a(int findings) {
    setState(() => sipA13Findings = findings);
  }

  _updateInitials13a(String initials) {
    setState(() => sipA13Initials = initials);
  }

  int? sipA14Findings = 0;
  String? sipA14Initials = "empty";
  _updateFindings14a(int findings) {
    setState(() => sipA14Findings = findings);
  }

  _updateInitials14a(String initials) {
    setState(() => sipA14Initials = initials);
  }

  int? sipA2Findings = 0;
  String? sipA2Initials = "empty";
  _updateFindings2(int findings) {
    setState(() => sipA2Findings = findings);
  }

  _updateInitials2(String initials) {
    setState(() => sipA2Initials = initials);
  }

  int? sipA3Findings = 0;
  String? sipA3Initials = "empty";
  _updateFindings3(int findings) {
    setState(() => sipA3Findings = findings);
  }

  _updateInitials3(String initials) {
    setState(() => sipA3Initials = initials);
  }

  int? sipA4Findings = 0;
  String? sipA4Initials = "empty";
  _updateFindings4(int findings) {
    setState(() => sipA4Findings = findings);
  }

  _updateInitials4(String initials) {
    setState(() => sipA4Initials = initials);
  }

  int? sipA5Findings = 0;
  String? sipA5Initials = "empty";
  _updateFindings5(int findings) {
    setState(() => sipA5Findings = findings);
  }

  _updateInitials5(String initials) {
    setState(() => sipA5Initials = initials);
  }

  int? sipA6Findings = 0;
  String? sipA6Initials = "empty";
  _updateFindings6(int findings) {
    setState(() => sipA6Findings = findings);
  }

  _updateInitials6(String initials) {
    setState(() => sipA6Initials = initials);
  }

  int? sipA7Findings = 0;
  String? sipA7Initials = "empty";
  _updateFindings7(int findings) {
    setState(() => sipA7Findings = findings);
  }

  _updateInitials7(String initials) {
    setState(() => sipA7Initials = initials);
  }

  //--------------------------------------------------------//  //--------------------------------------------------------//
  int? sipB1Findings = 0;
  String? sipB1Initials = "empty";
  _updateFindings8(int findings) {
    setState(() => sipB1Findings = findings);
  }

  _updateInitials8(String initials) {
    setState(() => sipB1Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB21Findings = 0;
  String? sipB21Initials = "empty";
  _updateFindings10(int findings) {
    setState(() => sipB21Findings = findings);
  }

  _updateInitials10(String initials) {
    setState(() => sipB21Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB22Findings = 0;
  String? sipB22Initials = "empty";
  _updateFindings11(int findings) {
    setState(() => sipB22Findings = findings);
  }

  _updateInitials11(String initials) {
    setState(() => sipB22Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB23Findings = 0;
  String? sipB23Initials = "empty";
  _updateFindings12(int findings) {
    setState(() => sipB23Findings = findings);
  }

  _updateInitials12(String initials) {
    setState(() => sipB23Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB24Findings = 0;
  String? sipB24Initials = "empty";
  _updateFindings13(int findings) {
    setState(() => sipB24Findings = findings);
  }

  _updateInitials13(String initials) {
    setState(() => sipB24Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB25Findings = 0;
  String? sipB25Initials = "empty";
  _updateFindings14(int findings) {
    setState(() => sipB25Findings = findings);
  }

  _updateInitials14(String initials) {
    setState(() => sipB25Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB31Findings = 0;
  String? sipB31Initials = "empty";
  _updateFindings16(int findings) {
    setState(() => sipB31Findings = findings);
  }

  _updateInitials16(String initials) {
    setState(() => sipB31Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB32Findings = 0;
  String? sipB32Initials = "empty";
  _updateFindings17(int findings) {
    setState(() => sipB32Findings = findings);
  }

  _updateInitials17(String initials) {
    setState(() => sipB32Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB41Findings = 0;
  String? sipB41Initials = "empty";
  _updateFindings19(int findings) {
    setState(() => sipB41Findings = findings);
  }

  _updateInitials19(String initials) {
    setState(() => sipB41Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB42Findings = 0;
  String? sipB42Initials = "empty";
  _updateFindings20(int findings) {
    setState(() => sipB42Findings = findings);
  }

  _updateInitials20(String initials) {
    setState(() => sipB42Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB43Findings = 0;
  String? sipB43Initials = "empty";
  _updateFindings21(int findings) {
    setState(() => sipB43Findings = findings);
  }

  _updateInitials21(String initials) {
    setState(() => sipB43Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB44Findings = 0;
  String? sipB44Initials = "empty";
  _updateFindings22(int findings) {
    setState(() => sipB44Findings = findings);
  }

  _updateInitials22(String initials) {
    setState(() => sipB44Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB51Findings = 0;
  String? sipB51Initials = "empty";
  _updateFindings24(int findings) {
    setState(() => sipB51Findings = findings);
  }

  _updateInitials24(String initials) {
    setState(() => sipB51Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB52Findings = 0;
  String? sipB52Initials = "empty";
  _updateFindings25(int findings) {
    setState(() => sipB52Findings = findings);
  }

  _updateInitials25(String initials) {
    setState(() => sipB52Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB53Findings = 0;
  String? sipB53Initials = "empty";
  _updateFindings26(int findings) {
    setState(() => sipB53Findings = findings);
  }

  _updateInitials26(String initials) {
    setState(() => sipB53Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB54Findings = 0;
  String? sipB54Initials = "empty";
  _updateFindings27(int findings) {
    setState(() => sipB54Findings = findings);
  }

  _updateInitials27(String initials) {
    setState(() => sipB54Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB55Findings = 0;
  String? sipB55Initials = "empty";
  _updateFindings28(int findings) {
    setState(() => sipB55Findings = findings);
  }

  _updateInitials28(String initials) {
    setState(() => sipB55Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB61Findings = 0;
  String? sipB61Initials = "empty";
  _updateFindings30(int findings) {
    setState(() => sipB61Findings = findings);
  }

  _updateInitials30(String initials) {
    setState(() => sipB61Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB62Findings = 0;
  String? sipB62Initials = "empty";
  _updateFindings31(int findings) {
    setState(() => sipB62Findings = findings);
  }

  _updateInitials31(String initials) {
    setState(() => sipB62Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB63Findings = 0;
  String? sipB63Initials = "empty";
  _updateFindings32(int findings) {
    setState(() => sipB63Findings = findings);
  }

  _updateInitials32(String initials) {
    setState(() => sipB63Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB64Findings = 0;
  String? sipB64Initials = "empty";
  _updateFindings33(int findings) {
    setState(() => sipB64Findings = findings);
  }

  _updateInitials33(String initials) {
    setState(() => sipB64Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB71Findings = 0;
  String? sipB71Initials = "empty";
  _updateFindings35(int findings) {
    setState(() => sipB71Findings = findings);
  }

  _updateInitials35(String initials) {
    setState(() => sipB71Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB72Findings = 0;
  String? sipB72Initials = "empty";
  _updateFindings36(int findings) {
    setState(() => sipB72Findings = findings);
  }

  _updateInitials36(String initials) {
    setState(() => sipB72Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB73Findings = 0;
  String? sipB73Initials = "empty";
  _updateFindings37(int findings) {
    setState(() => sipB73Findings = findings);
  }

  _updateInitials37(String initials) {
    setState(() => sipB73Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB74Findings = 0;
  String? sipB74Initials = "empty";
  _updateFindings38(int findings) {
    setState(() => sipB74Findings = findings);
  }

  _updateInitials38(String initials) {
    setState(() => sipB74Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB75Findings = 0;
  String? sipB75Initials = "empty";
  _updateFindings39(int findings) {
    setState(() => sipB75Findings = findings);
  }

  _updateInitials39(String initials) {
    setState(() => sipB75Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB81Findings = 0;
  String? sipB81Initials = "empty";
  _updateFindings41(int findings) {
    setState(() => sipB81Findings = findings);
  }

  _updateInitials41(String initials) {
    setState(() => sipB81Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB82Findings = 0;
  String? sipB82Initials = "empty";
  _updateFindings42(int findings) {
    setState(() => sipB82Findings = findings);
  }

  _updateInitials42(String initials) {
    setState(() => sipB82Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB83Findings = 0;
  String? sipB83Initials = "empty";
  _updateFindings43(int findings) {
    setState(() => sipB83Findings = findings);
  }

  _updateInitials43(String initials) {
    setState(() => sipB83Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB84Findings = 0;
  String? sipB84Initials = "empty";
  _updateFindings44(int findings) {
    setState(() => sipB84Findings = findings);
  }

  _updateInitials44(String initials) {
    setState(() => sipB84Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB85Findings = 0;
  String? sipB85Initials = "empty";
  _updateFindings45(int findings) {
    setState(() => sipB85Findings = findings);
  }

  _updateInitials45(String initials) {
    setState(() => sipB85Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB86Findings = 0;
  String? sipB86Initials = "empty";
  _updateFindings46(int findings) {
    setState(() => sipB86Findings = findings);
  }

  _updateInitials46(String initials) {
    setState(() => sipB86Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB91Findings = 0;
  String? sipB91Initials = "empty";
  _updateFindings48(int findings) {
    setState(() => sipB91Findings = findings);
  }

  _updateInitials48(String initials) {
    setState(() => sipB91Initials = initials);
  }

  //--------------------------------------------------------//
  int? sipB92Findings = 0;
  String? sipB92Initials = "empty";
  _updateFindings49(int findings) {
    setState(() => sipB92Findings = findings);
  }

  _updateInitials49(String initials) {
    setState(() => sipB92Initials = initials);
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Forms'),
            GestureDetector(
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ManualList()));
                },
                child: Text('Manual'))
            // GestureDetector(
            //     onTap: () async {
            //       const path = 'assets/files/150_sm_69.pdf';
            //       final file = await PDFApi.loadAsset(path);
            //       openPDF(context, file);
            //     },
            //     child: Text('Manual'))
          ],
        ),
        elevation: 2,
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
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //1
                    const Padding(
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
                    const Text("Periodic Inspection",
                        style: AppTextStyles.title),
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

                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print('sipA11Findings: $sipA11Findings');
                          print('sipA11Initials: $sipA11Initials');
                          print('sipA12Findings: $sipA12Findings');
                          print('sipA12Initials: $sipA12Initials');
                          print('sipA13Findings: $sipA13Findings');
                          print('sipA13Initials: $sipA13Initials');
                          print('sipA14Findings: $sipA14Findings');
                          print('sipA14Initials: $sipA14Initials');
                          print('sipA2Findings: $sipA2Findings');
                          print('sipA2Initials: $sipA2Initials');
                          print('sipA3Findings: $sipA3Findings');
                          print('sipA3Initials: $sipA3Initials');
                          print('sipA4Findings: $sipA4Findings');
                          print('sipA4Initials: $sipA4Initials');
                          print('sipA5Findings: $sipA5Findings');
                          print('sipA5Initials: $sipA5Initials');
                          print('sipA6Findings: $sipA6Findings');
                          print('sipA6Initials: $sipA6Initials');
                          print('sipA7Findings: $sipA7Findings');
                          print('sipA7Initials: $sipA7Initials');
                          print('sipB1Findings: $sipB1Findings');
                          print('sipB1Initials: $sipB1Initials');
                          print('sipB21Findings: $sipB21Findings');
                          print('sipB21Initials: $sipB21Initials');
                          print('sipB22Findings: $sipB22Findings');
                          print('sipB22Initials: $sipB22Initials');
                          print('sipB23Findings: $sipB23Findings');
                          print('sipB23Initials: $sipB23Initials');
                          print('sipB24Findings: $sipB24Findings');
                          print('sipB24Initials: $sipB24Initials');
                          print('sipB25Findings: $sipB25Findings');
                          print('sipB25Initials: $sipB25Initials');
                          print('sipB31Findings: $sipB31Findings');
                          print('sipB31Initials: $sipB31Initials');
                          print('sipB32Findings: $sipB32Findings');
                          print('sipB32Initials: $sipB32Initials');
                          print('sipB41Findings: $sipB41Findings');
                          print('sipB41Initials: $sipB41Initials');
                          print('sipB42Findings: $sipB42Findings');
                          print('sipB42Initials: $sipB42Initials');
                          print('sipB43Findings: $sipB43Findings');
                          print('sipB43Initials: $sipB43Initials');
                          print('sipB44Findings: $sipB44Findings');
                          print('sipB44Initials: $sipB44Initials');
                          print('sipB51Findings: $sipB51Findings');
                          print('sipB51Initials: $sipB51Initials');
                          print('sipB52Findings: $sipB52Findings');
                          print('sipB52Initials: $sipB52Initials');
                          print('sipB53Findings: $sipB53Findings');
                          print('sipB53Initials: $sipB53Initials');
                          print('sipB54Findings: $sipB54Findings');
                          print('sipB54Initials: $sipB54Initials');
                          print('sipB55Findings: $sipB55Findings');
                          print('sipB55Initials: $sipB55Initials');
                          print('sipB61Findings: $sipB61Findings');
                          print('sipB61Initials: $sipB61Initials');
                          print('sipB62Findings: $sipB62Findings');
                          print('sipB62Initials: $sipB62Initials');
                          print('sipB63Findings: $sipB63Findings');
                          print('sipB63Initials: $sipB63Initials');
                          print('sipB64Findings: $sipB64Findings');
                          print('sipB64Initials: $sipB64Initials');
                          print('sipB71Findings: $sipB71Findings');
                          print('sipB71Initials: $sipB71Initials');
                          print('sipB72Findings: $sipB72Findings');
                          print('sipB72Initials: $sipB72Initials');
                          print('sipB73Findings: $sipB73Findings');
                          print('sipB73Initials: $sipB73Initials');
                          print('sipB74Findings: $sipB74Findings');
                          print('sipB74Initials: $sipB74Initials');
                          print('sipB75Findings: $sipB75Findings');
                          print('sipB75Initials: $sipB75Initials');
                          print('sipB81Findings: $sipB81Findings');
                          print('sipB81Initials: $sipB81Initials');
                          print('sipB82Findings: $sipB82Findings');
                          print('sipB82Initials: $sipB82Initials');
                          print('sipB83Findings: $sipB83Findings');
                          print('sipB83Initials: $sipB83Initials');
                          print('sipB84Findings: $sipB84Findings');
                          print('sipB84Initials: $sipB84Initials');
                          print('sipB85Findings: $sipB85Findings');
                          print('sipB85Initials: $sipB85Initials');
                          print('sipB86Findings: $sipB86Findings');
                          print('sipB86Initials: $sipB86Initials');
                          print('sipB91Findings: $sipB91Findings');
                          print('sipB91Initials: $sipB91Initials');
                          print('sipB92Findings: $sipB92Findings');
                          print('sipB92Initials: $sipB92Initials');
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
}
