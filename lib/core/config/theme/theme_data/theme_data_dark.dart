import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.grey900,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.grey700,
      brightness: Brightness.dark,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: AppColors.grey0,
      displayColor: AppColors.grey0,
    ),
    appBarTheme:  AppBarTheme(
      backgroundColor: AppColors.grey700,
      iconTheme: const IconThemeData(color: AppColors.primaryBlue),
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: AppColors.primaryBlue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      ),
      cardTheme:  CardThemeData(
        color: AppColors.grey800,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),

    );
  }

