import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/colors_manger.dart';

import '../../../../../core/assets_manger.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(ImagesManger.movie,fit: BoxFit.fill,)),
        Positioned(
          top: 10,
          left: 10,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Text('7.7',style: Theme.of(context).textTheme.titleSmall,),
                  SizedBox(width: 4.w,),
                  Image.asset(ImagesManger.star)

                ],
              ),
            ),
            color: ColorsManger.dark.withOpacity(0.7),
            shape: OutlineInputBorder(
               borderRadius: BorderRadius.circular(10.r)
            ),
          ),
        )
      ],
    );
  }
}
