import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/core/widget/custom_elvated_button.dart';
import 'package:movie/presentation/on_boarding/widget/custom_container.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
              child: Image.asset(
            ImagesManger.onBoarding2,
            fit: BoxFit.cover,
          )),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xff084250).withOpacity(0.0),
                  Color(0xff084250).withOpacity(1.0),
                ],
                    stops: [
                  0.0,
                  1.0
                ])),
          ),
          Positioned(
            bottom: 0,
            child: CustomContainer(
                title: 'Discover Movies',
                discription:
                    'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
                onClickFristButton: () {
                  Navigator.pushNamed(context, RoutesManger.onBoarding3);
                },
                titleInFristButton: 'Next'),
          )
        ],
      ),
    );
  }
}
