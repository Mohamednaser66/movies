import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/fav_movie.dart';
import '../../../../../../../core/assets_manger.dart';
import '../../../../../../../core/colors_manger.dart';
import '../../profile_cubit/profile_cubit.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    favMovies= context.read<ProfileCubit>().favMovies;
  }
  @override

  late List<FavMovie>favMovies;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: favMovies.length,
      itemBuilder: (context, index) {
      SizedBox(
        width: 188.w,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Card(
                child: Padding(
                  padding:  REdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Text(favMovies[index].rating.toString(),style: Theme.of(context).textTheme.titleSmall,),
                      SizedBox(width: 4.w,),
                      Image.asset (ImagesManger.star)

                    ],
                  ),
                ),
                color: ColorsManger.dark.withOpacity(0.7),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r)
                ),
              ),
            )
          ],
        ),
      );
    },);
  }
}
