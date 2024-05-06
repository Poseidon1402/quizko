import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/colors/app_color.dart';

abstract class AppTheme {

  static final textTheme = TextTheme(
      titleLarge: GoogleFonts.manrope(
        fontSize: 22.sp,
        fontWeight: FontWeight.w800,
        color: AppColor.grey1,
      ),
      titleMedium: GoogleFonts.manrope(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColor.grey1,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.grey1,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.grey1,
      ),
      bodySmall: GoogleFonts.manrope(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: AppColor.grey1,
      )
  );

  static ThemeData light() {
    return ThemeData(
      textTheme: textTheme,
      colorScheme: const ColorScheme.light(
        background: AppColor.white1,
        primary: AppColor.purple3,
        onPrimary: AppColor.white1,
        surface: AppColor.white1,
        error: AppColor.red1,
        onError: AppColor.white1,
      ),
      dividerTheme: const DividerThemeData(
        color: Colors.transparent,
      ),
      checkboxTheme: const CheckboxThemeData(
        fillColor: MaterialStatePropertyAll<Color>(Colors.transparent),
        checkColor: MaterialStatePropertyAll<Color>(AppColor.purple3),
        side: BorderSide(
          color: AppColor.grey1,
        ),
        shape: CircleBorder(eccentricity: 1),
      ),
      useMaterial3: true,
    );
  }
}