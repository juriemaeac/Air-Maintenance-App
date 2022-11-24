import 'dart:ffi';

import 'package:airapp/Home/navBar.dart';
import 'package:airapp/authentication/signup.dart';
import 'package:airapp/boxes/boxInstructor.dart';
import 'package:airapp/constants.dart';
import 'package:airapp/authentication/login.dart';
import 'package:airapp/database/t.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../database/instructor_model.dart';

class SignupInstructor extends StatefulWidget {
  const SignupInstructor({super.key});

  @override
  State<SignupInstructor> createState() => _SignupInstructorState();
}

class _SignupInstructorState extends State<SignupInstructor> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool _isObscure = false;
  bool _isObscure1 = false;

  DateTime _date = DateTime.now();

  String? username;
  String? firstName;
  String? middleName;
  String? lastName;
  String? accountID;
  String? department;
  String? password;
  String? confirmPassword;

  validateCredentials() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      displayDetailsIndialog();
      // saveUser();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginPage()),
      // );
    } else {
      return;
    }
  }

  List<String> departmentOptions = [
    "AET",
    "AMT",
    "AERO-ENG",
    "AIR TRANSPORTATION",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: _formKey,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.yellowAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.airplanemode_active_rounded,
                      size: 50,
                      color: AppColors.blueAccent,
                    ),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width / 2,
                  //   height: MediaQuery.of(context).size.height * 0.08,
                  //   child: Image(
                  //     image: AssetImage('assets/images/airapp_logo.png'),
                  //   ),
                  // ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Create new account',
                  style: AppTextStyles.headings1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register as student? ',
                      style: AppTextStyles.subHeadings.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        'Click here!',
                        style: AppTextStyles.subHeadings.copyWith(
                          color: AppColors.blueAccent,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.greyAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    //controller: usernameText,
                    style: AppTextStyles.textFields,
                    decoration: const InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 25, right: 13),
                      labelText: 'Enter Username',
                      labelStyle: AppTextStyles.subHeadings,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide:
                            BorderSide(color: AppColors.blueAccent, width: 2),
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
                        decoration: BoxDecoration(
                          color: AppColors.greyAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          //controller: firstNameText,
                          style: AppTextStyles.textFields,
                          decoration: const InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 25, right: 13),
                            labelText: 'Enter First Name',
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
                        decoration: BoxDecoration(
                          color: AppColors.greyAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          //controller: middleNameText,
                          style: AppTextStyles.textFields,
                          decoration: const InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 25, right: 13),
                            labelText: 'Enter Middle Name',
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
                          style: AppTextStyles.textFields,
                          decoration: const InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 25, right: 13),
                            labelText: 'Enter Last Name',
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
                          style: AppTextStyles.textFields,
                          decoration: const InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 25, right: 13),
                            labelText: 'Enter Account No.',
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
                  decoration: BoxDecoration(
                    color: AppColors.greyAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    //controller: passwordText,
                    obscureText: !_isObscure,
                    style: AppTextStyles.textFields,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 25, right: 25),
                      labelText: 'Enter Password',
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
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.greyAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    //controller: confirmPasswordText,
                    obscureText: !_isObscure1,
                    style: AppTextStyles.textFields,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 25, right: 25),
                      labelText: 'Confirm Password',
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
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                contentPadding: EdgeInsets.all(30.0),
                                //title:
                                content: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Terms and Conditions',
                                          style: AppTextStyles.title,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Disclaimer',
                                          style: AppTextStyles.subtitle1,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'This Application is not an accurate replica of any aviation company checklist and is not an absolute design of the checklist that can be seen and done in an actual devised touch control technology checklist. This application only serves as a simulation of the possible digital checklist for the Philippine State College of Aeronautics Community. The application is based on ATA (Air Transportation Association) and AMM (Aircraft Maintenance Manual).',
                                          style: AppTextStyles.subHeadings,
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Privacy, Terms, and Conditions',
                                          style: AppTextStyles.subtitle1,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'To ensure the safe and transparent usage of your personal information, we require that you read and understand the provisions stated in this notice. This is in compliance with Republic Act No. 10173, otherwise known as the Data Privacy Act of 2012, whose implementing rules and regulations took effect on September 9th, 2016. We are providing you with this notice to inform you and secure your consent.\n\nIn compliance with the Data Privacy Act 10173 (DPA) of 2012, and its Implementing Rules and Regulations (IRR) effective since September 9th, 2016, I allow the PhilSCA - Villamor Campus, 4th Year BSAET, hereinafter referred to as PhilSCA - Villamor Campus, 4th Year BSAET, to store and use my data for the purpose and execution of the human interface maintenance task card, as well as all pertaining activities to the aforementioned activity.\n\nProceeding to the next page means that, I, a user of the application, understand and agree to the terms and conditions given by the application. Also, I, a user of the application, agreed that any of the information I gave and stored through this application can be used by the researchers for they have assured that my data will be kept safe. Even so, I am also fully aware that anyoccur;of malicious data trespasses and unauthorized access can occur, hence, I will not put the sole responsibility to the researchers.\n\nProceeding to the next page certifies that I, a user of this application, certainly know my responsibilities as a Filipino Citizen, and will therefore act responsibly during the usage of this application and its span. I know that acting with discordance within the Philippine Republic Act No. 10173, or the Data Privacy Act of 2012 has an affiliated punishment for those who will not abide by it.',
                                          style: AppTextStyles.subHeadings,
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 1. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text: 'Short Title. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                  text:
                                                      'This Act shall be known as the “Data Privacy Act of 2012”.',
                                                  style: AppTextStyles
                                                      .subHeadings),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 2. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Declaration of Policy. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                  text:
                                                      'It is the policy of the State to protect the fundamental human right of privacy, of communication while ensuring free flow of information to promote innovation and growth. The State recognizes the vital role of information and communications technology in nation-building and its inherent obligation to ensure that personal information in information and communications systems in the government and in the private sector are secured and protected.',
                                                  style: AppTextStyles
                                                      .subHeadings),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 3. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Definition of Terms. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                  text:
                                                      'Whenever used in this Act, the following terms shall have the respective meanings hereafter set forth:',
                                                  style: AppTextStyles
                                                      .subHeadings),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Column(
                                            children: [
                                              Text.rich(
                                                TextSpan(
                                                  text: '(a) ',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                        text: 'Commission ',
                                                        style: AppTextStyles
                                                            .subHeadings
                                                            .copyWith(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic)),
                                                    TextSpan(
                                                        text:
                                                            'shall refer to the National Privacy Commission created by virtue of this Act.',
                                                        style: AppTextStyles
                                                            .subHeadings),
                                                  ],
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '(b) ',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                        text:
                                                            'Consent of the data subject ',
                                                        style: AppTextStyles
                                                            .subHeadings
                                                            .copyWith(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic)),
                                                    TextSpan(
                                                        text:
                                                            'refers to any freely given, specific, informed indication of will, whereby the data subject agrees to the collection and processing of personal information about and/or relating to him or her. Consent shall be evidenced by written, electronic or recorded means. It may also be given on behalf of the data subject by an agent specifically authorized by the data subject to do so.',
                                                        style: AppTextStyles
                                                            .subHeadings),
                                                  ],
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '(c) ',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                        text: 'Data subject ',
                                                        style: AppTextStyles
                                                            .subHeadings
                                                            .copyWith(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic)),
                                                    TextSpan(
                                                        text:
                                                            'refers to an individual whose personal information is processed.',
                                                        style: AppTextStyles
                                                            .subHeadings),
                                                  ],
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '(d) ',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                        text:
                                                            'Direct marketing ',
                                                        style: AppTextStyles
                                                            .subHeadings
                                                            .copyWith(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic)),
                                                    TextSpan(
                                                        text:
                                                            'refers to communication by whatever means of any advertising or marketing material which is directed to particular individuals.',
                                                        style: AppTextStyles
                                                            .subHeadings),
                                                  ],
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '(e) ',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                        text: 'Filing system ',
                                                        style: AppTextStyles
                                                            .subHeadings
                                                            .copyWith(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic)),
                                                    TextSpan(
                                                        text:
                                                            'refers to any act of information relating to natural or juridical persons to the extent that, although the information is not processed by equipment operating automatically in response to instructions given for that purpose, the set is structured, either by reference to individuals or by reference to criteria relating to individuals, in such a way that specific information relating to a particular person is readily accessible.',
                                                        style: AppTextStyles
                                                            .subHeadings),
                                                  ],
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '(f) ',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                        text:
                                                            'Information and Communications System ',
                                                        style: AppTextStyles
                                                            .subHeadings
                                                            .copyWith(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic)),
                                                    TextSpan(
                                                        text:
                                                            'refers to a system for generating, sending, receiving, storing or otherwise processing electronic data messages or electronic documents and includes the computer system or other similar device by or which data is recorded, transmitted or stored and any procedure related to the recording, transmission or storage of electronic data, electronic message, or electronic document.',
                                                        style: AppTextStyles
                                                            .subHeadings),
                                                  ],
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '(g) ',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                        text:
                                                            'Personal information ',
                                                        style: AppTextStyles
                                                            .subHeadings
                                                            .copyWith(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic)),
                                                    TextSpan(
                                                        text:
                                                            'refers to any information whether recorded in a material form or not, from which the identity of an individual is apparent or can be reasonably and directly ascertained by the entity holding the information, or when put together with other information would directly and certainly identify an individual.',
                                                        style: AppTextStyles
                                                            .subHeadings),
                                                  ],
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '(h) ',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                        text:
                                                            'Personal information controller ',
                                                        style: AppTextStyles
                                                            .subHeadings
                                                            .copyWith(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic)),
                                                    TextSpan(
                                                        text:
                                                            'refers to a person or organization who controls the collection, holding, processing or use of personal information, including a person or organization who instructs another person or organization to collect, hold, process, use, transfer or disclose personal information on his or her behalf. The term excludes:',
                                                        style: AppTextStyles
                                                            .subHeadings),
                                                  ],
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 15),
                                                child: Text(
                                                  '(1) A person or organization who performs such functions as instructed by another person or organization; and\n\n(2) An individual who collects, holds, processes or uses personal information in connection with the individual’s personal, family or household affairs.',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '(i) ',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                        text:
                                                            'Personal information processor ',
                                                        style: AppTextStyles
                                                            .subHeadings
                                                            .copyWith(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic)),
                                                    TextSpan(
                                                        text:
                                                            'refers to any natural or juridical person qualified to act as such under this Act to whom a personal information controller may outsource the processing of personal data pertaining to a data subject.',
                                                        style: AppTextStyles
                                                            .subHeadings),
                                                  ],
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '(j) ',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                        text: 'Processing ',
                                                        style: AppTextStyles
                                                            .subHeadings
                                                            .copyWith(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic)),
                                                    TextSpan(
                                                        text:
                                                            'refers to any operation or any set of operations performed upon personal information including, but not limited to, the collection, recording, organization, storage, updating or modification, retrieval, consultation, use, consolidation, blocking, erasure or destruction of data.',
                                                        style: AppTextStyles
                                                            .subHeadings),
                                                  ],
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '(k) ',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                        text:
                                                            'Privileged information ',
                                                        style: AppTextStyles
                                                            .subHeadings
                                                            .copyWith(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic)),
                                                    TextSpan(
                                                        text:
                                                            'refers to any and all forms of data which under the Rules of Court and other pertinent laws constitute privileged communication.',
                                                        style: AppTextStyles
                                                            .subHeadings),
                                                  ],
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: '(l) ',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                        text:
                                                            'Sensitive personal information ',
                                                        style: AppTextStyles
                                                            .subHeadings
                                                            .copyWith(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic)),
                                                    TextSpan(
                                                        text:
                                                            'refers to personal information:',
                                                        style: AppTextStyles
                                                            .subHeadings),
                                                  ],
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 15),
                                                child: Text(
                                                  '(1) About an individual’s race, ethnic origin, marital status, age, color, and religious, philosophical or political affiliations;\n\n(2) About an individual’s health, education, genetic or sexual life of a person, or to any proceeding for any offense committed or alleged to have been committed by such person, the disposal of such proceedings, or the sentence of any court in such proceedings;\n\n(3) Issued by government agencies peculiar to an individual which includes, but not limited to, social security numbers, previous or current health records, licenses or its denials, suspension or revocation, and tax returns; and\n\n(4) Specifically established by an executive order or an act of Congress to be kept classified.',
                                                  style:
                                                      AppTextStyles.subHeadings,
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 4. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text: 'Scope. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'This Act applies to the processing of all types of personal information and to any natural and juridical person involved in personal information processing including those personal information controllers and processors who, although not found or established in the Philippines, use equipment that are located in the Philippines, or those who maintain an office, branch or agency in the Philippines subject to the immediately succeeding paragraph: Provided, That the requirements of Section 5 are complied with.\n\nThis Act does not apply to the following:',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(a) Information about any individual who is or was an officer or employee of a government institution that relates to the position or functions of the individual, including:',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(
                                            '(1) The fact that the individual is or was an officer or employee of the government institution;\n\n(2) The title, business address and office telephone number of the individual;\n\n(3) The classification, salary range and responsibilities of the position held by the individual; and\n\n(4) The name of the individual on a document prepared by the individual in the course of employment with the government;',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(b) Information about an individual who is or was performing service under contract for a government institution that relates to the services performed, including the terms of the contract, and the name of the individual given in the course of the performance of those services;\n\n(c) Information relating to any discretionary benefit of a financial nature such as the granting of a license or permit given by the government to an individual, including the name of the individual and the exact nature of the benefit;\n\n(d) Personal information processed for journalistic, artistic, literary or research purposes;\n\n(e) Information necessary in order to carry out the functions of public authority which includes the processing of personal data for the performance by the independent, central monetary authority and law enforcement and regulatory agencies of their constitutionally and statutorily mandated functions. Nothing in this Act shall be construed as to have amended or repealed Republic Act No. 1405, otherwise known as the Secrecy of Bank Deposits Act; Republic Act No. 6426, otherwise known as the Foreign Currency Deposit Act; and Republic Act No. 9510, otherwise known as the Credit Information System Act (CISA);\n\n(f) Information necessary for banks and other financial institutions under the jurisdiction of the independent, central monetary authority or Bangko Sentral ng Pilipinas to comply with Republic Act No. 9510, and Republic Act No. 9160, as amended, otherwise known as the Anti-Money Laundering Act and other applicable laws; and\n\n(g) Personal information originally collected from residents of foreign jurisdictions in accordance with the laws of those foreign jurisdictions, including any applicable data privacy laws, which is being processed in the Philippines.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 5. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Protection Afforded to Journalists and Their Sources. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'Nothing in this Act shall be construed as to have amended or repealed the provisions of Republic Act No. 53, which affords the publishers, editors or duly accredited reporters of any newspaper, magazine or periodical of general circulation protection from being compelled to reveal the source of any news report or information appearing in said publication which was related in any confidence to such publisher, editor, or reporter.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 6. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Extraterritorial Application. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'This Act applies to an act done or practice engaged in and outside of the Philippines by an entity if:',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(a) The act, practice or processing relates to personal information about a Philippine citizen or a resident;\n\n(b) The entity has a link with the Philippines, and the entity is processing personal information in the Philippines or even if the processing is outside the Philippines as long as it is about Philippine citizens or residents such as, but not limited to, the following:',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(
                                            '(1) A contract is entered in the Philippines;\n\n(2) A juridical entity unincorporated in the Philippines but has central management and control in the country; and\n\n(3) An entity that has a branch, agency, office or subsidiary in the Philippines and the parent or affiliate of the Philippine entity has access to personal information; and',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(c) The entity has other links in the Philippines such as, but not limited to:',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(
                                            '(1) The entity carries on business in the Philippines; and\n\n(2) The personal information was collected or held by an entity in the Philippines.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'CHAPTER II\nTHE NATIONAL PRIVACY COMMISSION',
                                          style: AppTextStyles.subtitle1,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 7. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Functions of the National Privacy Commission. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'To administer and implement the provisions of this Act, and to monitor and ensure compliance of the country with international standards set for data protection, there is hereby created an independent body to be known as the National Privacy Commission, winch shall have the following functions:',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(a) Ensure compliance of personal information controllers with the provisions of this Act;\n\n(b) Receive complaints, institute investigations, facilitate or enable settlement of complaints through the use of alternative dispute resolution processes, adjudicate, award indemnity on matters affecting any personal information, prepare reports on disposition of complaints and resolution of any investigation it initiates, and, in cases it deems appropriate, publicize any such report: Provided, That in resolving any complaint or investigation (except where amicable settlement is reached by the parties), the Commission shall act as a collegial body. For this purpose, the Commission may be given access to personal information that is subject of any complaint and to collect the information necessary to perform its functions under this Act;\n\n(c) Issue cease and desist orders, impose a temporary or permanent ban on the processing of personal information, upon finding that the processing will be detrimental to national security and public interest;\n\n(d) Compel or petition any entity, government agency or instrumentality to abide by its orders or take action on a matter affecting data privacy;\n\n(e) Monitor the compliance of other government agencies or instrumentalities on their security and technical measures and recommend the necessary action in order to meet minimum standards for protection of personal information pursuant to this Act;\n\n(f) Coordinate with other government agencies and the private sector on efforts to formulate and implement plans and policies to strengthen the protection of personal information in the country;\n\n(g) Publish on a regular basis a guide to all laws relating to data protection;\n\n(h) Publish a compilation of agency system of records and notices, including index and other finding aids;\n\n(i) Recommend to the Department of Justice (DOJ) the prosecution and imposition of penalties specified in Sections 25 to 29 of this Act;\n\n(j) Review, approve, reject or require modification of privacy codes voluntarily adhered to by personal information controllers:Provided, That the privacy codes shall adhere to the underlying data privacy principles embodied in this Act: Provided, further,That such privacy codes may include private dispute resolution mechanisms for complaints against any participating personal information controller. For this purpose, the Commission shall consult with relevant regulatory agencies in the formulation and administration of privacy codes applying the standards set out in this Act, with respect to the persons, entities, business activities and business sectors that said regulatory bodies are authorized to principally regulate pursuant to the law: Provided, finally. That the Commission may review such privacy codes and require changes thereto for purposes of complying with this Act;\n\n(k) Provide assistance on matters relating to privacy or data protection at the request of a national or local agency, a private entity or any person;\n\n(l) Comment on the implication on data privacy of proposed national or local statutes, regulations or procedures, issue advisory opinions and interpret the provisions of this Act and other data privacy laws;\n\n(m) Propose legislation, amendments or modifications to Philippine laws on privacy or data protection as may be necessary;\n\n(n) Ensure proper and effective coordination with data privacy regulators in other countries and private accountability agents, participate in international and regional initiatives for data privacy protection;\n\n(o) Negotiate and contract with other data privacy authorities of other countries for cross-border application and implementation of respective privacy laws;\n\n(p) Assist Philippine companies doing business abroad to respond to foreign privacy or data protection laws and regulations; and\n\n(q) Generally perform such acts as may be necessary to facilitate cross-border enforcement of data privacy protection.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 8. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text: 'Confidentiality. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'The Commission shall ensure at all times the confidentiality of any personal information that comes to its knowledge and possession.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 9. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Organizational Structure of the Commission. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'The Commission shall be attached to the Department of Information and Communications Technology (DICT) and shall be headed by a Privacy Commissioner, who shall also act as Chairman of the Commission. The Privacy Commissioner shall be assisted by two (2) Deputy Privacy Commissioners, one to be responsible for Data Processing Systems and one to be responsible for Policies and Planning. The Privacy Commissioner and the two (2) Deputy Privacy Commissioners shall be appointed by the President of the Philippines for a term of three (3) years, and may be reappointed for another term of three (3) years. Vacancies in the Commission shall be filled in the same manner in which the original appointment was made.\n\nThe Privacy Commissioner must be at least thirty-five (35) years of age and of good moral character, unquestionable integrity and known probity, and a recognized expert in the field of information technology and data privacy. The Privacy Commissioner shall enjoy the benefits, privileges and emoluments equivalent to the rank of Secretary.\n\nThe Deputy Privacy Commissioners must be recognized experts in the field of information and communications technology and data privacy. They shall enjoy the benefits, privileges and emoluments equivalent to the rank of Undersecretary.\n\nThe Privacy Commissioner, the Deputy Commissioners, or any person acting on their behalf or under their direction, shall not be civilly liable for acts done in good faith in the performance of their duties. However, he or she shall be liable for willful or negligent acts done by him or her which are contrary to law, morals, public policy and good customs even if he or she acted under orders or instructions of superiors: Provided, That in case a lawsuit is filed against such official on the subject of the performance of his or her duties, where such performance is lawful, he or she shall be reimbursed by the Commission for reasonable costs of litigation.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 10. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text: 'The Secretariat. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'The Commission is hereby authorized to establish a Secretariat. Majority of the members of the Secretariat must have served for at least five (5) years in any agency of the government that is involved in the processing of personal information including, but not limited to, the following offices: Social Security System (SSS), Government Service Insurance System (GSIS), Land Transportation Office (LTO), Bureau of Internal Revenue (BIR), Philippine Health Insurance Corporation (PhilHealth), Commission on Elections (COMELEC), Department of Foreign Affairs (DFA), Department of Justice (DOJ), and Philippine Postal Corporation (Philpost).',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'CHAPTER III\nPROCESSING OF PERSONAL INFORMATION',
                                          style: AppTextStyles.subtitle1,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 11. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'General Data Privacy Principles. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'The processing of personal information shall be allowed, subject to compliance with the requirements of this Act and other laws allowing disclosure of information to the public and adherence to the principles of transparency, legitimate purpose and proportionality.\n\nPersonal information must, be:,',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(a) Collected for specified and legitimate purposes determined and declared before, or as soon as reasonably practicable after collection, and later processed in a way compatible with such declared, specified and legitimate purposes only;\n\n(b) Processed fairly and lawfully;\n\n(c) Accurate, relevant and, where necessary for purposes for which it is to be used the processing of personal information, kept up to date; inaccurate or incomplete data must be rectified, supplemented, destroyed or their further processing restricted;\n\n(d) Adequate and not excessive in relation to the purposes for which they are collected and processed;\n\n(e) Retained only for as long as necessary for the fulfillment of the purposes for which the data was obtained or for the establishment, exercise or defense of legal claims, or for legitimate business purposes, or as provided by law; and\n\n(f) Kept in a form which permits identification of data subjects for no longer than is necessary for the purposes for which the data were collected and processed: Provided, That personal information collected for other purposes may lie processed for historical, statistical or scientific purposes, and in cases laid down in law may be stored for longer periods: Provided, further,That adequate safeguards are guaranteed by said laws authorizing their processing.\n\nThe personal information controller must ensure implementation of personal information processing principles set out herein.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 12. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Criteria for Lawful Processing of Personal Information. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'The processing of personal information shall be permitted only if not otherwise prohibited by law, and when at least one of the following conditions exists:',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(a) The data subject has given his or her consent;\n\n(b) The processing of personal information is necessary and is related to the fulfillment of a contract with the data subject or in order to take steps at the request of the data subject prior to entering into a contract;\n\n(c) The processing is necessary for compliance with a legal obligation to which the personal information controller is subject;\n\n(d) The processing is necessary to protect vitally important interests of the data subject, including life and health;\n\n(e) The processing is necessary in order to respond to national emergency, to comply with the requirements of public order and safety, or to fulfill functions of public authority which necessarily includes the processing of personal data for the fulfillment of its mandate; or\n\n(f) The processing is necessary for the purposes of the legitimate interests pursued by the personal information controller or by a third party or parties to whom the data is disclosed, except where such interests are overridden by fundamental rights and freedoms of the data subject which require protection under the Philippine Constitution.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 13. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Sensitive Personal Information and Privileged Information. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'The processing of sensitive personal information and privileged information shall be prohibited, except in the following cases:',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(a) The data subject has given his or her consent, specific to the purpose prior to the processing, or in the case of privileged information, all parties to the exchange have given their consent prior to processing;\n\n(b) The processing of the same is provided for by existing laws and regulations: Provided, That such regulatory enactments guarantee the protection of the sensitive personal information and the privileged information: Provided, further, That the consent of the data subjects are not required by law or regulation permitting the processing of the sensitive personal information or the privileged information;\n\n(c) The processing is necessary to protect the life and health of the data subject or another person, and the data subject is not legally or physically able to express his or her consent prior to the processing;\n\n(d) The processing is necessary to achieve the lawful and noncommercial objectives of public organizations and their associations: Provided, That such processing is only confined and related to the bona fide members of these organizations or their associations: Provided, further, That the sensitive personal information are not transferred to third parties: Provided, finally, That consent of the data subject was obtained prior to processing;\n\n(e) The processing is necessary for purposes of medical treatment, is carried out by a medical practitioner or a medical treatment institution, and an adequate level of protection of personal information is ensured; or\n\n(f) The processing concerns such personal information as is necessary for the protection of lawful rights and interests of natural or legal persons in court proceedings, or the establishment, exercise or defense of legal claims, or when provided to government or public authority.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 14. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Subcontract of Personal Information. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'A personal information controller may subcontract the processing of personal information: Provided, That the personal information controller shall be responsible for ensuring that proper safeguards are in place to ensure the confidentiality of the personal information processed, prevent its use for unauthorized purposes, and generally, comply with the requirements of this Act and other laws for processing of personal information. The personal information processor shall comply with all the requirements of this Act and other applicable laws.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 15. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Sensitive Personal Information and Privileged InformationExtension of Privileged Communication. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'Personal information controllers may invoke the principle of privileged communication over privileged information that they lawfully control or process. Subject to existing laws and regulations, any evidence gathered on privileged information is inadmissible.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'CHAPTER IV\nRIGHTS OF THE DATA SUBJECT',
                                          style: AppTextStyles.subtitle1,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 16. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Rights of the Data Subject. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'The data subject is entitled to:',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(a) Be informed whether personal information pertaining to him or her shall be, are being or have been processed;\n\n(b) Be furnished the information indicated hereunder before the entry of his or her personal information into the processing system of the personal information controller, or at the next practical opportunity:',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(
                                            '(1) Description of the personal information to be entered into the system;\n\n(2) Purposes for which they are being or are to be processed;\n\n(3) Scope and method of the personal information processing;\n\n(4) The recipients or classes of recipients to whom they are or may be disclosed;\n\n(5) Methods utilized for automated access, if the same is allowed by the data subject, and the extent to which such access is authorized;\n\n(6) The identity and contact details of the personal information controller or its representative;\n\n(7) The period for which the information will be stored; and\n\n(8) The existence of their rights, i.e., to access, correction, as well as the right to lodge a complaint before the Commission.\n\nAny information supplied or declaration made to the data subject on these matters shall not be amended without prior notification of data subject: Provided, That the notification under subsection (b) shall not apply should the personal information be needed pursuant to a subpoena or when the collection and processing are for obvious purposes, including when it is necessary for the performance of or in relation to a contract or service or when necessary or desirable in the context of an employer-employee relationship, between the collector and the data subject, or when the information is being collected and processed as a result of legal obligation;',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(c) Reasonable access to, upon demand, the following:',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(
                                            '(1) Contents of his or her personal information that were processed;\n\n(2) Sources from which personal information were obtained;\n\n(3) Names and addresses of recipients of the personal information;\n\n(4) Manner by which such data were processed;\n\n(5) Reasons for the disclosure of the personal information to recipients;\n\n(6) Information on automated processes where the data will or likely to be made as the sole basis for any decision significantly affecting or will affect the data subject;\n\n(7) Date when his or her personal information concerning the data subject were last accessed and modified; and\n\n(8) The designation, or name or identity and address of the personal information controller;',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(d) Dispute the inaccuracy or error in the personal information and have the personal information controller correct it immediately and accordingly, unless the request is vexatious or otherwise unreasonable. If the personal information have been corrected, the personal information controller shall ensure the accessibility of both the new and the retracted information and the simultaneous receipt of the new and the retracted information by recipients thereof: Provided, That the third parties who have previously received such processed personal information shall he informed of its inaccuracy and its rectification upon reasonable request of the data subject;\n\n(e) Suspend, withdraw or order the blocking, removal or destruction of his or her personal information from the personal information controller’s filing system upon discovery and substantial proof that the personal information are incomplete, outdated, false, unlawfully obtained, used for unauthorized purposes or are no longer necessary for the purposes for which they were collected. In this case, the personal information controller may notify third parties who have previously received such processed personal information; and\n\n(f) Be indemnified for any damages sustained due to such inaccurate, incomplete, outdated, false, unlawfully obtained or unauthorized use of personal information.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 17. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Transmissibility of Rights of the Data Subject. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'The lawful heirs and assigns of the data subject may invoke the rights of the data subject for, which he or she is an heir or assignee at any time after the death of the data subject or when the data subject is incapacitated or incapable of exercising the rights as enumerated in the immediately preceding section.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 18. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Right to Data Portability. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'The data subject shall have the right, where personal information is processed by electronic means and in a structured and commonly used format, to obtain from the personal information controller a copy of data undergoing processing in an electronic or structured format, which is commonly used and allows for further use by the data subject. The Commission may specify the electronic format referred to above, as well as the technical standards, modalities and procedures for their transfer.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 19. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text: 'Non-Applicability. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'The immediately preceding sections are not applicable if the processed personal information are used only for the needs of scientific and statistical research and, on the basis of such, no activities are carried out and no decisions are taken regarding the data subject: Provided, That the personal information shall be held under strict confidentiality and shall be used only for the declared purpose. Likewise, the immediately preceding sections are not applicable to processing of personal information gathered for the purpose of investigations in relation to any criminal, administrative or tax liabilities of a data subject.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'CHAPTER V\nSECURITY OF PERSONAL INFORMATION',
                                          style: AppTextStyles.subtitle1,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 20. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Security of Personal Information. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    '(a) The personal information controller must implement reasonable and appropriate organizational, physical and technical measures intended for the protection of personal information against any accidental or unlawful destruction, alteration and disclosure, as well as against any other unlawful processing.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(b) The personal information controller shall implement reasonable and appropriate measures to protect personal information against natural dangers such as accidental loss or destruction, and human dangers such as unlawful access, fraudulent misuse, unlawful destruction, alteration and contamination.\n\n(c) The determination of the appropriate level of security under this section must take into account the nature of the personal information to be protected, the risks represented by the processing, the size of the organization and complexity of its operations, current data privacy best practices and the cost of security implementation. Subject to guidelines as the Commission may issue from time to time, the measures implemented must include:',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(
                                            '(1) Safeguards to protect its computer network against accidental, unlawful or unauthorized usage or interference with or hindering of their functioning or availability;\n\n(2) A security policy with respect to the processing of personal information;\n\n(3) A process for identifying and accessing reasonably foreseeable vulnerabilities in its computer networks, and for taking preventive, corrective and mitigating action against security incidents that can lead to a security breach; and\n\n(4) Regular monitoring for security breaches and a process for taking preventive, corrective and mitigating action against security incidents that can lead to a security breach.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(d) The personal information controller must further ensure that third parties processing personal information on its behalf shall implement the security measures required by this provision.\n\n(e) The employees, agents or representatives of a personal information controller who are involved in the processing of personal information shall operate and hold personal information under strict confidentiality if the personal information are not intended for public disclosure. This obligation shall continue even after leaving the public service, transfer to another position or upon termination of employment or contractual relations.\n\n(f) The personal information controller shall promptly notify the Commission and affected data subjects when sensitive personal information or other information that may, under the circumstances, be used to enable identity fraud are reasonably believed to have been acquired by an unauthorized person, and the personal information controller or the Commission believes (bat such unauthorized acquisition is likely to give rise to a real risk of serious harm to any affected data subject. The notification shall at least describe the nature of the breach, the sensitive personal information possibly involved, and the measures taken by the entity to address the breach. Notification may be delayed only to the extent necessary to determine the scope of the breach, to prevent further disclosures, or to restore reasonable integrity to the information and communications system.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(
                                            '(1) In evaluating if notification is unwarranted, the Commission may take into account compliance by the personal information controller with this section and existence of good faith in the acquisition of personal information.\n\n(2) The Commission may exempt a personal information controller from notification where, in its reasonable judgment, such notification would not be in the public interest or in the interests of the affected data subjects.\n\n(3) The Commission may authorize postponement of notification where it may hinder the progress of a criminal investigation related to a serious breach.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'CHAPTER VI\nACCOUNTABILITY FOR TRANSFER OF PERSONAL INFORMATION',
                                          style: AppTextStyles.subtitle1,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 21. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Principle of Accountability. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'Each personal information controller is responsible for personal information under its control or custody, including information that have been transferred to a third party for processing, whether domestically or internationally, subject to cross-border arrangement and cooperation.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(a) The personal information controller is accountable for complying with the requirements of this Act and shall use contractual or other reasonable means to provide a comparable level of protection while the information are being processed by a third party.\n\n(b) The personal information controller shall designate an individual or individuals who are accountable for the organization’s compliance with this Act. The identity of the individual(s) so designated shall be made known to any data subject upon request.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'CHAPTER VII\nSECURITY OF SENSITIVE PERSONAL\nINFORMATION IN GOVERNMENT',
                                          style: AppTextStyles.subtitle1,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 22. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Responsibility of Heads of Agencies. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'All sensitive personal information maintained by the government, its agencies and instrumentalities shall be secured, as far as practicable, with the use of the most appropriate standard recognized by the information and communications technology industry, and as recommended by the Commission. The head of each government agency or instrumentality shall be responsible for complying with the security requirements mentioned herein while the Commission shall monitor the compliance and may recommend the necessary action in order to satisfy the minimum standards.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 23. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Requirements Relating to Access by Agency Personnel to Sensitive Personal Information. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    '(a) On-site and Online Access – Except as may be allowed through guidelines to be issued by the Commission, no employee of the government shall have access to sensitive personal information on government property or through online facilities unless the employee has received a security clearance from the head of the source agency.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(b) Off-site Access – Unless otherwise provided in guidelines to be issued by the Commission, sensitive personal information maintained by an agency may not be transported or accessed from a location off government property unless a request for such transportation or access is submitted and approved by the head of the agency in accordance with the following guidelines:',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(
                                            '(1) Deadline for Approval or Disapproval – In the case of any request submitted to the head of an agency, such head of the agency shall approve or disapprove the request within two (2) business days after the date of submission of the request. In case there is no action by the head of the agency, then such request is considered disapproved;\n\n(2) Limitation to One thousand (1,000) Records – If a request is approved, the head of the agency shall limit the access to not more than one thousand (1,000) records at a time; and\n\n(3) Encryption – Any technology used to store, transport or access sensitive personal information for purposes of off-site access approved under this subsection shall be secured by the use of the most secure encryption standard recognized by the Commission.\n\nThe requirements of this subsection shall be implemented not later than six (6) months after the date of the enactment of this Act.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 24. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Applicability to Government Contractors. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'In entering into any contract that may involve accessing or requiring sensitive personal information from one thousand (1,000) or more individuals, an agency shall require a contractor and its employees to register their personal information processing system with the Commission in accordance with this Act and to comply with the other provisions of this Act including the immediately preceding section, in the same manner as agencies and government employees comply with such requirements.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'CHAPTER VIII\nPENALTIES',
                                          style: AppTextStyles.subtitle1,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 25. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Unauthorized Processing of Personal Information and Sensitive Personal Information. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    '(a) The unauthorized processing of personal information shall be penalized by imprisonment ranging from one (1) year to three (3) years and a fine of not less than Five hundred thousand pesos (Php500,000.00) but not more than Two million pesos (Php2,000,000.00) shall be imposed on persons who process personal information without the consent of the data subject, or without being authorized under this Act or any existing law.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(b) The unauthorized processing of personal sensitive information shall be penalized by imprisonment ranging from three (3) years to six (6) years and a fine of not less than Five hundred thousand pesos (Php500,000.00) but not more than Four million pesos (Php4,000,000.00) shall be imposed on persons who process personal information without the consent of the data subject, or without being authorized under this Act or any existing law.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 26. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Accessing Personal Information and Sensitive Personal Information Due to Negligence. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    '(a) Accessing personal information due to negligence shall be penalized by imprisonment ranging from one (1) year to three (3) years and a fine of not less than Five hundred thousand pesos (Php500,000.00) but not more than Two million pesos (Php2,000,000.00) shall be imposed on persons who, due to negligence, provided access to personal information without being authorized under this Act or any existing law.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(b) Accessing sensitive personal information due to negligence shall be penalized by imprisonment ranging from three (3) years to six (6) years and a fine of not less than Five hundred thousand pesos (Php500,000.00) but not more than Four million pesos (Php4,000,000.00) shall be imposed on persons who, due to negligence, provided access to personal information without being authorized under this Act or any existing law.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 27. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Improper Disposal of Personal Information and Sensitive Personal Information. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    '(a) The improper disposal of personal information shall be penalized by imprisonment ranging from six (6) months to two (2) years and a fine of not less than One hundred thousand pesos (Php100,000.00) but not more than Five hundred thousand pesos (Php500,000.00) shall be imposed on persons who knowingly or negligently dispose, discard or abandon the personal information of an individual in an area accessible to the public or has otherwise placed the personal information of an individual in its container for trash collection.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(b) The improper disposal of sensitive personal information shall be penalized by imprisonment ranging from one (1) year to three (3) years and a fine of not less than One hundred thousand pesos (Php100,000.00) but not more than One million pesos (Php1,000,000.00) shall be imposed on persons who knowingly or negligently dispose, discard or abandon the personal information of an individual in an area accessible to the public or has otherwise placed the personal information of an individual in its container for trash collection.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 28. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Processing of Personal Information and Sensitive Personal Information for Unauthorized Purposes. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'The processing of personal information for unauthorized purposes shall be penalized by imprisonment ranging from one (1) year and six (6) months to five (5) years and a fine of not less than Five hundred thousand pesos (Php500,000.00) but not more than One million pesos (Php1,000,000.00) shall be imposed on persons processing personal information for purposes not authorized by the data subject, or otherwise authorized under this Act or under existing laws.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            '(b) The processing of sensitive personal information for unauthorized purposes shall be penalized by imprisonment ranging from two (2) years to seven (7) years and a fine of not less than Five hundred thousand pesos (Php500,000.00) but not more than Two million pesos (Php2,000,000.00) shall be imposed on persons processing sensitive personal information for purposes not authorized by the data subject, or otherwise authorized under this Act or under existing laws.',
                                            style: AppTextStyles.subHeadings,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 29. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Unauthorized Access or Intentional Breach. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'The penalty of imprisonment ranging from one (1) year to three (3) years and a fine of not less than Five hundred thousand pesos (Php500,000.00) but not more than Two million pesos (Php2,000,000.00) shall be imposed on persons who knowingly and unlawfully, or violating data confidentiality and security data systems, breaks in any way into any system where personal and sensitive personal information is stored.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 30. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Concealment of Security Breaches Involving Sensitive Personal Information. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'The penalty of imprisonment of one (1) year and six (6) months to five (5) years and a fine of not less than Five hundred thousand pesos (Php500,000.00) but not more than One million pesos (Php1,000,000.00) shall be imposed on persons who, after having knowledge of a security breach and of the obligation to notify the Commission pursuant to Section 20(f), intentionally or by omission conceals the fact of such security breach.',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 31. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Malicious Disclosure. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    'Any personal information controller or personal information processor or any of its officials, employees or agents, who, with malice or in bad faith, discloses unwarranted or false information relative to any personal information or personal sensitive information obtained by him or her, shall be subject to imprisonment ranging from one (1) year and six (6) months to five (5) years and a fine of not less than Five hundred thousand pesos (Php500,000.00) but not more than One million pesos (Php1,000,000.00).',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'SECTION 32. ',
                                            style: AppTextStyles.subHeadings,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text:
                                                      'Unauthorized Disclosure. – ',
                                                  style: AppTextStyles
                                                      .subHeadings
                                                      .copyWith(
                                                          fontStyle: FontStyle
                                                              .italic)),
                                              TextSpan(
                                                text:
                                                    '(a) Any personal information controller or personal information processor or any of its officials, employees or agents, who discloses to a third party personal information not covered by the immediately preceding section without the consent of the data subject, shall he subject to imprisonment ranging from one (1) year to three (3) years and a fine of not less than Five hundred thousand pesos (Php500,000.00) but not more than One million pesos (Php1,000,000.00).',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              child: Text(
                                                'Agree',
                                                style:
                                                    AppTextStyles.subHeadings,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop(
                                                    false); //Will not exit the App
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //actions: <Widget>[],
                              );
                            },
                          );
                        },
                        child: Text(
                          "Terms and Conditions",
                          style: AppTextStyles.subHeadings.copyWith(
                            color: AppColors.blueAccent,
                            fontWeight: FontWeight.normal,
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
                      } else {
                        print(username);
                        print(firstName);
                        print(middleName);
                        print(lastName);
                        print(accountID);
                        print(department);
                        print(password);
                        validateCredentials();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => NavBar()));
                      }
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 40)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.yellowAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Register as Instructor',
                      style: AppTextStyles.title
                          .copyWith(color: AppColors.blueAccent),
                    ),
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
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    )));
  }

  void saveUser() {
    Box<Instructor> instructorBox =
        Hive.box<Instructor>(HiveBoxesInstructor.instructor);
    instructorBox.add(Instructor(
      userName: username,
      name: firstName,
      middleName: middleName,
      lastName: lastName,
      accountID: accountID,
      department: department,
      password: password,
    ));
    print("User saved succesfully!");
  }

  displayDetailsIndialog() {
    Box<Instructor> instructorBox =
        Hive.box<Instructor>(HiveBoxesInstructor.instructor);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text("User Details"),
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.all(30.0),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.8,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35 - 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("User Details", style: AppTextStyles.headings2),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          width: 300,
                          color: AppColors.greyAccentLine,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Username: $username"),
                        Text("Full Name: $lastName, $firstName $middleName"),
                        Text("Account ID: $accountID"),
                        Text("Department: $department"),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child:
                              Text("Close", style: AppTextStyles.subHeadings),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text("Confirm",
                              style: AppTextStyles.subHeadings
                                  .copyWith(color: AppColors.blueAccent)),
                          onPressed: () {
                            saveUser();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // actions: <Widget>[

          // ],
        );
      },
    );
  }
}
