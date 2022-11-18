import 'package:airapp/constants.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  String? title;

  DetailsCard({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            blurRadius: 25,
          ),
        ],
      ),
      child: Center(child: Text(title!, style: AppTextStyles.subtitle)),
    );
  }
}

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DetailsCard(
          title: 'Account ID',
        ),
        const SizedBox(
          width: 15,
        ),
        DetailsCard(
          title: 'Department',
        ),
        const SizedBox(
          width: 15,
        ),
        DetailsCard(
          title: 'Year and Section',
        ),
      ],
    );
  }
}
