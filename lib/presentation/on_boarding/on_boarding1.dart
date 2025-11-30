import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/core/widget/custom_elvated_button.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            ImagesManger.onBoarding1,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xff1E1E1E).withOpacity(0.0),
              Color(0xff121312).withOpacity(0.50),
              Color(0xff121312).withOpacity(0.91),
              Color(0xff121312).withOpacity(1.0),
            ],
            stops: [0.0, 0.39, 0.68, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                Text(
                    textAlign: TextAlign.center,
                    'Find Your Next\n Favorite Movie Here',
                    style: Theme.of(context).textTheme.labelLarge),
                SizedBox(height: 16.h),
                Text(
                    textAlign: TextAlign.center,
                    "Get access to a huge library of movies to suit all tastes. You will surely like it.",
                    style: Theme.of(context).textTheme.labelSmall),
                SizedBox(height: 24.h),
                CustomElevatedButton(title: 'Explore Next', onClick: () {
                  Navigator.pushNamed(context, RoutesManger.onBoarding2);
                })
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

