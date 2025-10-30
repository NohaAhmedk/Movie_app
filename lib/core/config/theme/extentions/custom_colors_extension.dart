import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';

class CustomColors {
  const CustomColors._({required this.secondaryColor, required this.secondaryTextColor});
  final Color secondaryColor;
  final Color secondaryTextColor;



  factory CustomColors._light() {
    return const CustomColors._(secondaryColor: AppColors.scaffoldLight, secondaryTextColor:AppColors.textPrimary );
  }

  factory CustomColors._dark() {
    return const CustomColors._(secondaryColor: AppColors.textPrimary,secondaryTextColor:AppColors.grey400);
  }
}

extension CustomColorsExtension on ThemeData {
  CustomColors get customColors {
    if (brightness == Brightness.dark) return CustomColors._dark();
    return CustomColors._light();
  }
}