import 'package:airapp/navBar.dart';
import 'package:airapp/boxes/boxInstructor.dart';
import 'package:airapp/boxes/boxStudent.dart';
import 'package:airapp/constants.dart';
import 'package:airapp/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../database/instructor_model.dart';
import '../database/student_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = false;

  String? username;
  String? password;

  @override
  void initState() {
    super.initState();
    Hive.openBox<Student>(HiveBoxesStudent.student);
    Hive.openBox<Instructor>(HiveBoxesInstructor.instructor);
  }

  TextEditingController usernameText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  void clearInputFields() {
    usernameText.clear();
    passwordText.clear();
  }

  authenticateUser() {
    Box<Student> studentBox = Hive.box<Student>(HiveBoxesStudent.student);
    Box<Instructor> instructorBox =
        Hive.box<Instructor>(HiveBoxesInstructor.instructor);
    var userAuthenticated = false;

    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      for (var students in studentBox.values) {
        if (students.userName == usernameText.text &&
            students.password == passwordText.text) {
          var uuName = students.userName.toString();
          var uname =
              "${students.name.toString()} ${students.lastName.toString()}";
          var udept = students.department.toString();
          var uaccountID = students.accountID.toString();
          var usy = students.schoolYear.toString();
          var uss = students.schoolSection.toString();
          userCredential.setUsername(uuName);
          userCredential.setName(uname);
          userCredential.setDepartment(udept);
          userCredential.setAccountID(uaccountID);
          userCredential.setSchoolYear(usy);
          userCredential.setSchoolSection(uss);
          userAuthenticated = true;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavBar(),
            ),
          );
        }
      }
      for (var instructors in instructorBox.values) {
        if (instructors.userName == usernameText.text &&
            instructors.password == passwordText.text) {
          var uuName = instructors.userName.toString();
          var uname =
              "${instructors.name.toString()} ${instructors.lastName.toString()}";
          var udept = instructors.department.toString();
          var uaccountID = instructors.accountID.toString();

          userCredential.setUsername(uuName);
          userCredential.setName(uname);
          userCredential.setDepartment(udept);
          userCredential.setAccountID(uaccountID);
          userAuthenticated = true;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavBar(),
            ),
          );
        }
      }
      if (!userAuthenticated) {
        clearInputFields();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid username or password'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
                key: _formKey,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Container(
                          //   height: MediaQuery.of(context).size.height / 5,
                          // ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.airplanemode_active_rounded,
                                size: 50,
                                color: AppColors.yellowAccent,
                              ),
                            ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width / 2,
                            //   height: MediaQuery.of(context).size.height * 0.08,
                            //   child: Image(
                            //     image:
                            //         AssetImage('assets/images/airapp_logo.png'),
                            //   ),
                            // ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Login to your account',
                            style: AppTextStyles.headings1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Log in to start aircraft inspection and maintenance',
                            style: AppTextStyles.subHeadings,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.greyAccent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              controller: usernameText,
                              style: AppTextStyles.textFields,
                              decoration: const InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 25, right: 13),
                                labelText: 'Enter Username',
                                labelStyle: AppTextStyles.subHeadings,
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color: AppColors.blueAccent, width: 2),
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
                            height: 50,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.greyAccent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              controller: passwordText,
                              obscureText: !_isObscure,
                              style: AppTextStyles.textFields,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 25, right: 13),
                                labelText: 'Enter Password',
                                labelStyle: AppTextStyles.subHeadings,
                                border: InputBorder.none,
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                      color: AppColors.blueAccent, width: 2),
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
                            height: 35,
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                authenticateUser();
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => NavBar()));
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 40)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.blueAccent),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                shadowColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent),
                              ),
                              child: Text(
                                'Login',
                                style: AppTextStyles.title
                                    .copyWith(color: AppColors.yellowAccent),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Doesn't have an account?  ",
                                  style: AppTextStyles.subHeadings),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()));
                                },
                                child: Text(
                                  'Sign up',
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
                ))));
  }
}

class userCredential {
  static String username = 'n/a';
  static String name = 'n/a';
  static String department = 'n/a';
  static String schoolYear = 'n/a';
  static String schoolSection = 'n/a';
  static String accountID = 'n/a';

  static String getUsername() {
    return username;
  }

  static String getName() {
    return name;
  }

  static String getDepartment() {
    return department;
  }

  static String getSchoolYear() {
    return schoolYear;
  }

  static String getSchoolSection() {
    return schoolSection;
  }

  static String getAccountID() {
    return accountID;
  }

  static void setUsername(String value) {
    username = value;
    print("Username: " + username);
  }

  static void setName(String value) {
    name = value;
    print("Name: " + name);
  }

  static void setDepartment(String value) {
    department = value;
    print("Department: " + department);
  }

  static void setSchoolYear(String value) {
    schoolYear = value;
    print("School Year: " + schoolYear);
  }

  static void setSchoolSection(String value) {
    schoolSection = value;
    print("School Section: " + schoolSection);
  }

  static void setAccountID(String value) {
    accountID = value;
    print("Account ID: " + accountID);
  }
}
