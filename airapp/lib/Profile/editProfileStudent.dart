import 'package:airapp/constants.dart';
import 'package:airapp/navBar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hive/hive.dart';
import 'package:airapp/authentication/login.dart';
import '../boxes/boxStudent.dart';
import '../database/student_model.dart';
import '../landingPage.dart';

class EditProfilePageStudent extends StatefulWidget {
  Student? studentAccount;
  int? studentIndex;
  EditProfilePageStudent(
      {super.key, required this.studentAccount, required this.studentIndex});
  @override
  State<EditProfilePageStudent> createState() => _EditProfilePageStudentState();
}

class _EditProfilePageStudentState extends State<EditProfilePageStudent> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isObscure = false;

  String? username;
  String? name;
  String? middleName;
  String? lastName;
  String? accountID;
  String? schoolSection;
  String? schoolYear;
  String? birthdate;
  String? department;
  String? password;
  String? confirmPassword;
  int? studentIndex;
  List<String> departmentOptions = [
    "AET",
    "AMT",
    "AERO-ENG",
    "AIR TRANSPORTATION",
  ];

  @override
  void initState() {
    Hive.openBox<Student>(HiveBoxesStudent.student);
  }

  @override
  Widget build(BuildContext context) {
    studentIndex = widget.studentIndex;
    username = widget.studentAccount?.userName ?? '';
    name = widget.studentAccount?.name ?? '';
    middleName = widget.studentAccount?.middleName ?? '';
    lastName = widget.studentAccount?.lastName ?? '';
    accountID = widget.studentAccount?.accountID ?? '';
    schoolSection = widget.studentAccount?.schoolSection ?? '';
    schoolYear = widget.studentAccount?.schoolYear ?? '';
    birthdate = widget.studentAccount?.birthdate ?? '';
    department = widget.studentAccount?.department ?? '';
    password = widget.studentAccount?.password ?? '';
    TextEditingController textusernameController = TextEditingController()
      ..text = username ?? "";
    TextEditingController textnameController = TextEditingController()
      ..text = name ?? "";
    TextEditingController textmiddleNameController = TextEditingController()
      ..text = middleName ?? "";
    TextEditingController textlastNameController = TextEditingController()
      ..text = lastName ?? "";
    TextEditingController textaccountIDController = TextEditingController()
      ..text = accountID ?? "";
    TextEditingController textschoolSectionController = TextEditingController()
      ..text = schoolSection ?? "";
    TextEditingController textschoolYearController = TextEditingController()
      ..text = schoolYear ?? "";
    TextEditingController textdepartmentController = TextEditingController()
      ..text = department ?? "";
    TextEditingController textpasswordController = TextEditingController()
      ..text = password ?? "";
    TextEditingController textBirthdateController = TextEditingController()
      ..text = birthdate ?? "";
    @override
    void initState() {
      super.initState();
      textusernameController.addListener(() {
        setState(() {
          username = textusernameController.text;
        });
      });
      textnameController.addListener(() {
        setState(() {
          name = textnameController.text;
        });
      });
      textmiddleNameController.addListener(() {
        setState(() {
          middleName = textmiddleNameController.text;
        });
      });
      textlastNameController.addListener(() {
        setState(() {
          lastName = textlastNameController.text;
        });
      });
      textaccountIDController.addListener(() {
        setState(() {
          accountID = textaccountIDController.text;
        });
      });
      textschoolSectionController.addListener(() {
        setState(() {
          schoolSection = textschoolSectionController.text;
        });
      });
      textschoolYearController.addListener(() {
        setState(() {
          schoolYear = textschoolYearController.text;
        });
      });
      textdepartmentController.addListener(() {
        setState(() {
          department = textdepartmentController.text;
        });
      });
      textpasswordController.addListener(() {
        setState(() {
          password = textpasswordController.text;
        });
      });
      textBirthdateController.addListener(() {
        setState(() {
          birthdate = textBirthdateController.text;
        });
      });
    }

    @override
    void dispose() {
      textusernameController.dispose();
      textnameController.dispose();
      textmiddleNameController.dispose();
      textlastNameController.dispose();
      textaccountIDController.dispose();
      textschoolSectionController.dispose();
      textschoolYearController.dispose();
      textdepartmentController.dispose();
      textpasswordController.dispose();
      textBirthdateController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Edit Profile")),
        backgroundColor: AppColors.yellowAccent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(30),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Username', style: AppTextStyles.subtitle2),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.greyAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: textusernameController,
                      style: AppTextStyles.textFields,
                      decoration: const InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 25, right: 13),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: AppColors.blueAccent, width: 2),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          username = textusernameController.text;
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 35,
                        padding: const EdgeInsets.only(left: 8.0),
                        child:
                            Text('First Name', style: AppTextStyles.subtitle2),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 35,
                        padding: const EdgeInsets.only(left: 18.0),
                        child:
                            Text('Middle Name', style: AppTextStyles.subtitle2),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 35,
                          height: 50,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.greyAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: textnameController,
                            style: AppTextStyles.textFields,
                            decoration: const InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 25, right: 13),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: AppColors.blueAccent, width: 2),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                name = value;
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
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 35,
                          height: 50,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.greyAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: textmiddleNameController,
                            style: AppTextStyles.textFields,
                            decoration: const InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 25, right: 13),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: AppColors.blueAccent, width: 2),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                middleName = value;
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 35,
                        padding: const EdgeInsets.only(left: 8.0),
                        child:
                            Text('Last Name', style: AppTextStyles.subtitle2),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 35,
                        padding: const EdgeInsets.only(left: 18.0),
                        child:
                            Text('Student No.', style: AppTextStyles.subtitle2),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2 - 35,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.greyAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: textlastNameController,
                            style: AppTextStyles.textFields,
                            decoration: const InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 25, right: 13),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: AppColors.blueAccent, width: 2),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                lastName = value;
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
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2 - 35,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.greyAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: textaccountIDController,
                            style: AppTextStyles.textFields,
                            decoration: const InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 25, right: 13),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: AppColors.blueAccent, width: 2),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                accountID = value;
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child:
                            Text('Birthdate', style: AppTextStyles.subtitle2),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 60, // / 2 - 5,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.greyAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1900, 1, 1),
                            maxTime: DateTime(2022, 12, 31), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          print('confirm $date');
                          setState(() {
                            var dateTime = DateTime.parse(date.toString());
                            var formate1 =
                                "${dateTime.day}-${dateTime.month}-${dateTime.year}";
                            textBirthdateController.text = formate1;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      controller: textBirthdateController,
                      style: AppTextStyles.textFields,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 25, right: 25),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: AppColors.blueAccent, width: 2),
                        ),
                        suffixIcon: const Icon(
                          Icons.calendar_month_rounded,
                          color: AppColors.blueAccent,
                        ),
                      ),
                      validator: (var value) {
                        if (value!.isEmpty) {
                          return 'Enter Birthdate';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 35,
                        padding: const EdgeInsets.only(left: 8.0),
                        child:
                            Text('School Year', style: AppTextStyles.subtitle2),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 35,
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text('School Section',
                            style: AppTextStyles.subtitle2),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2 - 35,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.greyAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: textschoolYearController,
                            style: AppTextStyles.textFields,
                            decoration: const InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 25, right: 13),
                              labelStyle: AppTextStyles.subHeadings,
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: AppColors.blueAccent, width: 2),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                schoolYear = value;
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
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2 - 35,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.greyAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: textschoolSectionController,
                            style: AppTextStyles.textFields,
                            decoration: const InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 25, right: 13),
                              labelStyle: AppTextStyles.subHeadings,
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: AppColors.blueAccent, width: 2),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                schoolSection = value;
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 8.0),
                  //       child: Text('Department',
                  //           style: AppTextStyles.subtitle2),
                  //     ),
                  //   ],
                  // ),
                  // Container(
                  //   height: 50,
                  //   margin: const EdgeInsets.symmetric(vertical: 5),
                  //   width: MediaQuery.of(context).size.width,
                  //   padding: const EdgeInsets.only(left: 25, right: 25),
                  //   decoration: BoxDecoration(
                  //     color: AppColors.greyAccent,
                  //     borderRadius: BorderRadius.circular(10),
                  //     //border: Border.all(color: AppColors.greyAccent),
                  //   ),
                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButton2(
                  //       hint: Text(
                  //         'Select Department',
                  //         style: AppTextStyles.subHeadings,
                  //       ),
                  //       items: departmentOptions
                  //           .map((item) => DropdownMenuItem<String>(
                  //                 value: item,
                  //                 child: Text(
                  //                   item,
                  //                   style: AppTextStyles.textFields,
                  //                 ),
                  //               ))
                  //           .toList(),
                  //       value: department,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           department = value as String;
                  //         });
                  //       },
                  //       buttonHeight: 40,
                  //       buttonWidth: 140,
                  //       itemHeight: 40,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Change Password',
                            style: AppTextStyles.subtitle2),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.greyAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: textpasswordController,
                      obscureText: !_isObscure,
                      style: AppTextStyles.textFields,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 25, right: 25),
                        labelStyle: AppTextStyles.subHeadings,
                        border: InputBorder.none,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide:
                              BorderSide(color: AppColors.blueAccent, width: 2),
                        ),
                        suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value;
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavBar()));
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 55)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.greyAccent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                        ),
                        child: Text('CANCEL',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 15,
                            )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          saveStudent();
                          userCredential.setUsername("");
                          userCredential.setName("");
                          userCredential.setDepartment("");
                          userCredential.setAccountID("");
                          userCredential.setSchoolYear("");
                          userCredential.setSchoolSection("");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LandingPage();
                          }));
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 55)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.blueAccent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                        ),
                        child: Text('SAVE',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveStudent() {
    Box<Student> studentBox = Hive.box<Student>(HiveBoxesStudent.student);
    studentBox.putAt(
        studentIndex!,
        Student(
          userName: username,
          name: name,
          middleName: middleName,
          lastName: lastName,
          accountID: accountID,
          schoolSection: schoolSection,
          schoolYear: schoolYear,
          birthdate: birthdate,
          department: department,
          password: password,
        ));
    print("User Profile has been saved!");
    Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar()));
  }
}
