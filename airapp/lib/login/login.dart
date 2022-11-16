import 'package:airapp/constants.dart';
import 'package:airapp/signup/signup.dart';
import 'package:flutter/material.dart';

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

  TextEditingController usernameText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 5,
                        ),
                        Center(
                          child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/airapp_logo.png'))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Login to your account',
                          style: AppTextStyles.headings,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Log in now to access your account',
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 2),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 2),
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
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 40)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.blueAccent),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                            ),
                            child: Text('Login',
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
                            Text("Doesn't have an account?   ",
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
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
