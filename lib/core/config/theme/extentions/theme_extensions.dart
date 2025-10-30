import 'package:flutter/material.dart';

import 'custom_colors_extension.dart';

extension ContextExt on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }

  CustomColors get customColors {
    return Theme.of(this).customColors;
  }
}