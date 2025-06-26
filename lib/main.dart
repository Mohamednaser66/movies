import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/movie_app.dart';

void main()async {
  await ScreenUtil.ensureScreenSize();

  runApp( MovieApp());
}

