import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/config/theme/theme.dart';
import 'package:movie/core/routes_manger.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          routes: RoutesManger.routes,
          initialRoute: RoutesManger.onBoarding1,
          debugShowCheckedModeBanner: false,
          theme: ThemeManger.light,
          darkTheme: ThemeManger.dark,
          themeMode: ThemeMode.dark,
        );
      },
    );
  }
}