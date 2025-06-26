import 'package:flutter/material.dart';
import 'package:movie/presentation/on_boarding/on_boarding1.dart';
import 'package:movie/presentation/on_boarding/on_boarding2.dart';
import 'package:movie/presentation/on_boarding/on_boarding3.dart';
import 'package:movie/presentation/on_boarding/on_boarding6.dart';

import '../presentation/on_boarding/on_boarding4.dart';
import '../presentation/on_boarding/on_boarding5.dart';

class RoutesManger {
  static String onBoarding1 = '/onBoarding1';
  static String onBoarding2 = '/onBoarding2';
  static String onBoarding3 = '/onBoarding3';
  static String onBoarding4 = '/onBoarding4';
  static String onBoarding5 = '/onBoarding5';
  static String onBoarding6 = '/onBoarding6';
  static Map<String, WidgetBuilder> routes = {
    onBoarding1: (_) => OnBoarding1(),
    onBoarding2: (_) => OnBoarding2(),
    onBoarding3: (_) => OnBoarding3(),
    onBoarding4: (_) => OnBoarding4(),
    onBoarding5: (_) => OnBoarding5(),
    onBoarding6: (_) => OnBoarding6(),
  };
}
