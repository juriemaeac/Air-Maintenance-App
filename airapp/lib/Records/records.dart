import 'package:airapp/boxes/boxInspection.dart';
import 'package:airapp/boxes/boxInstructor.dart';
import 'package:airapp/boxes/boxMaintenance.dart';
import 'package:airapp/boxes/boxStudent.dart';
import 'package:airapp/constants.dart';
import 'package:airapp/database/instructor_model.dart';
import 'package:airapp/database/maintenanceTask_model.dart';
import 'package:airapp/database/scheduledInspection_model.dart';
import 'package:airapp/database/student_model.dart';
import 'package:airapp/navBar.dart';
import 'package:airapp/pdfMaintenanceInspection/pdfInspectionApi.dart';
import 'package:airapp/pdfMaintenanceInspection/inspection_pdf_api.dart';
import 'package:airapp/pdfMaintenanceTask/pdfMaintenanceApi.dart';
import 'package:airapp/pdfMaintenanceTask/maintenance_pdf_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  bool isTask = false;
  bool isInspection = true;

  bool isSearching = false;
  int? searchID;
  bool? isEnabled = true;
  int? searchCount = 1;
  int? counter = 0;

  @override
  void initState() {
    super.initState();
    Hive.openBox<MaintenanceTask>(HiveBoxesMaintenance.maintenance);
    Hive.openBox<ScheduledInspection>(HiveBoxesInspection.inspection);
    Hive.openBox<Student>(HiveBoxesStudent.student);
    Hive.openBox<Instructor>(HiveBoxesInstructor.instructor);
    //var user = studentCredential.getString();
    // isEnabled = true;
    // if (user == '') {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const LoginScreen(),
    //     ),
    //   );
    // }
  }

  getRating(int rating) {
    String equivRating = "";
    if (rating == 0) {
      equivRating = "Satisfactory";
    } else if (rating == 1) {
      equivRating = "Not Satisfactory";
    } else if (rating == 2) {
      equivRating = "Warning";
    } else {
      equivRating = "N/A";
    }
    return equivRating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  color: AppColors.greyAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTask = true;
                          isInspection = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isTask
                              ? AppColors.blueAccent
                              : AppColors.greyAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text('Task',
                            style: AppTextStyles.subHeadings.copyWith(
                                color: isTask
                                    ? AppColors.yellowAccent
                                    : AppColors.grey,
                                fontWeight: isTask ? FontWeight.bold : null)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTask = false;
                          isInspection = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isInspection
                              ? AppColors.blueAccent
                              : AppColors.greyAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text('Inspection',
                            style: AppTextStyles.subHeadings.copyWith(
                                color: isInspection
                                    ? AppColors.yellowAccent
                                    : AppColors.grey,
                                fontWeight:
                                    isInspection ? FontWeight.bold : null)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          isTask
              ? _buildMaintenanceRecords()
              : isInspection
                  ? _buildInspectionRecords()
                  : Container(),
        ],
      ),
    )));
  }

  Widget _buildInspectionRecords() {
    return Container(
      //color: Colors.red,
      //height: MediaQuery.of(context).size.height - 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              'Maintenance Inspection Records',
              style: AppTextStyles.title,
            ),
          ),
          ValueListenableBuilder(
              valueListenable:
                  Hive.box<ScheduledInspection>(HiveBoxesInspection.inspection)
                      .listenable(),
              builder: (context, Box<ScheduledInspection> box, _) {
                if (box.values.isEmpty) {
                  return Container(
                      height: MediaQuery.of(context).size.height - 300,
                      child: Center(
                          child: Text(
                        "Record list is empty",
                        style: AppTextStyles.subHeadings,
                      )));
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 229,
                    //color: Colors.blue,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: isSearching ? searchCount : box.values.length,
                      itemBuilder: (context, index) {
                        int reverseIndex = box.length - 1 - index;
                        final ScheduledInspection? res = isSearching
                            ? box.values
                                .where((inspection) =>
                                    inspection.accountID == searchID)
                                .toList()[index]
                            : box.getAt(reverseIndex);
                        return ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: GestureDetector(
                            onTap: () async {
                              final date = DateTime.now();
                              // Box<ScheduledInspection>
                              //     inspectionForm =
                              //     Hive.box<ScheduledInspection>(
                              //         HiveBoxesInspection.inspection);

                              ScheduledInspection inspection =
                                  ScheduledInspection(
                                accountID: res.accountID,
                                inspectionDate: res.inspectionDate,
                                sipA11Findings: res.sipA11Findings,
                                sipA11Initials: res.sipA11Initials,
                                sipA12Findings: res.sipA12Findings,
                                sipA12Initials: res.sipA12Initials,
                                sipA13Findings: res.sipA13Findings,
                                sipA13Initials: res.sipA13Initials,
                                sipA14Findings: res.sipA14Findings,
                                sipA14Initials: res.sipA14Initials,
                                sipA2Findings: res.sipA2Findings,
                                sipA2Initials: res.sipA2Initials,
                                sipA3Findings: res.sipA3Findings,
                                sipA3Initials: res.sipA3Initials,
                                sipA4Findings: res.sipA4Findings,
                                sipA4Initials: res.sipA4Initials,
                                sipA5Findings: res.sipA5Findings,
                                sipA5Initials: res.sipA5Initials,
                                sipA6Findings: res.sipA6Findings,
                                sipA6Initials: res.sipA6Initials,
                                sipA7Findings: res.sipA7Findings,
                                sipA7Initials: res.sipA7Initials,
                                sipB1Findings: res.sipB1Findings,
                                sipB1Initials: res.sipB1Initials,
                                sipB21Findings: res.sipB21Findings,
                                sipB21Initials: res.sipB21Initials,
                                sipB22Findings: res.sipB22Findings,
                                sipB22Initials: res.sipB22Initials,
                                sipB23Findings: res.sipB23Findings,
                                sipB23Initials: res.sipB23Initials,
                                sipB24Findings: res.sipB24Findings,
                                sipB24Initials: res.sipB24Initials,
                                sipB25Findings: res.sipB25Findings,
                                sipB25Initials: res.sipB25Initials,
                                sipB31Findings: res.sipB31Findings,
                                sipB31Initials: res.sipB31Initials,
                                sipB32Findings: res.sipB32Findings,
                                sipB32Initials: res.sipB32Initials,
                                sipB41Findings: res.sipB41Findings,
                                sipB41Initials: res.sipB41Initials,
                                sipB42Findings: res.sipB42Findings,
                                sipB42Initials: res.sipB42Initials,
                                sipB43Findings: res.sipB43Findings,
                                sipB43Initials: res.sipB43Initials,
                                sipB44Findings: res.sipB44Findings,
                                sipB44Initials: res.sipB44Initials,
                                sipB51Findings: res.sipB51Findings,
                                sipB51Initials: res.sipB51Initials,
                                sipB52Findings: res.sipB52Findings,
                                sipB52Initials: res.sipB52Initials,
                                sipB53Findings: res.sipB53Findings,
                                sipB53Initials: res.sipB53Initials,
                                sipB54Findings: res.sipB54Findings,
                                sipB54Initials: res.sipB54Initials,
                                sipB55Findings: res.sipB55Findings,
                                sipB55Initials: res.sipB55Initials,
                                sipB61Findings: res.sipB61Findings,
                                sipB61Initials: res.sipB61Initials,
                                sipB62Findings: res.sipB62Findings,
                                sipB62Initials: res.sipB62Initials,
                                sipB63Findings: res.sipB63Findings,
                                sipB63Initials: res.sipB63Initials,
                                sipB64Findings: res.sipB64Findings,
                                sip64Initials: res.sip64Initials,
                                sipB71Findings: res.sipB71Findings,
                                sipB71Initials: res.sipB71Initials,
                                sipB72Findings: res.sipB72Findings,
                                sipB72Initials: res.sipB72Initials,
                                sipB73Findings: res.sipB73Findings,
                                sipB73Initials: res.sipB73Initials,
                                sipB74Findings: res.sipB74Findings,
                                sipB74Initials: res.sipB74Initials,
                                sipB75Findings: res.sipB75Findings,
                                sipB75Initials: res.sipB75Initials,
                                sipB81Findings: res.sipB81Findings,
                                sipB81Initials: res.sipB81Initials,
                                sipB82Findings: res.sipB82Findings,
                                sipB82Initials: res.sipB82Initials,
                                sipB83Findings: res.sipB83Findings,
                                sipB83Initials: res.sipB83Initials,
                                sipB84Findings: res.sipB84Findings,
                                sipB84Initials: res.sipB84Initials,
                                sipB85Findings: res.sipB85Findings,
                                sipB85Initials: res.sipB85Initials,
                                sipB86Findings: res.sipB86Findings,
                                sipB86Initials: res.sipB86Initials,
                                sipB91Findings: res.sipB91Findings,
                                sipB91Initials: res.sipB91Initials,
                                sipB92Findings: res.sipB92Findings,
                                sipB92Initials: res.sipB92Initials,
                              );

                              final pdfFile =
                                  await PdfInspectionApi.generate(inspection);

                              InspectionPdfApi.openFile(pdfFile);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavBar(),
                                  ));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                color: AppColors.greyAccent,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    // width: MediaQuery.of(context).size.width -
                                    //     160,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Account ID: ${res!.accountID.toString()}",
                                          style: AppTextStyles.title0,
                                        ),
                                        Text(
                                          "Inspection Date: ${res.inspectionDate}",
                                          style: AppTextStyles.subHeadings,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/cloud-storage.png',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget _buildMaintenanceRecords() {
    return Container(
      //color: Colors.red,
      //height: MediaQuery.of(context).size.height - 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              'Maintenance Task Card Records',
              style: AppTextStyles.title,
            ),
          ),
          ValueListenableBuilder(
              valueListenable:
                  Hive.box<MaintenanceTask>(HiveBoxesMaintenance.maintenance)
                      .listenable(),
              builder: (context, Box<MaintenanceTask> box, _) {
                if (box.values.isEmpty) {
                  return Container(
                      height: MediaQuery.of(context).size.height - 300,
                      child: Center(
                          child: Text(
                        "Record list is empty",
                        style: AppTextStyles.subHeadings,
                      )));
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 229,
                    //color: Colors.blue,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: isSearching ? searchCount : box.values.length,
                      itemBuilder: (context, index) {
                        int reverseIndex = box.length - 1 - index;
                        final MaintenanceTask? res = isSearching
                            ? box.values
                                .where((maintenance) =>
                                    maintenance.accountID == searchID)
                                .toList()[index]
                            : box.getAt(reverseIndex);
                        return ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: GestureDetector(
                            onTap: () async {
                              final date = DateTime.now();
                              // Box<ScheduledInspection>
                              //     inspectionForm =
                              //     Hive.box<ScheduledInspection>(
                              //         HiveBoxesInspection.inspection);

                              MaintenanceTask maintenance = MaintenanceTask(
                                accountID: res.accountID,
                                taskCardNumber: res.taskCardNumber,
                                taskCardSpecification:
                                    res.taskCardSpecification,
                                taskCardRevision: res.taskCardRevision,
                                taskCardRevisionDate: res.taskCardRevisionDate,
                                woSpecification: res.woSpecification,
                                woScheduleStart: res.woScheduleStart,
                                location: res.location,
                                aircraftType: res.aircraftType,
                                acReg: res.acReg,
                                acSerial: res.acSerial,
                                area: res.area,
                                student: res.student,
                                instructor: res.instructor,
                                taskCardType: res.taskCardType,
                                ata: res.ata,
                                mmEffectivity: res.mmEffectivity,
                                ipcEffectivity: res.ipcEffectivity,
                                manHours: res.manHours,
                                men: res.men,
                                user: res.user,
                                acRegA: res.acRegA,
                                userA: res.userA,
                                dateA: res.dateA,
                                itemNum: res.itemNum,
                                userActionDescription:
                                    res.userActionDescription,
                                studentB: res.studentB,
                                instructorB: res.instructorB,
                                inspectorB: res.inspectorB,
                                submittedBy: res.submittedBy,
                                reviewedBy: res.reviewedBy,
                                completedBy: res.completedBy,
                                dateCompletionB: res.dateCompletionB,
                                departmentB: res.departmentB,
                                acRegB: res.acRegB,
                                userB: res.userB,
                                dateB: res.dateB,
                                findingsA1: res.findingsA1,
                                findingsB1: res.findingsB1,
                                findingsLogbook1: res.findingsLogbook1,
                                findingsSolution1: res.findingsSolution1,
                                findingsResult1: res.findingsResult1,
                                findingsA2: res.findingsA2,
                                findingsB2: res.findingsB2,
                                findingsLogbook2: res.findingsLogbook2,
                                findingsSolution2: res.findingsSolution2,
                                findingsResult2: res.findingsResult2,
                                findingsA3: res.findingsA3,
                                findingsB3: res.findingsB3,
                                findingsLogbook3: res.findingsLogbook3,
                                findingsSolution3: res.findingsSolution3,
                                findingsResult3: res.findingsResult3,
                                findingsA4: res.findingsA4,
                                findingsB4: res.findingsB4,
                                findingsLogbook4: res.findingsLogbook4,
                                findingsSolution4: res.findingsSolution4,
                                findingsResult4: res.findingsResult4,
                                findingsA5: res.findingsA5,
                                findingsB5: res.findingsB5,
                                findingsLogbook5: res.findingsLogbook5,
                                findingsSolution5: res.findingsSolution5,
                                findingsResult5: res.findingsResult5,
                                findingsA6: res.findingsA6,
                                findingsB6: res.findingsB6,
                                findingsLogbook6: res.findingsLogbook6,
                                findingsSolution6: res.findingsSolution6,
                                findingsResult6: res.findingsResult6,
                              );

                              final pdfFile =
                                  await PdfMaintenanceApi.generate(maintenance);

                              MaintenancePdfApi.openFile(pdfFile);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavBar(),
                                  ));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                color: AppColors.greyAccent,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    // width: MediaQuery.of(context).size.width -
                                    //     160,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Account ID: ${res!.accountID.toString()}",
                                          style: AppTextStyles.title0,
                                        ),
                                        Text(
                                          "Inspection Date: ${res.dateB}",
                                          style: AppTextStyles.subHeadings,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/cloud-storage.png',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
