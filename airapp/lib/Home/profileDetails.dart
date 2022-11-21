import 'package:airapp/constants.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatefulWidget {
  String? title;
  IconData? icon;
  double? width;
  bool? visible;
  Color? color;
  Color? contentColor;

  DetailsCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.visible,
      required this.width,
      required this.color,
      required this.contentColor});

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      duration: Duration(milliseconds: 300),
      width: widget.width,
      height: 40,
      decoration: BoxDecoration(
        color: widget.color!,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon!,
                color: widget.contentColor,
              ),
              Visibility(
                  visible: widget.visible!,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(widget.title!,
                          style: AppTextStyles.subtitle
                              .copyWith(color: widget.contentColor)),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  //dito
  String? username = "user1234567890";
  String? accountID = "12345";
  String? department = "AERO-ENG";
  String? schoolYear = "2022-2023";
  String? schoolSection = "Eng1A";

  bool isExpanded0 = true;
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.of(context).size.width / 7;
    double? widthExpanded = MediaQuery.of(context).size.width / 3;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded0 = !isExpanded0;
              isExpanded1 = false;
              isExpanded2 = false;
              isExpanded3 = false;
              isExpanded4 = false;
            });
          },
          child: DetailsCard(
            title: username,
            icon: Icons.person_rounded,
            visible: isExpanded0 ? true : false,
            width: isExpanded0 ? widthExpanded : width,
            color: isExpanded0 ? AppColors.yellowAccent : AppColors.greyAccent,
            contentColor:
                isExpanded0 ? AppColors.white : AppColors.greyAccentLine,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded1 = !isExpanded1;
              isExpanded0 = false;
              isExpanded2 = false;
              isExpanded3 = false;
              isExpanded4 = false;
            });
          },
          child: DetailsCard(
            title: accountID,
            icon: Icons.badge,
            visible: isExpanded1 ? true : false,
            width: isExpanded1 ? widthExpanded : width,
            color: isExpanded1 ? AppColors.yellowAccent : AppColors.greyAccent,
            contentColor:
                isExpanded1 ? AppColors.white : AppColors.greyAccentLine,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded2 = !isExpanded2;
              isExpanded0 = false;
              isExpanded1 = false;
              isExpanded3 = false;
              isExpanded4 = false;
            });
          },
          child: DetailsCard(
            title: department,
            icon: Icons.business_center_rounded,
            visible: isExpanded2 ? true : false,
            width: isExpanded2 ? widthExpanded : width,
            color: isExpanded2 ? AppColors.yellowAccent : AppColors.greyAccent,
            contentColor:
                isExpanded2 ? AppColors.white : AppColors.greyAccentLine,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded3 = !isExpanded3;
              isExpanded0 = false;
              isExpanded1 = false;
              isExpanded2 = false;
              isExpanded4 = false;
            });
          },
          child: DetailsCard(
            title: schoolYear,
            icon: Icons.school,
            visible: isExpanded3 ? true : false,
            width: isExpanded3 ? widthExpanded : width,
            color: isExpanded3 ? AppColors.yellowAccent : AppColors.greyAccent,
            contentColor:
                isExpanded3 ? AppColors.white : AppColors.greyAccentLine,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded4 = !isExpanded4;
              isExpanded0 = false;
              isExpanded1 = false;
              isExpanded2 = false;
              isExpanded3 = false;
            });
          },
          child: DetailsCard(
            title: schoolSection,
            icon: Icons.group,
            visible: isExpanded4 ? true : false,
            width: isExpanded4 ? widthExpanded : width,
            color: isExpanded4 ? AppColors.yellowAccent : AppColors.greyAccent,
            contentColor:
                isExpanded4 ? AppColors.white : AppColors.greyAccentLine,
          ),
        ),
      ],
    );
  }
}
