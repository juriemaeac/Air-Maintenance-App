import 'dart:ffi';

import 'package:airapp/constants.dart';
import 'package:airapp/login/login.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool _isObscure = false;
  bool _isObscure1 = false;

  DateTime _date = DateTime.now();

  String? username;
  String? firstName;
  String? middleName;
  String? lastName;
  String? studentNo;
  //String? textBirthdate;
  String? department;
  String? password;
  String? confirmPassword;

  TextEditingController usernameText = TextEditingController();
  TextEditingController firstNameText = TextEditingController();
  TextEditingController middleNameText = TextEditingController();
  TextEditingController lastNameText = TextEditingController();
  TextEditingController studentNoText = TextEditingController();
  TextEditingController departmentText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController confirmPasswordText = TextEditingController();
  //TextEditingController textBirthdateController = TextEditingController();

  // _handleDatePicker() async {
  //   final DateTime? date = await showDatePicker(
  //     context: context,
  //     initialDate: _date,
  //     lastDate: DateTime.now(),
  //     firstDate: DateTime(1900),
  //   );
  //   if (date != null && date != _date) {
  //     setState(() {
  //       textBirthdate = DateFormat('yMMMMd').format(date);
  //     });
  //     textBirthdateController.text = textBirthdate!;
  //   }
  // }

  List<String> departmentOptions = [
    "AET",
    "AMT",
    "AERO-ENG",
    "AIR TRANSPORTATION",
  ];

  @override
  void initState() {
    // TODO: implement initState
    //textBirthdateController.text = textBirthdate!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Image(
                        image: AssetImage('assets/images/airapp_logo.png'))),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Create new account',
                style: AppTextStyles.headings,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Please fill in the form below to create an account',
                style: AppTextStyles.subHeadings,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  color: AppColors.greyAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  autofocus: true,
                  controller: usernameText,
                  style: AppTextStyles.textFields,
                  decoration: const InputDecoration(
                    labelText: 'Enter Username',
                    labelStyle: AppTextStyles.subHeadings,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      username = value;
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
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                        color: AppColors.greyAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        autofocus: true,
                        controller: firstNameText,
                        style: AppTextStyles.textFields,
                        decoration: const InputDecoration(
                          labelText: 'Enter First Name',
                          labelStyle: AppTextStyles.subHeadings,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 2),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            firstName = value;
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
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                        color: AppColors.greyAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        autofocus: true,
                        controller: middleNameText,
                        style: AppTextStyles.textFields,
                        decoration: const InputDecoration(
                          labelText: 'Enter Middle Name',
                          labelStyle: AppTextStyles.subHeadings,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 2),
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
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  color: AppColors.greyAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  autofocus: true,
                  controller: lastNameText,
                  style: AppTextStyles.textFields,
                  decoration: const InputDecoration(
                    labelText: 'Enter Last Name',
                    labelStyle: AppTextStyles.subHeadings,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
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
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                        color: AppColors.greyAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        readOnly: true,
                        //controller: textBirthdateController,
                        style: AppTextStyles.textFields,
                        //onTap: _handleDatePicker,
                        decoration: InputDecoration(
                          labelText: 'Enter Birthdate',
                          labelStyle: AppTextStyles.subHeadings,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 2),
                          ),
                        ),
                        // validator: (var value) {
                        //   if (value!.isEmpty) {
                        //     return 'Enter Birthdate';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                        color: AppColors.greyAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        autofocus: true,
                        controller: studentNoText,
                        style: AppTextStyles.textFields,
                        decoration: const InputDecoration(
                          labelText: 'Enter Student No.',
                          labelStyle: AppTextStyles.subHeadings,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 2),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            studentNo = value;
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
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  color: AppColors.greyAccent,
                  borderRadius: BorderRadius.circular(10),
                  //border: Border.all(color: AppColors.greyAccent),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'Select Department',
                      style: AppTextStyles.subHeadings,
                    ),
                    items: departmentOptions
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: AppTextStyles.textFields,
                              ),
                            ))
                        .toList(),
                    value: department,
                    onChanged: (value) {
                      setState(() {
                        department = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.only(left: 25, right: 13),
                decoration: BoxDecoration(
                  color: AppColors.greyAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  autofocus: true,
                  controller: passwordText,
                  obscureText: !_isObscure,
                  style: AppTextStyles.textFields,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    labelStyle: AppTextStyles.subHeadings,
                    border: InputBorder.none,
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                    ),
                    suffixIcon: IconButton(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
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
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.only(left: 25, right: 13),
                decoration: BoxDecoration(
                  color: AppColors.greyAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  autofocus: true,
                  controller: confirmPasswordText,
                  obscureText: !_isObscure1,
                  style: AppTextStyles.textFields,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: AppTextStyles.subHeadings,
                    border: InputBorder.none,
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                    ),
                    suffixIcon: IconButton(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        icon: Icon(
                            _isObscure1
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20),
                        onPressed: () {
                          setState(() {
                            _isObscure1 = !_isObscure1;
                          });
                        }),
                  ),
                  onChanged: (value) {
                    setState(() {
                      confirmPassword = value;
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
              CheckboxListTile(
                title: Row(
                  children: [
                    Text(
                      "I agree to the ",
                      style: AppTextStyles.subHeadings,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => TermsAndConditions(),
                        //   ),
                        // );
                      },
                      child: Text(
                        "Terms and Conditions",
                        style: AppTextStyles.subHeadings.copyWith(
                          color: AppColors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue!;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (checkedValue == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Please agree to the terms and conditions',
                          ),
                        ),
                      );
                    } else {}
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 40)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.blueAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    shadowColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  child: Text('Register',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?   ',
                      style: AppTextStyles.subHeadings),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Log in',
                      style: AppTextStyles.subHeadings.copyWith(
                        color: AppColors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
