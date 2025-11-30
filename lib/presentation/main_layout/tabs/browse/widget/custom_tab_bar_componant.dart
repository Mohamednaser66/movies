import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/colors_manger.dart';

class CustomTabBarComponent extends StatelessWidget {
   CustomTabBarComponent(
      {super.key,
      required this.movieGenre,
      required this.isSelected});

  final String movieGenre;

  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected?ColorsManger.yellow:Colors.transparent,
        border: Border.all(color: ColorsManger.yellow, width: 2.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        movieGenre,
        style: TextStyle(
            color: isSelected?ColorsManger.dark:ColorsManger.yellow, fontWeight: FontWeight.w700, fontSize: 20.sp),
      ),
    );
  }
}
