import 'package:airapp/boxes/boxMaintenance.dart';
import 'package:airapp/database/maintenanceTask_model.dart';
import 'package:airapp/formMaintenancetask/taskCard.dart';
import 'package:airapp/manualList.dart';
import 'package:flutter/material.dart';
import 'package:airapp/authentication/login.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  String? accountID;
  String? maintenanceDate;
  String? taskCardNumber;
  String? taskCardSpecification;
  String? taskCardRevision;
  String? taskCardRevisionDate;
  String? woSpecification;
  String? woScheduleStart;
  String? location;
  String? aircraftType;
  String? acReg;
  String? acSerial;
  String? area;
  String? student;
  String? instructor;
  String? taskCardType;
  String? ata;
  String? mmEffectivity;
  String? ipcEffectivity;
  String? manHours;
  String? men;
  String? user;
  String? acRegA;
  String? userA;
  String? dateA;
  //===================================================================
  String? itemNum;
  String? userActionDescription;
  String? studentB;
  String? instructorB;
  String? inspectorB;
  String? submittedBy;
  String? reviewedBy;
  String? completedBy;
  String? dateCompletionB;
  String? departmentB;
  String? acRegB;
  String? userB;
  String? dateB;
  //Walkaround fuselage wings and tails
  String? findingsA1;
  String? findingsB1;
  String? findingsLogbook1;
  String? findingsSolution1;
  String? findingsResult1;
  //Walkaround exterior
  String? findingsA2;
  String? findingsB2;
  String? findingsLogbook2;
  String? findingsSolution2;
  String? findingsResult2;
  //Check Engine
  String? findingsA3;
  String? findingsB3;
  String? findingsLogbook3;
  String? findingsSolution3;
  String? findingsResult3;
  //Check Visual inspection battery alternator
  String? findingsA4;
  String? findingsB4;
  String? findingsLogbook4;
  String? findingsSolution4;
  String? findingsResult4;
  //Check Lighting System
  String? findingsA5;
  String? findingsB5;
  String? findingsLogbook5;
  String? findingsSolution5;
  String? findingsResult5;
  //Check Flashing Beacon
  String? findingsA6;
  String? findingsB6;
  String? findingsLogbook6;
  String? findingsSolution6;
  String? findingsResult6;

  _updateFindings(int findings) {
    //setState(() => findings1 = findings);
  }

  @override
  void initState() {
    super.initState();
    Hive.openBox<MaintenanceTask>(HiveBoxesMaintenance.maintenance);
    accountID = userCredential.accountID;
    getDate();
  }

  void getDate() {
    DateTime date = DateTime.now();
    var dateTime = DateTime.parse(date.toString());
    var format1 = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    //maintenance = format1;
  }

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
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              // TaskCard(
              //   question: 'Q1',
              //   number: '1',
              //   initials:
              //   findings: ,
              // ),
              // TaskCard(
              //   question: 'Q2',
              //   number: '2',
              //   initials:
              //   findings:
              // ),
            ],
          ),
        )));
  }
}
