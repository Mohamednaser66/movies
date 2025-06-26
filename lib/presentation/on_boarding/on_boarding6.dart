import 'package:flutter/material.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/presentation/on_boarding/widget/custom_container.dart';

class OnBoarding6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(ImagesManger.onBoarding6, fit: BoxFit.cover),
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
                  Color(0xff2A2C30).withOpacity(0.0),
                  Color(0xff2A2C30).withOpacity(1.0)
                ])),
          ),
          Positioned(
            bottom: 0,
            child: CustomContainer(
                title: 'Start Watching Now',
                onClickFristButton: () {},
                titleInFristButton: 'Finish',
              titleInSecoundButton: 'Back',
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
