import 'package:airapp/Home/forms/formsWidget.dart';
import 'package:airapp/home/calendar/calendarSection.dart';
import 'package:airapp/home/manual/manualWidget.dart';
import 'package:airapp/home/profileDetails/profileDetails.dart';
import 'package:airapp/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        //color: AppColors.greyAccent,
        //padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Good Morning, ', style: AppTextStyles.subtitle),
                        Text('Juan Dela Cruz',
                            style: AppTextStyles.headings2.copyWith(
                              color: AppColors.yellowAccent,
                            )),
                      ],
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          color: AppColors.white,
                          size: 25,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CalendarSection(),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Maintenance',
                  style: AppTextStyles.title,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 250,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      decoration: BoxDecoration(
                        color: AppColors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(70, 136, 136, 136),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_copy_rounded,
                                  color: AppColors.yellowAccent,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Records',
                                    style: AppTextStyles.subtitle2
                                        .copyWith(color: AppColors.white)),
                              ],
                            ),
                          ),
                          Text('5',
                              style: TextStyle(
                                color: AppColors.yellowAccent,
                                fontSize: 110,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              )),
                          Column(
                            children: [
                              Text('Total Records',
                                  style: AppTextStyles.subtitle2.copyWith(
                                    color: AppColors.white,
                                  )),
                              Text('subtext',
                                  style: AppTextStyles.subHeadings.copyWith(
                                    color: Color.fromARGB(106, 240, 240, 240),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FormWidget(),
                  ],
                ),
              ),

              Container(
                //color: Colors.amber,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Details(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Manuals',
                  style: AppTextStyles.title,
                ),
              ),
              Container(
                //color: Colors.amber,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.22,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Manuals(),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 30),
              //   child: Text(
              //     'Forms',
              //     style: AppTextStyles.title,
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   //color: Colors.amber,
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 0.28,
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.vertical,
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 30, vertical: 10),
              //       child: Forms(),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      )),
    );
  }
}
