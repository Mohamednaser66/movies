import 'package:flutter/material.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/presentation/on_boarding/widget/custom_container.dart';

class OnBoarding5 extends StatelessWidget {
  const OnBoarding5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              ImagesManger.onBoarding5,
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
                  Color(0xff601321).withOpacity(0.0),
                  Color(0xff601321).withOpacity(1.0),
                ])),
          ),
          Positioned(
            bottom: 0,
            child: CustomContainer(
                title: 'Rate, Review, and Learn',
                discription:
                    "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
                onClickFristButton: (){
                  Navigator.pushNamed(context, RoutesManger.onBoarding6);
                },
                titleInFristButton: 'Next',
              titleInSecoundButton: "Back",
            onClickSecoundButton: (){
                  Navigator.pop(context);
            },
            ),
          )
        ],
      ),
    );
  }
}
