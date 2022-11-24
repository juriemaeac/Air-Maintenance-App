import 'dart:io';

import 'package:airapp/constants.dart';
import 'package:airapp/home/manual/pdf/pdfAPI.dart';
import 'package:airapp/home/manual/pdf/pdfViewer.dart';
import 'package:airapp/manualList.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  String? question;
  String? number;

  TaskCard({super.key, this.question, this.number});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
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
              Text('Task Card'),
              GestureDetector(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ManualList()));
                  },
                  child: Text('Manual'))
            ],
          ),
          elevation: 2,
        ),
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.greyAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  //controller: usernameText,
                  style: AppTextStyles.textFields,
                  decoration: const InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 25, right: 13),
                    labelText: 'Enter Username',
                    labelStyle: AppTextStyles.subHeadings,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: AppColors.blueAccent, width: 2),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      //username = value;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Required!";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        )));
  }
}
