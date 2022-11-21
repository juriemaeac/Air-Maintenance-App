import 'dart:io';

import 'package:airapp/constants.dart';
import 'package:airapp/forms/formCard.dart';
import 'package:airapp/home/manual/pdf/pdfAPI.dart';
import 'package:airapp/home/manual/pdf/pdfViewer.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  int _value = 1;

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
                  const path = 'assets/files/150_sm_69.pdf';
                  final file = await PDFApi.loadAsset(path);
                  openPDF(context, file);
                },
                child: Text('Manual'))
          ],
        ),
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      // Container(
                      //   width: 30,
                      //   padding: const EdgeInsets.all(6),
                      //   decoration: BoxDecoration(
                      //     color: AppColors.blueAccent,
                      //     shape: BoxShape.circle,
                      //   ),
                      //   child: Center(
                      //     child: Text('1',
                      //         style: AppTextStyles.subtitle2
                      //             .copyWith(color: AppColors.white)),
                      //   ),
                      // ),
                      // SizedBox(width: 5),
                      Text('Check status of:', style: AppTextStyles.title),
                    ],
                  ),
                ),
                //1
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    children: [
                      FormCard(
                        question: 'Applicable Airworthiness Directives',
                        number: '1.1',
                      ),
                      FormCard(
                        question: 'Applicable Service Bulletins',
                        number: '1.2',
                      ),
                      FormCard(
                        question: 'Log Books (reported problems)',
                        number: '1.3',
                      ),
                      FormCard(
                        question: 'ARegistration Certificate',
                        number: '1.4',
                      ),
                    ],
                  ),
                ),

                //2-7
                FormCard(
                  question: 'Inspect life limited parts (replaced, overhauled)',
                  number: '2',
                ),
                FormCard(
                  question:
                      'Drain the fuel tanks. Inspect drain valves for condition, obstruction and blockage.',
                  number: '3',
                ),
                FormCard(
                  question: 'Clean the aircraft fully (exterior, interior).',
                  number: '4',
                ),
                FormCard(
                  question:
                      'Visual inspection of interior marking and placards for condition (legibility and intactness).',
                  number: '5',
                ),
                FormCard(
                  question:
                      'Visual inspection of exterior marking and placards for condition (legibility and intactness).',
                  number: '6',
                ),
                FormCard(
                  question: 'Jack the aircraft.',
                  number: '7',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
