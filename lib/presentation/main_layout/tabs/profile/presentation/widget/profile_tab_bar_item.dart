import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTabBarItem extends StatelessWidget {
  const ProfileTabBarItem({super.key,required this.tittle,required this.image});
 final String image;
 final String tittle;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset(image),
      Text(tittle,style: Theme.of(context).textTheme.titleMedium,)
      
    ],);
  }
}
