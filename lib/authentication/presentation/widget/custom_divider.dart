import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors_manger.dart';

class CustomDivider extends StatelessWidget{
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
 return                 Row(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
     Container(
       width: 91.w,
       height: 1.h,
       color: ColorsManger.yellow,
     ),
     SizedBox(
       width: 11.w,
     ),
     Text(
       'OR',
       style: Theme.of(context).textTheme.displaySmall,
     ),
     SizedBox(
       width: 11.w,
     ),
     Container(
       width: 91.w,
       height: 1.h,
       color: ColorsManger.yellow,
     )
   ],
 );

  }





}