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

  String? usernameLocal;
  String? nameLocal;
  String? middleNameLocal;
  String? lastNameLocal;
  String? accountIDLocal;
  String? schoolSectionLocal;
  String? schoolYearLocal;
  String? birthdateLocal;
  String? departmentLocal;
  String? passwordLocal;
  String? confirmPasswordLocal;
  int? studentIndexLocal;
  List<String> departmentOptions = [
    "AET",
    "AMT",
    "AERO-ENG",
    "AIR TRANSPORTATION",
  ];

  TextEditingController _textusernameController = TextEditingController()
    ..text = "";
  TextEditingController _textnameController = TextEditingController()
    ..text = "";
  TextEditingController _textmiddleNameController = TextEditingController()
    ..text = "";
  TextEditingController _textlastNameController = TextEditingController()
    ..text = "";
  TextEditingController _textaccountIDController = TextEditingController()
    ..text = "";
  TextEditingController _textschoolSectionController = TextEditingController()
    ..text = "";
  TextEditingController _textschoolYearController = TextEditingController()
    ..text = "";
  TextEditingController _textdepartmentController = TextEditingController()
    ..text = "";
  TextEditingController _textpasswordController = TextEditingController()
    ..text = "";
  TextEditingController _textBirthdateController = TextEditingController()
    ..text = "";
  @override
  void initState() {
    super.initState();
    Hive.openBox<Student>(HiveBoxesStudent.student);
    usernameLocal = widget.studentAccount?.userName;
    nameLocal = widget.studentAccount?.name;
    middleNameLocal = widget.studentAccount?.middleName;
    lastNameLocal = widget.studentAccount?.lastName;
    accountIDLocal = widget.studentAccount?.accountID;
    schoolSectionLocal = widget.studentAccount?.schoolSection;
    schoolYearLocal = widget.studentAccount?.schoolYear;
    birthdateLocal = widget.studentAccount?.birthdate;
    departmentLocal = widget.studentAccount?.department;
    passwordLocal = widget.studentAccount?.password;
    studentIndexLocal = widget.studentIndex;
    _textusernameController.text = usernameLocal ?? "";
    _textnameController.text = nameLocal ?? "";
    _textmiddleNameController.text = middleNameLocal ?? "";
    _textlastNameController.text = lastNameLocal ?? "";
    _textaccountIDController.text = accountIDLocal ?? "";
    _textschoolSectionController.text = schoolSectionLocal ?? "";
    _textschoolYearController.text = schoolYearLocal ?? "";
    _textdepartmentController.text = departmentLocal ?? "";
    _textpasswordController.text = passwordLocal ?? "";
    _textBirthdateController.text = birthdateLocal ?? "";
  }

  @override
  Widget build(BuildContext context) {
    // @override
    // void dispose() {
    //   _textusernameController.dispose();
    //   _textnameController.dispose();
    //   _textmiddleNameController.dispose();
    //   _textlastNameController.dispose();
    //   _textaccountIDController.dispose();
    //   _textschoolSectionController.dispose();
    //   _textschoolYearController.dispose();
    //   _textdepartmentController.dispose();
    //   _textpasswordController.dispose();
    //   _textBirthdateController.dispose();
    //   super.dispose();
    // }

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
                      autofocus: true,
                      //initialValue: usernameLocal,
                      controller: _textusernameController,
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
                        //setState(() {
                        usernameLocal = _textusernameController.value.text;
                        //});
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
                            autofocus: true,
                            //initialValue: nameLocal,
                            controller: _textnameController,
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
                              //setState(() {
                              nameLocal = _textnameController.value.text;
                              //});
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
                            autofocus: true,
                            //initialValue: middleNameLocal,
                            controller: _textmiddleNameController,
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
                              //setState(() {
                              middleNameLocal =
                                  _textmiddleNameController.value.text;
                              //});
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
                            autofocus: true,
                            //initialValue: lastNameLocal,
                            controller: _textlastNameController,
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
                              //setState(() {
                              lastNameLocal = _textnameController.value.text;
                              //});
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
                            autofocus: true,
                            //initialValue: accountIDLocal,
                            controller: _textaccountIDController,
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
                              //setState(() {
                              accountIDLocal =
                                  _textaccountIDController.value.text;
                              //});
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
                            _textBirthdateController.text = formate1;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      controller: _textBirthdateController,
                      //initialValue: birthdateLocal,
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
                            autofocus: true,
                            //initialValue: schoolYearLocal,
                            controller: _textschoolYearController,
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
                              //setState(() {
                              schoolYearLocal =
                                  _textschoolYearController.value.text;
                              //});
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
                            autofocus: true,
                            //initialValue: schoolSectionLocal,
                            controller: _textschoolSectionController,
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
                              //setState(() {
                              schoolSectionLocal =
                                  _textschoolSectionController.value.text;
                              //});
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
                      autofocus: true,
                      //initialValue: passwordLocal,
                      controller: _textpasswordController,
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
                              //setState(() {
                              _isObscure = !_isObscure;
                              //});
                            }),
                      ),
                      onChanged: (value) {
                        setState(() {
                          passwordLocal = _textpasswordController.value.text;
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
                          elevation: MaterialStateProperty.all(0),
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
                          birthdateLocal = _textBirthdateController.value.text;
                          print("Birthday: $birthdateLocal");
                          saveStudent(studentIndexLocal!);
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
                          elevation: MaterialStateProperty.all(0),
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

  void saveStudent(int studInd) {
    print("Student Index: " + studInd.toString());
    int index = studInd;
    Box<Student> studentBox = Hive.box<Student>(HiveBoxesStudent.student);
    studentBox.putAt(
        index,
        Student(
          userName: usernameLocal ?? "",
          name: nameLocal ?? "",
          middleName: middleNameLocal ?? "",
          lastName: lastNameLocal ?? "",
          accountID: accountIDLocal ?? "",
          schoolSection: schoolSectionLocal ?? "",
          schoolYear: schoolYearLocal ?? "",
          birthdate: birthdateLocal ?? "",
          department: departmentLocal ?? "",
          password: passwordLocal ?? "",
        ));
    print("User Profile has been saved!");
  }
}
