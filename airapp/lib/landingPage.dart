import 'dart:ffi';

import 'package:airapp/constants.dart';
import 'package:airapp/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    image: AssetImage('assets/images/bg2.jpg'),
                    fit: BoxFit.cover,
                  )),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.08,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  //height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: AppColors.yellowAccent,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'assets/images/aeSVG.svg',
                              color: AppColors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      // Text(
                      //   'Aircraft inspection\nand maintenance\nat glance',
                      //   style: AppTextStyles.headings2.copyWith(
                      //     color: AppColors.yellowAccent,
                      //   ),
                      // ),

                      Text(
                        'AVEASE',
                        style: AppTextStyles.headings1.copyWith(
                            color: AppColors.yellowAccent, fontSize: 60),
                      ),
                      Container(
                        height: 5,
                        width: 70,
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: AppColors.yellowAccent,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Welcme to Avionics Ease, an aircraft inspection\nand maintenance application',
                        style: AppTextStyles.subtitle
                            .copyWith(color: AppColors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  width: MediaQuery.of(context).size.width / 1.2,
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
                                    vertical: 15.0, horizontal: 30)),
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
                        padding: EdgeInsets.only(top: 55),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
