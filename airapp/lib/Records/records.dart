import 'package:airapp/Home/home.dart';
import 'package:airapp/boxes/boxInspection.dart';
import 'package:airapp/boxes/boxInstructor.dart';
import 'package:airapp/boxes/boxMaintenance.dart';
import 'package:airapp/boxes/boxStudent.dart';
import 'package:airapp/database/instructor_model.dart';
import 'package:airapp/database/maintenanceTask_model.dart';
import 'package:airapp/database/scheduledInspection_model.dart';
import 'package:airapp/database/student_model.dart';
import 'package:airapp/navBar.dart';
import 'package:airapp/pdf/api/pdf_api.dart';
import 'package:airapp/pdf/api/pdfMaintenanceApi.dart';
import 'package:airapp/pdf/model/invoice.dart';
import 'package:airapp/pdf/model/studentPDF.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  bool isSearching = false;
  int? searchID;
  bool? isEnabled = true;
  int? searchCount = 1;
  int? counter = 0;
  bool? isMaintenance;

  @override
  void initState() {
    super.initState();
    Hive.openBox<MaintenanceTask>(HiveBoxesMaintenance.maintenance);
    Hive.openBox<Student>(HiveBoxesStudent.student);
    Hive.openBox<Instructor>(HiveBoxesInstructor.instructor);
    Hive.openBox<ScheduledInspection>(HiveBoxesInspection.inspection);
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
          child: Column(
            children: [
              ValueListenableBuilder(
                  valueListenable: Hive.box<ScheduledInspection>(
                          HiveBoxesInspection.inspection)
                      .listenable(),
                  builder: (context, Box<ScheduledInspection> box, _) {
                    if (box.values.isEmpty) {
                      return Center(
                        child: Container(
                            padding: const EdgeInsets.only(top: 120),
                            child: const Text("Record list is empty")),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount:
                              isSearching ? searchCount : box.values.length,
                          itemBuilder: (context, index) {
                            int reverseIndex = box.length - 1 - index;
                            final ScheduledInspection? res = isSearching
                                ? box.values
                                    .where((inspection) =>
                                        inspection.accountID == searchID)
                                    .toList()[index]
                                : box.getAt(reverseIndex);
                            return ListTile(
                              title: Container(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 5, bottom: 5),
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              160,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Student ID: ${res!.accountID.toString()}",
                                              ),
                                              Text(
                                                "Inspection Date: ${res.inspectionDate}",
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          padding: const EdgeInsets.all(3.0),
                                          splashColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          //pde magg image asset dito
                                          icon: Icon(
                                            Icons.print,
                                            color: Colors.black,
                                          ),
                                          onPressed: () async {
                                            final date = DateTime.now();
                                            //change to name ng model para malagay sa mismong pdf
                                            // final invoice = Invoice(
                                            //   studentPDF: StudentPDF(
                                            //     studentId: 1,
                                            //     name: '${res.accountID}',
                                            //   ),
                                            //   info: InvoiceInfo(
                                            //     date: DateTime.now(),
                                            //     balance: 1,
                                            //     description: 'description',
                                            //     number: 'number1',
                                            //   ),
                                            // );
                                            Box<ScheduledInspection>
                                                inspectionForm =
                                                Hive.box<ScheduledInspection>(
                                                    HiveBoxesInspection
                                                        .inspection);

                                            ScheduledInspection inspection =
                                                ScheduledInspection(
                                              accountID: res.accountID,
                                              inspectionDate:
                                                  res.inspectionDate,
                                              sipA11Findings:
                                                  res.sipA11Findings,
                                              sipA11Initials:
                                                  res.sipA11Initials,
                                              sipA12Findings:
                                                  res.sipA12Findings,
                                              sipA12Initials:
                                                  res.sipA12Initials,
                                              sipA13Findings:
                                                  res.sipA13Findings,
                                              sipA13Initials:
                                                  res.sipA13Initials,
                                              sipA14Findings:
                                                  res.sipA14Findings,
                                              sipA14Initials:
                                                  res.sipA14Initials,
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
                                              sipB21Findings:
                                                  res.sipB21Findings,
                                              sipB21Initials:
                                                  res.sipB21Initials,
                                              sipB22Findings:
                                                  res.sipB22Findings,
                                              sipB22Initials:
                                                  res.sipB22Initials,
                                              sipB23Findings:
                                                  res.sipB23Findings,
                                              sipB23Initials:
                                                  res.sipB23Initials,
                                              sipB24Findings:
                                                  res.sipB24Findings,
                                              sipB24Initials:
                                                  res.sipB24Initials,
                                              sipB25Findings:
                                                  res.sipB25Findings,
                                              sipB25Initials:
                                                  res.sipB25Initials,
                                              sipB31Findings:
                                                  res.sipB31Findings,
                                              sipB31Initials:
                                                  res.sipB31Initials,
                                              sipB32Findings:
                                                  res.sipB32Findings,
                                              sipB32Initials:
                                                  res.sipB32Initials,
                                              sipB41Findings:
                                                  res.sipB41Findings,
                                              sipB41Initials:
                                                  res.sipB41Initials,
                                              sipB42Findings:
                                                  res.sipB42Findings,
                                              sipB42Initials:
                                                  res.sipB42Initials,
                                              sipB43Findings:
                                                  res.sipB43Findings,
                                              sipB43Initials:
                                                  res.sipB43Initials,
                                              sipB44Findings:
                                                  res.sipB44Findings,
                                              sipB44Initials:
                                                  res.sipB44Initials,
                                              sipB51Findings:
                                                  res.sipB51Findings,
                                              sipB51Initials:
                                                  res.sipB51Initials,
                                              sipB52Findings:
                                                  res.sipB52Findings,
                                              sipB52Initials:
                                                  res.sipB52Initials,
                                              sipB53Findings:
                                                  res.sipB53Findings,
                                              sipB53Initials:
                                                  res.sipB53Initials,
                                              sipB54Findings:
                                                  res.sipB54Findings,
                                              sipB54Initials:
                                                  res.sipB54Initials,
                                              sipB55Findings:
                                                  res.sipB55Findings,
                                              sipB55Initials:
                                                  res.sipB55Initials,
                                              sipB61Findings:
                                                  res.sipB61Findings,
                                              sipB61Initials:
                                                  res.sipB61Initials,
                                              sipB62Findings:
                                                  res.sipB62Findings,
                                              sipB62Initials:
                                                  res.sipB62Initials,
                                              sipB63Findings:
                                                  res.sipB63Findings,
                                              sipB63Initials:
                                                  res.sipB63Initials,
                                              sipB64Findings:
                                                  res.sipB64Findings,
                                              sip64Initials: res.sip64Initials,
                                              sipB71Findings:
                                                  res.sipB71Findings,
                                              sipB71Initials:
                                                  res.sipB71Initials,
                                              sipB72Findings:
                                                  res.sipB72Findings,
                                              sipB72Initials:
                                                  res.sipB72Initials,
                                              sipB73Findings:
                                                  res.sipB73Findings,
                                              sipB73Initials:
                                                  res.sipB73Initials,
                                              sipB74Findings:
                                                  res.sipB74Findings,
                                              sipB74Initials:
                                                  res.sipB74Initials,
                                              sipB75Findings:
                                                  res.sipB75Findings,
                                              sipB75Initials:
                                                  res.sipB75Initials,
                                              sipB81Findings:
                                                  res.sipB81Findings,
                                              sipB81Initials:
                                                  res.sipB81Initials,
                                              sipB82Findings:
                                                  res.sipB82Findings,
                                              sipB82Initials:
                                                  res.sipB82Initials,
                                              sipB83Findings:
                                                  res.sipB83Findings,
                                              sipB83Initials:
                                                  res.sipB83Initials,
                                              sipB84Findings:
                                                  res.sipB84Findings,
                                              sipB84Initials:
                                                  res.sipB84Initials,
                                              sipB85Findings:
                                                  res.sipB85Findings,
                                              sipB85Initials:
                                                  res.sipB85Initials,
                                              sipB86Findings:
                                                  res.sipB86Findings,
                                              sipB86Initials:
                                                  res.sipB86Initials,
                                              sipB91Findings:
                                                  res.sipB91Findings,
                                              sipB91Initials:
                                                  res.sipB91Initials,
                                              sipB92Findings:
                                                  res.sipB92Findings,
                                              sipB92Initials:
                                                  res.sipB92Initials,
                                            );

                                            final pdfFile =
                                                await PdfMaintenanceApi
                                                    .generate(inspection);

                                            PdfApi.openFile(pdfFile);

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      NavBar(),
                                                ));
                                          },
                                        ),

                                        // IconButton(
                                        //   padding: const EdgeInsets.all(3.0),
                                        //   splashColor: Colors.transparent,
                                        //   hoverColor: Colors.transparent,
                                        //   icon: SizedBox(
                                        //     height: 60,
                                        //     width: 60,
                                        //     child: SvgPicture.asset(
                                        //       'assets/delete_svg.svg',
                                        //     ),
                                        //   ),
                                        //   onPressed: () {
                                        //     res.delete();
                                        //   },
                                        // ),
                                      ],
                                    ),
                                  ],
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
        ),
      ),
    );
  }
}
