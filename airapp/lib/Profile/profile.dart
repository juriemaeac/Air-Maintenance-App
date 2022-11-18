import 'package:airapp/constants.dart';
import 'package:airapp/landingPage.dart';
import 'package:airapp/login/login.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: [
                Text('Profile'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
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
                  child: Text('Login',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
