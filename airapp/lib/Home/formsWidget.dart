import 'package:airapp/Home/home.dart';
import 'package:airapp/constants.dart';
import 'package:airapp/formMaintenancetask/task.dart';
import 'package:airapp/formMaintenancetask/taskCardA.dart';
import 'package:airapp/formsInspection/forms.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../boxes/boxInstructor.dart';
import '../database/instructor_model.dart';

class FormCard extends StatelessWidget {
  String? title;
  String? subtitle;
  Icon? icon;

  FormCard({super.key, this.title, this.subtitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      height: 250 / 2 - 10,
      width: MediaQuery.of(context).size.width / 2 - 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.greyAccent, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //width: MediaQuery.of(context).size.width / 2 - 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: AppColors.greyAccent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                icon!,
                const SizedBox(
                  width: 10,
                ),
                Text(
                  subtitle!,
                  style: AppTextStyles.subtitle2.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2 - 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Aircraft',
                      style: AppTextStyles.subHeadings,
                    ),
                    Text(
                      title!,
                      style: AppTextStyles.title0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.greyAccentLine,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool isInstructorAvailable = false;
  void getInstructor() {
    final box = Hive.box<Instructor>(HiveBoxesInstructor.instructor);
    int instructorCount = box.length;
    if (instructorCount > 0) {
      setState(() {
        print("Instructor Available");
        isInstructorAvailable = true;
      });
    } else {
      print("No Instructor Available");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            getInstructor();
            if (isInstructorAvailable == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Task(),
                ),
              );
            } else {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.red,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      content: Container(
                        color: Colors.red,
                        height: MediaQuery.of(context).size.height / 5.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    'No instructor account available on this device. Please register Instructor first before proceeding.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.justify),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
          child: FormCard(
            icon: const Icon(
              Icons.build_rounded,
              color: AppColors.yellowAccent,
              size: 20,
            ),
            title: 'Maintenance ',
            subtitle: 'Task Card',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            getInstructor();
            if (isInstructorAvailable == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Forms(),
                ),
              );
            } else {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.red,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      content: Container(
                        color: Colors.red,
                        height: MediaQuery.of(context).size.height / 5.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    'No instructor account available on this device. Please register Instructor first before proceeding.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.justify),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
          child: FormCard(
            icon: const Icon(
              Icons.content_paste_rounded,
              color: AppColors.yellowAccent,
              size: 20,
            ),
            title: 'Maintenance ',
            subtitle: 'Inspection',
          ),
        ),
      ],
    );
  }
}
