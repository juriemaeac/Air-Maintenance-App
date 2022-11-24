import 'package:airapp/Home/home.dart';
import 'package:airapp/boxes/boxInstructor.dart';
import 'package:airapp/boxes/boxMaintenance.dart';
import 'package:airapp/boxes/boxStudent.dart';
import 'package:airapp/database/instructor_model.dart';
import 'package:airapp/database/maintenanceTask_model.dart';
import 'package:airapp/database/student_model.dart';
import 'package:airapp/database/t.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ValueListenableBuilder(
                  valueListenable:
                      Hive.box<Student>(HiveBoxesStudent.student).listenable(),
                  builder: (context, Box<Student> box, _) {
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
                            final Student? res = isSearching
                                ? box.values
                                    .where((student) =>
                                        student.accountID == searchID)
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
                                                "Student Name: ${res.lastName}, ${res.name} ${res.middleName} ",
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
                                            final invoice = Invoice(
                                              studentPDF: StudentPDF(
                                                studentId: 1,
                                                name: 'name1',
                                              ),
                                              info: InvoiceInfo(
                                                date: DateTime.now(),
                                                balance: 1,
                                                description: 'description1',
                                                number: 'number1',
                                              ),
                                            );
                                            final pdfFile =
                                                await PdfMaintenanceApi
                                                    .generate(invoice);

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
