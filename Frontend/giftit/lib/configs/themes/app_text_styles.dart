import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    color: Colors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
    color: AppColors.subtitleGray,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    fontFamily: 'Poppins',
    color: AppColors.subtitleGray,
  );
}
