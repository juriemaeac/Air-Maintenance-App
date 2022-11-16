import 'package:airapp/constants.dart';
import 'package:airapp/login/login.dart';
import 'package:airapp/signup/signup.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
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
              'Welcome to Air Maintenance App',
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
              width: MediaQuery.of(context).size.width / 1.2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
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
                child: Text('Login',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
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
          ],
        ),
      ),
    );
  }
}
