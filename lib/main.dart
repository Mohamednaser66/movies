import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/authentication/presentation/Auth_view_model/auth_cubit.dart';
import 'package:movie/core/di/di.dart';
import 'package:movie/movie_app.dart';
import 'package:movie/presentation/main_layout/tabs/home/presntation/movie_cubit/movie_cubit.dart';
import 'package:movie/presentation/main_layout/tabs/profile/presentation/profile_cubit/profile_cubit.dart';

void main() async {
  configureDependencies();
  await ScreenUtil.ensureScreenSize();


  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<ProfileCubit>(),),
      BlocProvider<AuthCubit>(
          create: (context) => getIt<AuthCubit>(),
          ),
      BlocProvider<MovieCubit>(
        create: (context) => getIt<MovieCubit>()..getMovies(),
      ),
    ],
    child: MovieApp(),
  ),
  );
}