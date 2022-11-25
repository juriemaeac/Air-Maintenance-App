// import 'package:airapp/boxes/boxInstructor.dart';
// import 'package:airapp/boxes/boxMaintenance.dart';
// import 'package:airapp/boxes/boxStudent.dart';
// import 'package:airapp/database/instructor_model.dart';
// import 'package:airapp/database/maintenanceTask_model.dart';
// import 'package:airapp/database/student_model.dart';
// import 'package:airapp/navBar.dart';
// import 'package:airapp/pdfMaintenanceTask/pdfMaintenanceApi.dart';
// import 'package:airapp/pdfMaintenanceTask/maintenance_pdf_api.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class MaintenanceRecordPage extends StatefulWidget {
//   const MaintenanceRecordPage({super.key});

//   @override
//   State<MaintenanceRecordPage> createState() => _MaintenanceRecordPageState();
// }

// class _MaintenanceRecordPageState extends State<MaintenanceRecordPage> {
//   bool isSearching = false;
//   int? searchID;
//   bool? isEnabled = true;
//   int? searchCount = 1;
//   int? counter = 0;

//   @override
//   void initState() {
//     super.initState();
//     Hive.openBox<MaintenanceTask>(HiveBoxesMaintenance.maintenance);
//     Hive.openBox<Student>(HiveBoxesStudent.student);
//     Hive.openBox<Instructor>(HiveBoxesInstructor.instructor);
//     //var user = studentCredential.getString();
//     // isEnabled = true;
//     // if (user == '') {
//     //   Navigator.push(
//     //     context,
//     //     MaterialPageRoute(
//     //       builder: (context) => const LoginScreen(),
//     //     ),
//     //   );
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Text('maintenance Task Card Records'),
//           ValueListenableBuilder(
//               valueListenable:
//                   Hive.box<MaintenanceTask>(HiveBoxesMaintenance.maintenance)
//                       .listenable(),
//               builder: (context, Box<MaintenanceTask> box, _) {
//                 if (box.values.isEmpty) {
//                   return Center(
//                     child: Container(
//                         padding: const EdgeInsets.only(top: 120),
//                         child: const Text("Record list is empty")),
//                   );
//                 }
//                 return SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.45,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.vertical,
//                       itemCount: isSearching ? searchCount : box.values.length,
//                       itemBuilder: (context, index) {
//                         int reverseIndex = box.length - 1 - index;
//                         final MaintenanceTask? res = isSearching
//                             ? box.values
//                                 .where((maintenance) =>
//                                     maintenance.accountID == searchID)
//                                 .toList()[index]
//                             : box.getAt(reverseIndex);
//                         return ListTile(
//                           title: Container(
//                             padding: const EdgeInsets.only(
//                                 left: 30, right: 30, top: 5, bottom: 5),
//                             margin: const EdgeInsets.only(bottom: 5),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(15.0),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     SizedBox(
//                                       width: MediaQuery.of(context).size.width -
//                                           160,
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "Student ID: ${res!.accountID.toString()}",
//                                           ),
//                                           Text(
//                                             "Date: ${res.taskCardRevisionDate}",
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     IconButton(
//                                       padding: const EdgeInsets.all(3.0),
//                                       splashColor: Colors.transparent,
//                                       hoverColor: Colors.transparent,
//                                       //pde magg image asset dito
//                                       icon: Icon(
//                                         Icons.print,
//                                         color: Colors.black,
//                                       ),
//                                       onPressed: () async {
//                                         final date = DateTime.now();
//                                         // Box<MaintenanceTask> maintenance =
//                                         //     Hive.box<MaintenanceTask>(
//                                         //         HiveBoxesMaintenance
//                                         //             .maintenance);

//                                         MaintenanceTask maintenanceTask =
//                                             MaintenanceTask(
//                                           accountID: res.accountID,
//                                           taskCardNumber: res.taskCardNumber,
//                                           taskCardSpecification:
//                                               res.taskCardSpecification,
//                                           taskCardRevision:
//                                               res.taskCardRevision,
//                                           taskCardRevisionDate:
//                                               res.taskCardRevisionDate,
//                                           woSpecification: res.woSpecification,
//                                           woScheduleStart: res.woScheduleStart,
//                                           location: res.location,
//                                           aircraftType: res.aircraftType,
//                                           acReg: res.acReg,
//                                           acSerial: res.acSerial,
//                                           area: res.area,
//                                           student: res.student,
//                                           instructor: res.instructor,
//                                           taskCardType: res.taskCardType,
//                                           ata: res.ata,
//                                           mmEffectivity: res.mmEffectivity,
//                                           ipcEffectivity: res.ipcEffectivity,
//                                           manHours: res.manHours,
//                                           men: res.men,
//                                           user: res.user,
//                                           acRegA: res.acRegA,
//                                           userA: res.userA,
//                                           dateA: res.dateA,
//                                           itemNum: res.itemNum,
//                                           userActionDescription:
//                                               res.userActionDescription,
//                                           studentB: res.studentB,
//                                           instructorB: res.instructorB,
//                                           inspectorB: res.inspectorB,
//                                           submittedBy: res.submittedBy,
//                                           reviewedBy: res.reviewedBy,
//                                           completedBy: res.completedBy,
//                                           dateCompletionB: res.dateCompletionB,
//                                           departmentB: res.departmentB,
//                                           acRegB: res.acRegB,
//                                           userB: res.userB,
//                                           dateB: res.dateB,
//                                           findingsA1: res.findingsA1,
//                                           findingsB1: res.findingsB1,
//                                           findingsLogbook1:
//                                               res.findingsLogbook1,
//                                           findingsSolution1:
//                                               res.findingsSolution1,
//                                           findingsResult1: res.findingsResult1,
//                                           findingsA2: res.findingsA2,
//                                           findingsB2: res.findingsB2,
//                                           findingsLogbook2:
//                                               res.findingsLogbook2,
//                                           findingsSolution2:
//                                               res.findingsSolution2,
//                                           findingsResult2: res.findingsResult2,
//                                           findingsA3: res.findingsA3,
//                                           findingsB3: res.findingsB3,
//                                           findingsLogbook3:
//                                               res.findingsLogbook3,
//                                           findingsSolution3:
//                                               res.findingsSolution3,
//                                           findingsResult3: res.findingsResult3,
//                                           findingsA4: res.findingsA4,
//                                           findingsB4: res.findingsB4,
//                                           findingsLogbook4:
//                                               res.findingsLogbook4,
//                                           findingsSolution4:
//                                               res.findingsSolution4,
//                                           findingsResult4: res.findingsResult4,
//                                           findingsA5: res.findingsA5,
//                                           findingsB5: res.findingsB5,
//                                           findingsLogbook5:
//                                               res.findingsLogbook5,
//                                           findingsSolution5:
//                                               res.findingsSolution5,
//                                           findingsResult5: res.findingsResult5,
//                                           findingsA6: res.findingsA6,
//                                           findingsB6: res.findingsB6,
//                                           findingsLogbook6:
//                                               res.findingsLogbook6,
//                                           findingsSolution6:
//                                               res.findingsSolution6,
//                                           findingsResult6: res.findingsResult6,
//                                         );

//                                         final pdfFile =
//                                             await PdfMaintenanceApi.generate(
//                                                 maintenanceTask);

//                                         MaintenancePdfApi.openFile(pdfFile);

//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) => NavBar(),
//                                             ));
//                                       },
//                                     ),

//                                     // IconButton(
//                                     //   padding: const EdgeInsets.all(3.0),
//                                     //   splashColor: Colors.transparent,
//                                     //   hoverColor: Colors.transparent,
//                                     //   icon: SizedBox(
//                                     //     height: 60,
//                                     //     width: 60,
//                                     //     child: SvgPicture.asset(
//                                     //       'assets/delete_svg.svg',
//                                     //     ),
//                                     //   ),
//                                     //   onPressed: () {
//                                     //     res.delete();
//                                     //   },
//                                     // ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 );
//               }),
//         ],
//       ),
//     );
//   }
// }
