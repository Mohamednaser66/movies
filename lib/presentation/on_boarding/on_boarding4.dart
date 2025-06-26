import 'package:flutter/material.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/presentation/on_boarding/widget/custom_container.dart';

class OnBoarding4 extends StatelessWidget {
  const OnBoarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(ImagesManger.onBoarding4),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                  0.0,
                  1.0,
                ],
                    colors: [
                  Color(0xff4C2471).withOpacity(0.0),
                  Color(0xff4C2471).withOpacity(1.0),
                ])),
          ),
          Positioned(
            bottom: 0,
            child: CustomContainer(
                title: 'Create Watchlists',
                discription:
                    'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
              titleInFristButton: 'Next',
              onClickFristButton: (){
Navigator.pushNamed(context, RoutesManger.onBoarding5);
                },
            titleInSecoundButton: 'Back',
              onClickSecoundButton:(){
                Navigator.pop(context);
              } ,
            ),
          )
        ],
      ),
    );
  }
}
