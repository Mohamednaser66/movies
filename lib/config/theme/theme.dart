import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManger {
  static ThemeData light=ThemeData();
  static ThemeData dark = ThemeData(
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
        titleLarge: GoogleFonts.inter(color: ColorsManger.white,fontWeight: FontWeight.bold,fontSize: 24.sp),
        titleMedium: GoogleFonts.inter(color: ColorsManger.white,fontWeight: FontWeight.w400,fontSize: 20.sp),


      )


  );
}
