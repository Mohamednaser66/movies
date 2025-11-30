import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:movie/core/di/di.dart';
import 'package:movie/presentation/main_layout/tabs/browse/browse.dart';
import 'package:movie/presentation/main_layout/tabs/home/presntation/home.dart';
import 'package:movie/presentation/main_layout/tabs/home/presntation/movie_cubit/movie_cubit.dart';
import 'package:movie/presentation/main_layout/tabs/profile/presentation/screens/profile.dart';
import 'package:movie/presentation/main_layout/tabs/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:movie/presentation/main_layout/tabs/search/search.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
late List<Widget> tabs;
int newIndex =0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs=[Home(),Search(),Browse(),Profile()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: tabs[newIndex],
      bottomNavigationBar:  Padding(
        padding:  REdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: BottomNavigationBar(
            onTap: (index){
              setState(() {
                newIndex=index;
              });
              if (index == 0) {
                context.read<MovieCubit>().getMovies();
              }
            },
            currentIndex: newIndex,
               items: [
           BottomNavigationBarItem(icon: SvgPicture.asset(SvgManger.home),label: 'home' ,activeIcon: SvgPicture.asset(SvgManger.home,color: ColorsManger.yellow,)),
             BottomNavigationBarItem(icon: SvgPicture.asset(SvgManger.search),label: 'search',activeIcon: SvgPicture.asset(SvgManger.search,color: ColorsManger.yellow,)),
             BottomNavigationBarItem(icon: SvgPicture.asset(SvgManger.browse),label: 'browse',activeIcon: SvgPicture.asset(SvgManger.browse,color: ColorsManger.yellow,)),
             BottomNavigationBarItem(icon: SvgPicture.asset(SvgManger.profile),label: 'profile',activeIcon: SvgPicture.asset(SvgManger.profile,color: ColorsManger.yellow,)),
           ]),
        ),
      ),

          );
  }
}
