import 'package:dependencias/dependencias.dart';
import 'package:drive_ui/src/common/themes/colors/app_color.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme theme(AppColor color) {
    return TextTheme(
      displayLarge: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w400,
        fontSize: 57,
      ),
      displayMedium: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w400,
        fontSize: 45,
      ),
      displaySmall: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w400,
        fontSize: 36,
      ),
      headlineLarge: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w400,
        fontSize: 32,
      ),
      headlineMedium: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w400,
        fontSize: 28,
      ),
      headlineSmall: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w400,
        fontSize: 24,
      ),
      titleLarge: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 0.1,
      ),
      labelLarge: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 0.1,
      ),
      labelMedium: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        letterSpacing: 0.5,
      ),
      labelSmall: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w500,
        fontSize: 11,
        letterSpacing: 0.5,
      ),
      bodyLarge: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: 0.15,
      ),
      bodyMedium: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: 0.25,
      ),
      bodySmall: GoogleFonts.montserrat(
        color: color.onSurface,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        letterSpacing: 0.4,
      ),
    );
  }
}
