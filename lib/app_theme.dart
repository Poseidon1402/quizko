import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/colors/app_color.dart';

abstract class AppTheme {

  static final darkTextTheme = TextTheme(
      titleLarge: GoogleFonts.manrope(
        fontSize: 22.sp,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
      titleMedium: GoogleFonts.manrope(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.white1,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.white1,
      ),
      bodySmall: GoogleFonts.manrope(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: AppColor.white1,
      )
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: darkTextTheme,
      colorScheme: const ColorScheme.dark(
        background: AppColor.black1,
        primary: AppColor.yellow1,
        onPrimary: AppColor.white1,
        secondary: AppColor.orange1,
        surface: AppColor.black2,
        onSurface: AppColor.white1,
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColor.black3,
        headerBackgroundColor: AppColor.yellow1,
        headerForegroundColor: Colors.white,
        dividerColor: AppColor.yellow1,
        dayForegroundColor: const MaterialStatePropertyAll<Color>(AppColor.white1),
        yearStyle: GoogleFonts.manrope(
          fontSize: 12,
        ),
        todayBorder: BorderSide.none,
        todayForegroundColor: const MaterialStatePropertyAll<Color>(AppColor.white1),
        weekdayStyle: GoogleFonts.manrope(
          fontSize: 9,
          color: AppColor.white1,
        ),
        dayStyle: GoogleFonts.manrope(
          fontSize: 12,
        ),
        yearForegroundColor: const MaterialStatePropertyAll<Color>(AppColor.white1),
        headerHelpStyle: GoogleFonts.manrope(
          fontSize: 12,
        ),
        headerHeadlineStyle: GoogleFonts.manrope(
          fontSize: 22,
        ),
        cancelButtonStyle: const ButtonStyle(
          foregroundColor: MaterialStatePropertyAll<Color>(AppColor.yellow1),
        ),
        confirmButtonStyle: const ButtonStyle(
          foregroundColor: MaterialStatePropertyAll<Color>(AppColor.yellow1),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: Colors.transparent,
      ),
      checkboxTheme: const CheckboxThemeData(
        fillColor: MaterialStatePropertyAll<Color>(Colors.transparent),
        checkColor: MaterialStatePropertyAll<Color>(AppColor.yellow1),
        side: BorderSide(
          color: AppColor.grey1,
        ),
        shape: CircleBorder(eccentricity: 1),
      ),
      useMaterial3: true,
    );
  }
}