import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/colors_manger.dart';

class CustomDetailsContainer extends StatelessWidget {
  const CustomDetailsContainer({super.key,required this.count,required this.svg});
  final String count;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return
      Container(

        decoration: BoxDecoration(
            color: ColorsManger.grey,
          borderRadius: BorderRadius.circular(16.r)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset(svg),
            SizedBox(width: 10.w,),
            Text(count ,style: Theme.of(context).textTheme.titleLarge,)
            ],
          ),
        ),
      );

  }
}
