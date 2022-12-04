import 'package:airapp/Profile/editProfileInstructor.dart';
import 'package:airapp/Profile/editProfileStudent.dart';
import 'package:airapp/constants.dart';
import 'package:airapp/landingPage.dart';
import 'package:airapp/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../boxes/boxInspection.dart';
import '../boxes/boxInstructor.dart';
import '../boxes/boxMaintenance.dart';
import '../boxes/boxStudent.dart';
import '../database/instructor_model.dart';
import '../database/maintenanceTask_model.dart';
import '../database/scheduledInspection_model.dart';
import '../database/student_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? username = "No Username";
  String? email = "No Email";
  String? name = "No Name";
  String? userAccountID = "No Account ID";
  String? department = "No Department";
  String? schoolYear = "No School Year";
  String? schoolSection = "No School Section";
  String? userType = "Null";
  String? userBirthdate = "N/A";
  bool? isVisible = true;
  int? taskRec = 0;
  int? inspRec = 0;
  @override
  void initState() {
    super.initState();
    username = userCredential.username;
    name = userCredential.name;
    department = userCredential.department;
    userAccountID = userCredential.accountID;
    schoolYear = userCredential.schoolYear;
    schoolSection = userCredential.schoolSection;
    userBirthdate = userCredential.birthdate;
    authenticateUser();
  }

  void authenticateUser() {
    int countTask = 0;
    int countInsp = 0;
    Box<Student> studentBox = Hive.box<Student>(HiveBoxesStudent.student);
    Box<Instructor> instructorBox =
        Hive.box<Instructor>(HiveBoxesInstructor.instructor);
    Box<ScheduledInspection> inspectionBox =
        Hive.box<ScheduledInspection>(HiveBoxesInspection.inspection);
    Box<MaintenanceTask> maintenanceBox =
        Hive.box<MaintenanceTask>(HiveBoxesMaintenance.maintenance);
    for (var students in studentBox.values) {
      if (students.accountID == userAccountID) {
        userType = "Student";
        print("User is a Student!");
        isVisible = true;
        for (var recs in inspectionBox.values) {
          if (recs.accountID == userAccountID) {
            countInsp += 1;
          }
        }
        for (var recs in maintenanceBox.values) {
          if (recs.accountID == userAccountID) {
            countTask += 1;
          }
        }
      }
    }
    for (var instructors in instructorBox.values) {
      if (instructors.accountID == userAccountID) {
        userType = "Instructor";
        print("User is an Instructor!");
        isVisible = false;
        for (var recs in inspectionBox.values) {
          if (recs.accountID == userAccountID) {
            countInsp += 1;
          }
        }
        for (var recs in maintenanceBox.values) {
          if (recs.accountID == userAccountID) {
            countTask += 1;
          }
        }
      }
    }
    taskRec = countTask;
    inspRec = countInsp;
  }

  getUserAccount(String accountID, String userType) {
    if (userType == "Student") {
      Box<Student> studentBox = Hive.box<Student>(HiveBoxesStudent.student);
      int index = 0;
      for (final student in studentBox.values) {
        print("FInding user at index: $index");
        if (student.accountID == accountID) {
          print("User found at index: $index");
          Student studentAccount = Student(
            name: student.name,
            userName: student.userName,
            middleName: student.middleName,
            lastName: student.lastName,
            accountID: student.accountID,
            schoolSection: student.schoolSection,
            schoolYear: student.schoolYear,
            birthdate: student.birthdate,
            department: student.department,
            password: student.password,
          );
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditProfilePageStudent(
                        studentAccount: studentAccount,
                        studentIndex: index,
                      )));
        }
        index += 1;
      }
    } else if (userType == "Instructor") {
      Box<Instructor> instructorBox =
          Hive.box<Instructor>(HiveBoxesInstructor.instructor);
      int index = 0;
      for (final instructor in instructorBox.values) {
        print("FInding user at index: $index");
        if (instructor.accountID == accountID) {
          print("User found at index: $index");
          Instructor instructorAccount = Instructor(
            name: instructor.name,
            userName: instructor.userName,
            middleName: instructor.middleName,
            lastName: instructor.lastName,
            accountID: instructor.accountID,
            department: instructor.department,
            password: instructor.password,
          );
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditProfileInstructor(
                        instructorAccount: instructorAccount,
                        instructorIndex: index,
                      )));
        }
        index += 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.blueAccent,
                          shape: BoxShape.circle,
                          //borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.airplanemode_active_rounded,
                          size: 50,
                          color: AppColors.yellowAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    name!,
                    style: AppTextStyles.headings.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    username!,
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getUserAccount(userAccountID!, userType!);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.blueAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: AppColors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Edit Profile',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      child: Column(
                    children: [
                      Container(
                        child: Center(
                            child:
                                Text('Records', style: AppTextStyles.headings)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(inspRec!.toString(),
                                  style: AppTextStyles.headings1.copyWith(
                                    fontSize: 60,
                                  )),
                              Text('Inspections',
                                  style: AppTextStyles.subHeadings),
                            ],
                          ),
                          Container(
                            width: 2,
                            height: 90,
                            color: AppColors.greyAccentLine,
                          ),
                          Column(
                            children: [
                              Text(taskRec!.toString(),
                                  style: AppTextStyles.headings1.copyWith(
                                    fontSize: 60,
                                  )),
                              Text('Task Cards',
                                  style: AppTextStyles.subHeadings),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text('Account ID: ',
                              style: AppTextStyles.subtitle)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: Text(userAccountID!,
                            style: AppTextStyles.textFields),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: isVisible!,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            child: Text('Birthdate: ',
                                style: AppTextStyles.subtitle)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text(userBirthdate!,
                              style: AppTextStyles.textFields),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text('Department: ',
                              style: AppTextStyles.subtitle)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child:
                            Text(department!, style: AppTextStyles.textFields),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: isVisible!,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text('School Year: ',
                              style: AppTextStyles.subtitle),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text(schoolYear!,
                              style: AppTextStyles.textFields),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: isVisible!,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            child: Text('School Section: ',
                                style: AppTextStyles.subtitle)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: Text(schoolSection!,
                              style: AppTextStyles.textFields),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      userCredential.setUsername("");
                      userCredential.setName("");
                      userCredential.setDepartment("");
                      userCredential.setAccountID("");
                      userCredential.setSchoolYear("");
                      userCredential.setSchoolSection("");
                      userCredential.setBirthdate("");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LandingPage();
                      }));
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 60)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.redAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                    ),
                    child: Text('Logout',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 15,
                        )),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
