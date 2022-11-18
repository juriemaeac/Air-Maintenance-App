import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const white = Colors.white;
  static const black = Color(0xFF404040);
  static const grey = Colors.grey;
  static const greyAccent = Color(0xffF0F0F0);
  static const greyAccentLine = Color.fromARGB(255, 218, 218, 218);

  static const blueAccent = Color(0xFF00004d); //3E5B79
  static const yellowAccent = Color(0xFFfcc200);
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
  static const TextStyle headings2 = TextStyle(
    color: AppColors.black,
    fontSize: 25,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
  );

  static const TextStyle subHeadings = TextStyle(
    color: AppColors.grey,
    fontSize: 13,
    fontFamily: 'Poppins',
  );
  static const TextStyle title = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    fontFamily: 'Poppins',
  );
  static const TextStyle title1 = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    fontFamily: 'Poppins',
  );

  static TextStyle subtitle = GoogleFonts.quicksand(
    color: AppColors.grey,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );
  static TextStyle subtitle1 = GoogleFonts.quicksand(
    color: AppColors.black,
    //fontWeight: FontWeight.w200,
    fontSize: 15,
  );
  static const TextStyle subtitle2 = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    fontFamily: 'Poppins',
  );
  static const TextStyle textFields = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    fontFamily: 'Poppins',
  );
}
