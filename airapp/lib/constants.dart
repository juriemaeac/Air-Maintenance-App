import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const white = Colors.white;
  static const black = Color(0xFF404040);
  static const grey = Colors.grey;
  static const greyAccent = Color(0xffF0F0F0);

  static const blueAccent = Color(0xFF36516C);
}

class AppTextStyles {
  //HEADER
  static const TextStyle headings = TextStyle(
    color: AppColors.black,
    fontSize: 23,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
  );
  static const TextStyle headings1 = TextStyle(
    color: AppColors.black,
    fontSize: 30,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
  );

  static const TextStyle subHeadings = TextStyle(
    color: AppColors.grey,
    fontSize: 13,
    fontFamily: 'Poppins',
  );
  static const TextStyle textFields = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    fontFamily: 'Poppins',
  );
}
