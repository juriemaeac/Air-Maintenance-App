import 'package:airapp/Home/formsWidget.dart';
import 'package:airapp/Home/profileDetails.dart';
import 'package:airapp/authentication/login.dart';
import 'package:airapp/home/calendar/calendarSection.dart';
import 'package:airapp/home/manual/manualWidget.dart';
import 'package:airapp/constants.dart';
import 'package:airapp/manualList.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../boxes/boxInspection.dart';
import '../boxes/boxMaintenance.dart';
import '../database/maintenanceTask_model.dart';
import '../database/scheduledInspection_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name;
  int? totalRecords = 0;
  String? initials = "A";
  double sizeFont = 100;
  @override
  void initState() {
    super.initState();
    name = userCredential.name;
    initials = userCredential.nameInitial;
    var maintenanceRecords =
        Hive.box<MaintenanceTask>(HiveBoxesMaintenance.maintenance).length;
    var inspectionRecords =
        Hive.box<ScheduledInspection>(HiveBoxesInspection.inspection).length;
    totalRecords = maintenanceRecords + inspectionRecords;
    if (totalRecords! > 99) {
      sizeFont = 70;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        //color: AppColors.greyAccent,
        //padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello! ', style: AppTextStyles.subtitle),
                        Text('$name',
                            style: AppTextStyles.headings2.copyWith(
                              color: AppColors.yellowAccent,
                            )),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 35,
                        width: 35,
                        //padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.blueAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Center(
                            child: Text(initials!,
                                style: AppTextStyles.headings2.copyWith(
                                    color: AppColors.yellowAccent,
                                    fontSize: 18)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CalendarSection(),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Maintenance',
                      style: AppTextStyles.title,
                    ),
                    GestureDetector(
                      onTap: displayHowdialog,
                      child: Text(
                        'How to Use',
                        style: AppTextStyles.subHeadings,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 250,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      decoration: BoxDecoration(
                        color: AppColors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(70, 136, 136, 136),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_copy_rounded,
                                  color: AppColors.yellowAccent,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Records',
                                    style: AppTextStyles.subtitle2
                                        .copyWith(color: AppColors.white)),
                              ],
                            ),
                          ),
                          Text('$totalRecords',
                              style: TextStyle(
                                color: AppColors.yellowAccent,
                                fontSize: sizeFont,
                                fontWeight: FontWeight.w500,
                                //fontFamily: 'Poppins',
                              )),
                          Column(
                            children: [
                              Text('Total Documents',
                                  style: AppTextStyles.subtitle2.copyWith(
                                    color: AppColors.white,
                                  )),
                              Text('Local Database',
                                  style: AppTextStyles.subHeadings.copyWith(
                                    color: Color.fromARGB(106, 240, 240, 240),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FormWidget(),
                  ],
                ),
              ),
              Container(
                //color: Colors.amber,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Details(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Manuals',
                      style: AppTextStyles.title,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ManualList()));
                      },
                      child: Text(
                        'View All',
                        style: AppTextStyles.subHeadings,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //color: Colors.amber,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Manuals(),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  displayHowdialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: AppColors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Guide and Instructions',
                style: AppTextStyles.title,
              ),
            ],
          ),
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.only(left: 30, right: 30, top: 15),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The human interface maintenance checklist/task card is an instructional application for the avionics students to use and be familiarized with the Aircraft Maintenance Manual and Air Transportation Association (ATA) Chapters that are being used in the aviation field. For them to be able to diminish some of the dirty dozen and enhance their human factors. \n\nUse the application instructions found on this page along with the guidance in the activity form and manuals and to be submitted to the assigned avionics instructor. ',
                    style: AppTextStyles.subtitle,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Registration Process:',
                    style: AppTextStyles.title,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      '1.	Go to the register if you don’t have an account.\n2.	Click Create Account\n3.	The sign up form will appear and it needs to be filled with the user’s personal information.\n4.	Review Human Interface MTC Application’s Terms of Service and Privacy Policy, then click I agree.\n5.	Your account will be created.',
                      style: AppTextStyles.subtitle,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'To Signing in in to your Account:',
                    style: AppTextStyles.title,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      '1.	Open the application.\n2.	Type your user name and password, then click Enter.\n3.	To sign out - To sign out, click the corresponding settings and select Sign out.',
                      style: AppTextStyles.subtitle,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: AppColors.greyAccentLine,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Home page consist the Application Guide and Instructions and the Manuals',
                    style: AppTextStyles.subtitle,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: AppColors.greyAccentLine,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Selection of the Manuals:',
                    style: AppTextStyles.title,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      '1.	Sign in to your account and click enter.\n2.	Once Signed in you will proceed automatically to the Home Page\n3.	Select the manual that you want to open and browse it.\n4.	After browsing it you can click back to go to the home page or proceed to the activity.',
                      style: AppTextStyles.subtitle,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Activity Procedure:',
                    style: AppTextStyles.title,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      '1.	Sign in to your account and click enter.\n2.	Once Signed in you will proceed automatically to the Home Page.\n3.	You can click the activity to proceed and read the instructions.\n4.	Fill out the activity form\n5.	Once done filling the activity form, you will be proceeded to the double check page to double check your form.\n6.	After filling out the form you can save the form. \n7.	Download the form and submit the form to your respective avionics instructor. ',
                      style: AppTextStyles.subtitle,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Close", style: AppTextStyles.subHeadings),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
