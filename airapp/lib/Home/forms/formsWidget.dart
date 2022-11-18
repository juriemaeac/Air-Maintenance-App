import 'package:airapp/constants.dart';
import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.white, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //width: MediaQuery.of(context).size.width / 2 - 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                icon!,
                Text(
                  subtitle!,
                  style: AppTextStyles.subtitle2,
                ),
              ],
            ),
          ),
          SizedBox(
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
                    Text(
                      'Aircraft',
                      style: AppTextStyles.subHeadings,
                    ),
                    Text(
                      title!,
                      style: AppTextStyles.title1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.greyAccentLine,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormCard(
          icon: Icon(
            Icons.build_rounded,
            color: AppColors.yellowAccent,
            size: 20,
          ),
          title: 'Maintenance ',
          subtitle: 'Task Card',
        ),
        SizedBox(
          height: 20,
        ),
        FormCard(
          icon: Icon(
            Icons.content_paste_rounded,
            color: AppColors.yellowAccent,
            size: 20,
          ),
          title: 'Maintenance ',
          subtitle: 'Inspection',
        ),
      ],
    );
  }
}
