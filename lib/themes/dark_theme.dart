import 'package:flutter/material.dart';
import 'package:crew_nest/utils/app_colors.dart';

ThemeData dark() => ThemeData(
  fontFamily: "Lato",
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.error,
  colorScheme: ColorScheme.dark(
    primary: AppColors.blue,
    secondary: AppColors.blue.shade300,
    surface: AppColors.black.shade800,
  ),
);
