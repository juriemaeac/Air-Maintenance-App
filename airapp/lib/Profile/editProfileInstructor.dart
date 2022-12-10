import 'package:airapp/constants.dart';
import 'package:airapp/landingPage.dart';
import 'package:airapp/navBar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:airapp/authentication/login.dart';
import '../boxes/boxInstructor.dart';
import '../database/instructor_model.dart';

class EditProfileInstructor extends StatefulWidget {
  Instructor? instructorAccount;
  int? instructorIndex;
  EditProfileInstructor(
      {super.key,
      required this.instructorAccount,
      required this.instructorIndex});

  @override
  State<EditProfileInstructor> createState() => _EditProfileInstructorState();
}

class _EditProfileInstructorState extends State<EditProfileInstructor> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = false;

  String? usernameLocal;
  String? nameLocal;
  String? middleNameLocal;
  String? lastNameLocal;
  String? accountIDLocal;
  String? departmentLocal;
  String? passwordLocal;
  int? instructorIndexLocal;
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
  TextEditingController _textdepartmentController = TextEditingController()
    ..text = "";
  TextEditingController _textpasswordController = TextEditingController()
    ..text = "";

  @override
  void initState() {
    super.initState();
    Hive.openBox<Instructor>(HiveBoxesInstructor.instructor);
    usernameLocal = widget.instructorAccount?.userName;
    nameLocal = widget.instructorAccount?.name;
    middleNameLocal = widget.instructorAccount?.middleName;
    lastNameLocal = widget.instructorAccount?.lastName;
    accountIDLocal = widget.instructorAccount?.accountID;
    departmentLocal = widget.instructorAccount?.department;
    passwordLocal = widget.instructorAccount?.password;
    instructorIndexLocal = widget.instructorIndex;
    _textusernameController.text = usernameLocal ?? "";
    _textnameController.text = nameLocal ?? "";
    _textmiddleNameController.text = middleNameLocal ?? "";
    _textlastNameController.text = lastNameLocal ?? "";
    _textaccountIDController.text = accountIDLocal ?? "";
    _textdepartmentController.text = departmentLocal ?? "";
    _textpasswordController.text = passwordLocal ?? "";
  }

  @override
  Widget build(BuildContext context) {
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
                            Text('Account No.', style: AppTextStyles.subtitle2),
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
                          saveInstructor(instructorIndexLocal!);
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

  void saveInstructor(int insInd) {
    print("Instructot Index: " + insInd.toString());
    int index = insInd;
    Box<Instructor> instructorBox =
        Hive.box<Instructor>(HiveBoxesInstructor.instructor);
    instructorBox.putAt(
        index,
        Instructor(
          userName: usernameLocal ?? "",
          name: nameLocal ?? "",
          middleName: middleNameLocal ?? "",
          lastName: lastNameLocal ?? "",
          accountID: accountIDLocal ?? "",
          department: departmentLocal ?? "",
          password: passwordLocal ?? "",
        ));
    print("User Profile has been saved!");
  }
}
