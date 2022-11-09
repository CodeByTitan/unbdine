import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import './app_constant.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: AppConstant.primaryColor,
    iconTheme: const IconThemeData(
      color: AppConstant.titlecolor,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600,
        fontSize: 15.sp,
        color: AppConstant.titlecolor,
      ),
      backgroundColor: AppConstant.backgroundColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppConstant.titlecolor,
        size: 20.sp,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppConstant.trans,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppConstant.backgroundColor,
    unselectedWidgetColor: AppConstant.titlecolor,
    cardColor: AppConstant.secondaryColor,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
        color: AppConstant.titlecolor,
        fontSize: 24.sp,
      ),
      displayMedium: GoogleFonts.montserrat(
        color: AppConstant.titlecolor,
        fontSize: 20.sp,
      ),
      displaySmall: GoogleFonts.montserrat(
        color: AppConstant.titlecolor,
        fontSize: 18.sp,
      ),
      headlineMedium: GoogleFonts.montserrat(
        color: AppConstant.titlecolor,
        fontSize: 15.sp,
      ),
      headlineSmall: GoogleFonts.montserrat(
        color: AppConstant.titlecolor,
        fontSize: 12.sp,
      ),
      titleLarge: GoogleFonts.montserrat(
        color: AppConstant.titlecolor,
        fontSize: 8.sp,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: AppConstant.subtitlecolor,
        fontSize: 11.sp,
      ),
      titleSmall: GoogleFonts.montserrat(
        color: AppConstant.subtitlecolor,
        fontSize: 9.sp,
      ),
    ),
    tooltipTheme: TooltipThemeData(
      textStyle: GoogleFonts.montserrat(
        color: AppConstant.titlecolor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppConstant.secondaryColor,
      ),
    ),
  );
}
