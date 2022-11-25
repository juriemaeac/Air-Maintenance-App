import 'package:airapp/boxes/boxMaintenance.dart';
import 'package:airapp/database/maintenanceTask_model.dart';
import 'package:airapp/formMaintenancetask/taskCardA.dart';
import 'package:airapp/formMaintenancetask/taskCardB.dart';
import 'package:airapp/manualList.dart';
import 'package:flutter/material.dart';
import 'package:airapp/authentication/login.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants.dart';
import '../navBar.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? accountID = "n/a";
  String? maintenanceDate = "n/a";
  String? taskCardNumber = "n/a";
  String? taskCardSpecification = "n/a";
  String? taskCardRevision = "n/a";
  String? taskCardRevisionDate = "n/a";
  String? woSpecification = "n/a";
  String? woScheduleStart = "n/a";
  String? location = "n/a";
  String? aircraftType = "n/a";
  String? acReg = "n/a";
  String? acSerial = "n/a";
  String? area = "n/a";
  String? student = "";
  String? instructor = "";
  String? taskCardType = "n/a";
  String? ata = "n/a";
  String? mmEffectivity = "n/a";
  String? ipcEffectivity = "n/a";
  String? manHours = "n/a";
  String? men = "n/a";
  String? user = "n/a";
  String? acRegA = "n/a";
  String? userA = "n/a";
  String? dateA = "n/a";
  //===================================================================
  String? itemNum = "n/a";
  String? userActionDescription = "n/a";
  String? studentB = "";
  String? instructorB = "";
  String? inspectorB = "";
  String? submittedBy = "n/a";
  String? reviewedBy = "n/a";
  String? completedBy = "n/a";
  String? dateCompletionB = "n/a";
  String? departmentB = "n/a";
  String? acRegB = "n/a";
  String? userB = "n/a";
  String? dateB = "n/a";
  //Walkaround fuselage wings and tails
  String? findingsA1 = "n/a";
  String? findingsB1 = "n/a";
  String? findingsLogbook1 = "n/a";
  String? findingsSolution1 = "n/a";
  String? findingsResult1 = "n/a";
  //Walkaround exterior
  String? findingsA2 = "n/a";
  String? findingsB2 = "n/a";
  String? findingsLogbook2 = "n/a";
  String? findingsSolution2 = "n/a";
  String? findingsResult2 = "n/a";
  //Check Engine
  String? findingsA3 = "n/a";
  String? findingsB3 = "n/a";
  String? findingsLogbook3 = "n/a";
  String? findingsSolution3 = "n/a";
  String? findingsResult3 = "n/a";
  //Check Visual inspection battery alternator
  String? findingsA4 = "n/a";
  String? findingsB4 = "n/a";
  String? findingsLogbook4 = "n/a";
  String? findingsSolution4 = "n/a";
  String? findingsResult4 = "n/a";
  //Check Lighting System
  String? findingsA5 = "n/a";
  String? findingsB5 = "n/a";
  String? findingsLogbook5 = "n/a";
  String? findingsSolution5 = "n/a";
  String? findingsResult5 = "n/a";
  //Check Flashing Beacon
  String? findingsA6 = "n/a";
  String? findingsB6 = "n/a";
  String? findingsLogbook6 = "n/a";
  String? findingsSolution6 = "n/a";
  String? findingsResult6 = "n/a";

  _updateSection2(String data) {
    setState(() => taskCardNumber = data);
  }

  _updateSection3(String data) {
    setState(() => taskCardSpecification = data);
  }

  _updateSection4(String data) {
    setState(() => taskCardRevision = data);
  }

  _updateSection5(String data) {
    setState(() => taskCardRevisionDate = data);
  }

  _updateSection6(String data) {
    setState(() => woSpecification = data);
  }

  _updateSection7(String data) {
    setState(() => woScheduleStart = data);
  }

  _updateSection8(String data) {
    setState(() => location = data);
  }

  _updateSection9(String data) {
    setState(() => aircraftType = data);
  }

  _updateSection10(String data) {
    setState(() => acReg = data);
  }

  _updateSection11(String data) {
    setState(() => acSerial = data);
  }

  _updateSection12(String data) {
    setState(() => area = data);
  }

  _updateSection13(String data) {
    setState(() => student = data);
  }

  _updateSection14(String data) {
    setState(() => instructor = data);
  }

  _updateSection15(String data) {
    setState(() => taskCardType = data);
  }

  _updateSection16(String data) {
    setState(() => ata = data);
  }

  _updateSection17(String data) {
    setState(() => mmEffectivity = data);
  }

  _updateSection18(String data) {
    setState(() => ipcEffectivity = data);
  }

  _updateSection19(String data) {
    setState(() => manHours = data);
  }

  _updateSection20(String data) {
    setState(() => men = data);
  }

  _updateSection21(String data) {
    setState(() => user = data);
  }

  _updateSection22(String data) {
    setState(() => acRegA = data);
  }

  _updateSection23(String data) {
    setState(() => userA = data);
  }

  _updateSection24(String data) {
    setState(() => dateA = data);
  }

  _updateSection25(String data) {
    setState(() => itemNum = data);
  }

  _updateSection26(String data) {
    setState(() => userActionDescription = data);
  }

  _updateSection27(String data) {
    setState(() => studentB = data);
  }

  _updateSection28(String data) {
    setState(() => instructorB = data);
  }

  _updateSection29(String data) {
    setState(() => inspectorB = data);
  }

  _updateSection30(String data) {
    setState(() => submittedBy = data);
  }

  _updateSection31(String data) {
    setState(() => reviewedBy = data);
  }

  _updateSection32(String data) {
    setState(() => completedBy = data);
  }

  _updateSection33(String data) {
    setState(() => dateCompletionB = data);
  }

  _updateSection34(String data) {
    setState(() => departmentB = data);
  }

  _updateSection35(String data) {
    setState(() => acRegB = data);
  }

  _updateSection36(String data) {
    setState(() => userB = data);
  }

  _updateSection37(String data) {
    setState(() => dateB = data);
  }

  _updateSection38(int data) {
    setState(() => findingsA1 = data.toString());
  }

  _updateSection40(String data) {
    setState(() => findingsLogbook1 = data);
  }

  _updateSection41(String data) {
    setState(() => findingsSolution1 = data);
  }

  _updateSection42(String data) {
    setState(() => findingsResult1 = data);
  }

  _updateSection43(int data) {
    setState(() => findingsA2 = data.toString());
  }

  _updateSection45(String data) {
    setState(() => findingsLogbook2 = data);
  }

  _updateSection46(String data) {
    setState(() => findingsSolution2 = data);
  }

  _updateSection47(String data) {
    setState(() => findingsResult2 = data);
  }

  _updateSection48(int data) {
    setState(() => findingsA3 = data.toString());
  }

  _updateSection50(String data) {
    setState(() => findingsLogbook3 = data);
  }

  _updateSection51(String data) {
    setState(() => findingsSolution3 = data);
  }

  _updateSection52(String data) {
    setState(() => findingsResult3 = data);
  }

  _updateSection53(int data) {
    setState(() => findingsA4 = data.toString());
  }

  _updateSection55(String data) {
    setState(() => findingsLogbook4 = data);
  }

  _updateSection56(String data) {
    setState(() => findingsSolution4 = data);
  }

  _updateSection57(String data) {
    setState(() => findingsResult4 = data);
  }

  _updateSection58(int data) {
    setState(() => findingsA5 = data.toString());
  }

  _updateSection60(String data) {
    setState(() => findingsLogbook5 = data);
  }

  _updateSection61(String data) {
    setState(() => findingsSolution5 = data);
  }

  _updateSection62(String data) {
    setState(() => findingsResult5 = data);
  }

  _updateSection63(int data) {
    setState(() => findingsA6 = data.toString());
  }

  _updateSection65(String data) {
    setState(() => findingsLogbook6 = data);
  }

  _updateSection66(String data) {
    setState(() => findingsSolution6 = data);
  }

  _updateSection67(String data) {
    setState(() => findingsResult6 = data);
  }

  @override
  void initState() {
    super.initState();
    Hive.openBox<MaintenanceTask>(HiveBoxesMaintenance.maintenance);
    accountID = userCredential.accountID;
    maintenanceDate = getDate();
    dateCompletionB = getDate();
    userA = userCredential.name;
    userB = userCredential.name;
    dateA = getDate();
    dateB = getDate();
  }

  String getDate() {
    DateTime date = DateTime.now();
    var dateTime = DateTime.parse(date.toString());
    var format1 =
        "${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}";
    maintenanceDate = format1;
    return format1;
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
              Text('Task Card',
                  style: AppTextStyles.title
                      .copyWith(color: AppColors.blueAccent)),
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
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Maintenance Task Section A",
                          style: AppTextStyles.headings
                              .copyWith(color: AppColors.yellowAccent)),
                    ),
                    const SizedBox(height: 15),
                    TaskCardA(
                      question: 'Task Card Number',
                      initials: _updateSection2,
                    ),
                    TaskCardA(
                      question: 'Task Card Specification',
                      initials: _updateSection3,
                    ),
                    TaskCardA(
                      question: 'Task Card Revision',
                      initials: _updateSection4,
                    ),
                    TaskCardA(
                      question: 'Task Card Revision Date',
                      initials: _updateSection5,
                    ),
                    TaskCardA(
                      question: 'W/O Specification',
                      initials: _updateSection6,
                    ),
                    TaskCardA(
                      question: 'W/O Schedule Start',
                      initials: _updateSection7,
                    ),
                    TaskCardA(
                      question: 'Location',
                      initials: _updateSection8,
                    ),
                    TaskCardA(
                      question: 'Aircraft Type',
                      initials: _updateSection9,
                    ),
                    TaskCardA(
                      question: 'A/C Reg [If applicable]',
                      initials: _updateSection10,
                    ),
                    TaskCardA(
                      question: '[A/C Serial No. [If applicable]',
                      initials: _updateSection11,
                    ),
                    TaskCardA(
                      question: 'Area',
                      initials: _updateSection12,
                    ),
                    TaskCardA(
                      //Not Sure
                      question: 'Student',
                      initials: _updateSection13,
                    ),
                    TaskCardA(
                      //Not SUre
                      question: 'Instructor',
                      initials: _updateSection14,
                    ),
                    TaskCardA(
                      question: 'Task Card Type',
                      initials: _updateSection15,
                    ),
                    TaskCardA(
                      question: 'ATA',
                      initials: _updateSection16,
                    ),
                    TaskCardA(
                      question: 'MM Effectivity',
                      initials: _updateSection17,
                    ),
                    TaskCardA(
                      question: 'IPC Effectivity',
                      initials: _updateSection18,
                    ),
                    TaskCardA(
                      question: 'Man-Hours',
                      initials: _updateSection19,
                    ),
                    TaskCardA(
                      question: 'Men',
                      initials: _updateSection20,
                    ),
                    TaskCardA(
                      question: 'User [Student, Instructor, AV/Mech]',
                      initials: _updateSection21,
                    ),
                    TaskCardA(
                      question: 'Item',
                      initials: _updateSection25,
                    ),
                    TaskCardA(
                      question: 'User/Action Description',
                      initials: _updateSection26,
                    ),
                    TaskCardA(
                      question: 'Student',
                      initials: _updateSection27,
                    ),
                    TaskCardA(
                      question: 'Instructor',
                      initials: _updateSection28,
                    ),
                    TaskCardA(
                      question: 'Inspector [Avionics/Mechanic]',
                      initials: _updateSection29,
                    ),
                    TaskCardA(
                      question: 'Submitted By: ',
                      initials: _updateSection30,
                    ),
                    TaskCardA(
                      question: 'Reviewed and Corrected By:',
                      initials: _updateSection31,
                    ),
                    TaskCardA(
                      question: 'Completed By: ',
                      initials: _updateSection32,
                    ),
                    TaskCardA(
                      question: 'Department',
                      initials: _updateSection34,
                    ),
                    TaskCardA(
                      question: 'A/C REG',
                      initials: _updateSection35,
                    ),
                    Divider(
                      color: AppColors.greyAccentLine,
                      thickness: 1,
                    ),
                    const SizedBox(height: 20),
                    buildReminders(),
                    const SizedBox(height: 50),
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Maintenance Task Section B",
                          style: AppTextStyles.headings
                              .copyWith(color: AppColors.yellowAccent)),
                    ),
                    const SizedBox(height: 15),
                    TaskCardB(
                      headings: 'WALK AROUND – FUSELAGE, WINGS, TAILS',
                      title:
                          'Refer: D2064-1-13 - MODEL 152 SERIES\nCheck the fuselage, wings, stabilizers, tail, radome, aerials, lightning diverter strips, static dischargers and control surfaces for the following:',
                      instructions:
                          '● Check for the condition, damage, and leakage\n● Check that access / service panels are locked securely and that inlets/outlets are free from obstruction.\n● Pay particular attention to the navigation antennas, i.e, GPS, VOR, and DME and fuselage skin in the vicinity of these antennas.\n● Check the overboard discharge indicators for the crew oxygen bottle (fwd fuselage RH side) and APU fire extinguisher bottle (lower aft fuselage)\n● Check for fluid leakage in the drain masts/drains in the APU area.\n● Check for the condition of passenger / crew doors, emergency exit doors and cargo doors.\n● Check all pitot tubes, static ports, and angle-of-attack sensors and the surrounding fuselage skin for damage, deformation, and obstruction.',
                      question: 'Select Status',
                      findings: _updateSection38,
                      logBook: _updateSection40,
                      solution: _updateSection41,
                      result: _updateSection42,
                    ),
                    const SizedBox(height: 15),
                    TaskCardB(
                      headings: 'WALK-AROUND - EXTERIOR INSPECTION',
                      title:
                          'Refer: Cessna Model 150-Manual Figure 1-1\nPerform the following tasks: General Aircraft Condition, Filler Caps  and Inspection Plates : Perform a visual check for condition and damage',
                      instructions:
                          '● Landing gears and doors: Perform a visual check for condition and damage\n● Shock absorber/strut: Perform a visual check for leaks and extension',
                      question: 'Select Status',
                      findings: _updateSection43,
                      logBook: _updateSection45,
                      solution: _updateSection46,
                      result: _updateSection47,
                    ),
                    const SizedBox(height: 15),
                    TaskCardB(
                      headings: 'CD2064-1-13 - MODEL 152 MANUAL (16-12 to 31)',
                      title:
                          'Check Battery System - Troubleshooting the battery:',
                      instructions:
                          'Note: The battery is 24 volts and thru 15280459. A1522759 and FA1520346 a 14 ampere-hour capacity battery is installed as standard, a 17 ampere-hour capacity battery is optional Beginning with 15280460. A1522760 and FA1520347 the battery is 24 volts with a 12.75 ampere-hour capacity as standard and a 15.5 ampere-hour capacity battery as optional. The battery is mounted on the forward side of the firewall and is equipped with non-spill caps\nCheck the Alternator - ENGINE NOT RUNNING.\nRefer: CD2064-1-13 - MODEL 152 MANUAL (16-42. TROUBLESHOOTING -- ALTERNATOR SYSTEM (BEGINNING 1979 MODELS))',
                      question: 'Select Status',
                      findings: _updateSection48,
                      logBook: _updateSection50,
                      solution: _updateSection51,
                      result: _updateSection52,
                    ),
                    TaskCardB(
                      headings: '',
                      title: 'CD2064-1-13 - MODEL 152 MANUAL (16-12;16-32)',
                      instructions:
                          'Perform a general visual inspection of battery and alternator system',
                      question: 'Select Status',
                      findings: _updateSection53,
                      logBook: _updateSection55,
                      solution: _updateSection56,
                      result: _updateSection57,
                    ),
                    TaskCardB(
                      headings: '',
                      title: 'AIRCRAFT LIGHTING SYSTEM ',
                      instructions: 'Check the Lighting System - 16-48.',
                      question: 'Select Status',
                      findings: _updateSection58,
                      logBook: _updateSection60,
                      solution: _updateSection61,
                      result: _updateSection62,
                    ),
                    TaskCardB(
                      headings: '',
                      title: 'CD2064-1-13 - MODEL 152 MANUAL (16-48)',
                      instructions:
                          'Flashing Beacon does not light - Refer to 16-50 Troubleshooting',
                      question: 'Select Status',
                      findings: _updateSection63,
                      logBook: _updateSection65,
                      solution: _updateSection66,
                      result: _updateSection67,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          saveForm();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Form Submitted"),
                                  content: Text(
                                      "Thank you for submitting the form. You will be redirected to the home page."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NavBar()));
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              });
                          print('Account ID: $accountID');
                          print('Inspection Date: $maintenanceDate');
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        //margin: const EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          color: AppColors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Save',
                              style: AppTextStyles.title
                                  .copyWith(color: AppColors.yellowAccent)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )));
  }

  saveForm() {
    Box<MaintenanceTask> maintenanceBox =
        Hive.box<MaintenanceTask>(HiveBoxesMaintenance.maintenance);
    maintenanceBox.add(MaintenanceTask(
      accountID: accountID,
      taskCardNumber: taskCardNumber,
      taskCardSpecification: taskCardSpecification,
      taskCardRevision: taskCardRevision,
      taskCardRevisionDate: taskCardRevisionDate,
      woSpecification: woSpecification,
      woScheduleStart: woScheduleStart,
      location: location,
      aircraftType: aircraftType,
      acReg: acReg,
      acSerial: acSerial,
      area: area,
      student: student,
      instructor: instructor,
      taskCardType: taskCardType,
      ata: ata,
      mmEffectivity: mmEffectivity,
      ipcEffectivity: ipcEffectivity,
      manHours: manHours,
      men: men,
      user: user,
      acRegA: acRegA,
      userA: userA,
      dateA: dateA,
//===================================================================
      itemNum: itemNum,
      userActionDescription: userActionDescription,
      studentB: studentB,
      instructorB: instructorB,
      inspectorB: inspectorB,
      submittedBy: submittedBy,
      reviewedBy: reviewedBy,
      completedBy: completedBy,
      dateCompletionB: dateCompletionB,
      departmentB: departmentB,
      acRegB: acRegB,
      userB: userB,
      dateB: dateB,
//Walkaround fuselage wings and tails
      findingsA1: findingsA1,
      findingsB1: findingsB1,
      findingsLogbook1: findingsLogbook1,
      findingsSolution1: findingsSolution1,
      findingsResult1: findingsResult1,
//Walkaround exterior
      findingsA2: findingsA2,
      findingsB2: findingsB2,
      findingsLogbook2: findingsLogbook2,
      findingsSolution2: findingsSolution2,
      findingsResult2: findingsResult2,
//Check Engine
      findingsA3: findingsA3,
      findingsB3: findingsB3,
      findingsLogbook3: findingsLogbook3,
      findingsSolution3: findingsSolution3,
      findingsResult3: findingsResult3,
//Check Visual inspection battery alternator
      findingsA4: findingsA4,
      findingsB4: findingsB4,
      findingsLogbook4: findingsLogbook4,
      findingsSolution4: findingsSolution4,
      findingsResult4: findingsResult4,
//Check Lighting System
      findingsA5: findingsA5,
      findingsB5: findingsB5,
      findingsLogbook5: findingsLogbook5,
      findingsSolution5: findingsSolution5,
      findingsResult5: findingsResult5,
//Check Flashing Beacon
      findingsA6: findingsA6,
      findingsB6: findingsB6,
      findingsLogbook6: findingsLogbook6,
      findingsSolution6: findingsSolution6,
      findingsResult6: findingsResult6,
    ));
  }

  Widget buildReminders() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.greyAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.notes_rounded, color: AppColors.black),
              SizedBox(width: 10),
              Text('Checklist Notes:', style: AppTextStyles.title0),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            '1.	This checklist/task card is applicable to Cessna 150/152 or Airbus A320s Family.\n2.	Review the checklist before proceeding to this activity.\n3.	Read the Application guide/instructions of this application before proceeding to the next section. \n4.	Make sure to input your signature after completing the activity.',
            style: AppTextStyles.subHeadings,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.info_outline_rounded, color: AppColors.black),
              SizedBox(width: 10),
              Text(
                'Reminders:',
                style: AppTextStyles.title0,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
              '-	Ensure that the valve toggles and cockpit switches are situated properly.\n-	Turn on the batteries and note the fuel gauge readings for later comparison with your visual assessment.\n-	Make sure the magnetos are off and turn the battery off.\n-	Make sure your seatbelts are secure and free of fraying or loose objects in the cockpit.\n-	Learn where the spare fuses are and how many there are if your plane has them.',
              style: AppTextStyles.subHeadings),
        ],
      ),
    );
  }
}
