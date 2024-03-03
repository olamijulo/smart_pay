import 'package:flutter/material.dart';

import 'package:smart_pay/theme/palette.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smart_pay/theme/app_typography.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        scaffoldBackgroundColor: white,
        brightness: Brightness.light,
        textTheme: TextTheme(
          titleLarge: AppTypography.titleLarge,
          headlineLarge: AppTypography.headlineLarge,
          headlineMedium: AppTypography.headlineMedium,
          headlineSmall: AppTypography.headlineSmall,
          bodyLarge: AppTypography.bodyLarge,
          bodyMedium: AppTypography.bodyMedium,
          bodySmall: AppTypography.bodySmall,
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                backgroundColor: grey900,
                disabledBackgroundColor: grey900.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)))),
        inputDecorationTheme: InputDecorationTheme(
            fillColor: grey50,
            filled: true,
            hintStyle: AppTypography.bodyLarge.copyWith(color: grey400),
            contentPadding: const EdgeInsets.all(20.0),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(16.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: primaryColor400),
                borderRadius: BorderRadius.circular(16.0))),
        extensions: const [
          // Palette(
          //     textColor: black,
          //     cardBgColor: grey1,
          //     textFieldBgColor: grey1,
          //     bottomSheetBgColor: grey6,
          //     scaffoldBgColor: grey,
          //     iconColor: black,
          //     textFieldBorderColor: black)
        ]);
  }

  static ThemeData get darkTheme {
    return ThemeData(
        scaffoldBackgroundColor: grey800,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          titleLarge: AppTypography.titleLarge,
          headlineLarge: AppTypography.headlineLarge,
          headlineMedium: AppTypography.headlineMedium,
          headlineSmall: AppTypography.headlineSmall,
          bodyLarge: AppTypography.bodyLarge,
          bodyMedium: AppTypography.bodyMedium,
          bodySmall: AppTypography.bodySmall,
        ),
        extensions: const [
          // Palette(
          //   textColor: Colors.white,
          //   cardBgColor: neutralBlack3,
          //   textFieldBgColor: grey5,
          //   bottomSheetBgColor: grey6,
          //   scaffoldBgColor: black,
          //   textFieldBorderColor: lightGrey,
          //   iconColor: grey1,
          // )
        ]);
  }
}
