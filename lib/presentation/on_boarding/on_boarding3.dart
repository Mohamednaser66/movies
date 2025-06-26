import 'package:flutter/material.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/presentation/on_boarding/widget/custom_container.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              ImagesManger.onBoarding3,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                  0.0,
                  1.0
                ],
                    colors: [
                  Color(0xff85210E).withOpacity(0.0),
                  Color(0xff85210E).withOpacity(1.0),
                ])),
          ),
          Positioned(
            bottom: 0,
            child: CustomContainer(
              title: 'Explore All Genres',
              discription:
                  'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
              onClickFristButton: () {
                Navigator.pushNamed(context, RoutesManger.onBoarding4);
              },
              titleInFristButton: 'Next',
              onClickSecoundButton: () {
                Navigator.pop(context);
              },
              titleInSecoundButton: 'Back',
            ),
          )
        ],
      ),
    );
  }
}
