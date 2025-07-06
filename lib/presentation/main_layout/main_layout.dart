import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:movie/presentation/main_layout/tabs/browse/browse.dart';
import 'package:movie/presentation/main_layout/tabs/home/home.dart';
import 'package:movie/presentation/main_layout/tabs/profile/profile.dart';
import 'package:movie/presentation/main_layout/tabs/search/search.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
List<Widget> tabs=[Home(),Search(),Browse(),Profile()];
int newIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[newIndex],
     bottomNavigationBar:  BottomNavigationBar(
       onTap: (index){
         setState(() {
           newIndex=index;
         });
       },
       currentIndex: newIndex,
          items: [
 BottomNavigationBarItem(icon: SvgPicture.asset(SvgManger.home),label: 'home' ,activeIcon: SvgPicture.asset(SvgManger.home,color: ColorsManger.yellow,)),
        BottomNavigationBarItem(icon: SvgPicture.asset(SvgManger.search),label: 'search',activeIcon: SvgPicture.asset(SvgManger.search,color: ColorsManger.yellow,)),
        BottomNavigationBarItem(icon: SvgPicture.asset(SvgManger.browse),label: 'browse',activeIcon: SvgPicture.asset(SvgManger.browse,color: ColorsManger.yellow,)),
        BottomNavigationBarItem(icon: SvgPicture.asset(SvgManger.profile),label: 'profile',activeIcon: SvgPicture.asset(SvgManger.profile,color: ColorsManger.yellow,)),
      ]),

    );
  }
}
