import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManger {
  static ThemeData light = ThemeData();
  static ThemeData dark = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ColorsManger.yellow,
        unselectedItemColor: ColorsManger.white,
        selectedIconTheme:IconThemeData(
          color: ColorsManger.yellow
        ),
        backgroundColor: ColorsManger.dark,
        selectedLabelStyle: TextStyle(color: ColorsManger.yellow,fontSize: 12,fontWeight: FontWeight.w400),
        unselectedLabelStyle: TextStyle(color: ColorsManger.white,fontSize: 12,fontWeight: FontWeight.w400),
        type: BottomNavigationBarType.fixed,
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorsManger.yellow),
          backgroundColor: ColorsManger.dark,
          titleTextStyle: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            color: ColorsManger.yellow,
          )),
      iconTheme: IconThemeData(color: ColorsManger.white),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorsManger.grey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: ColorsManger.red, width: 2)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: ColorsManger.red, width: 2)),
      ),
      scaffoldBackgroundColor: ColorsManger.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                  fontSize: 18.sp,
                  color: ColorsManger.white,
                  fontWeight: FontWeight.w500),
              padding: REdgeInsets.symmetric(vertical: 16),
              backgroundColor: ColorsManger.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ))),
      textTheme: TextTheme(
        displaySmall: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: ColorsManger.yellow),
        titleSmall: GoogleFonts.inter(
            color: ColorsManger.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400),
        labelLarge: GoogleFonts.inter(
            color: ColorsManger.white,
            fontSize: 28.sp,
            fontWeight: FontWeight.w400),
        labelSmall: GoogleFonts.inter(
            color: ColorsManger.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w400),
        labelMedium: GoogleFonts.inter(
            color: ColorsManger.dark,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500),
        titleLarge: GoogleFonts.inter(
            color: ColorsManger.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.sp),
        titleMedium: GoogleFonts.inter(
            color: ColorsManger.white,
            fontWeight: FontWeight.w400,
            fontSize: 20.sp),
      ));
}
