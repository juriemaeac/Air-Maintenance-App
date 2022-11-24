import 'package:airapp/constants.dart';
import 'package:airapp/authentication/login.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.blueAccent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // padding: const EdgeInsets.all(30),
          child: Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image(
                    image: AssetImage('assets/images/bg1.jpg'),
                    fit: BoxFit.cover,
                  )),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.5,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Aircraft inspection\nand maintenance\nat glance',
                        style: AppTextStyles.headings2.copyWith(
                          color: AppColors.yellowAccent,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Philippine State College of Aeronautics',
                          style: AppTextStyles.subtitle),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 40)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.yellowAccent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 13,
                              ),
                              Text("Let's Go!",
                                  style: AppTextStyles.title2.copyWith(
                                    color: AppColors.blueAccent,
                                  )),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColors.blueAccent,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 25),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Powered by   ",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                            Image.asset('assets/images/artemis.png',
                                width: 60,
                                //height: 100,
                                fit: BoxFit.fill),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
