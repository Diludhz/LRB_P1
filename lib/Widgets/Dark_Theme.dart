import 'package:flutter/material.dart';
import 'package:p1/utils/colors.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
        background: AppColors.bgcolor,
        primary: AppColors.bgcolor,
        secondary: AppColors.darkstheme,
        onSecondaryContainer: AppColors.purewhite,
        surface: AppColors.purewhite,
        onPrimary: AppColors.greylight,
        onSurface: AppColors.unselectedcolor,
        onBackground: AppColors.purewhite,
        onSecondary: AppColors.purewhite,
        onTertiary: AppColors.purewhite,
         onPrimaryContainer: AppColors.greylight,
        onError: AppColors.darkstheme));
