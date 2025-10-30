import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';

ThemeData getLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.grey0,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryBlue,
      brightness: Brightness.light,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: AppColors.grey900,
      displayColor: AppColors.grey900,
    ),
    appBarTheme:  AppBarTheme(
      backgroundColor: AppColors.primaryBlue,
      iconTheme: const IconThemeData(color: AppColors.grey0),
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: AppColors.grey0,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme:  CardThemeData(
      color: AppColors.grey25,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),

  );
}