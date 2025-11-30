
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/authentication/data/models/avater_data_model.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:movie/core/constant.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/presentation/main_layout/tabs/profile/domain/entity/profile_entity.dart';
import 'package:movie/presentation/main_layout/tabs/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:movie/presentation/main_layout/tabs/profile/presentation/widget/profile_tab_bar_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/fav_movie.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileCubit>().getProfile();
    favMovies= context.read<ProfileCubit>().favMovies;
  }
  late List<FavMovie> favMovies;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ColorsManger.grey,
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.only(top: 24,left: 24,right: 2,),
              child: BlocBuilder<ProfileCubit, ProfileState>(
                buildWhen: (previous, current) {
                  if(current is ProfileSuccessState||current is ProfileErrorState||current is ProfileLoadingState){
                    return true;
                  }
                  return false;
                },
  builder: (context, state) {
    if(state is ProfileSuccessState){
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(AvaterDataModel.avaters[state.profileEntity?.avaterId??1].image),
                  SizedBox(height: 16.h,),
                  Text(state.profileEntity?.name??'',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorsManger.white),)
                ],
              ),
              Column(
                children: [
                  Text(favMovies.length.toString(),style: Theme.of(context).textTheme.bodyLarge,),
                  SizedBox(height: 16.h,),
                  Text('Wish List',style: Theme.of(context).textTheme.titleLarge,)
                ],
              ),
              Column(
                children: [
                  Text('12',style: Theme.of(context).textTheme.bodyLarge,),
                  SizedBox(height: 16.h,),
                  Text('History',style: Theme.of(context).textTheme.titleLarge,)
                ],
              )
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManger.red,
                        foregroundColor: ColorsManger.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.r)),

                        )
                    ),onPressed: () {
                      Navigator.pushNamed(context, RoutesManger.updateProfile,arguments: state.profileEntity);
                }, child: Text('Edit Profile')),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManger.yellow,
                        foregroundColor: ColorsManger.dark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.r)),

                        )
                    ),onPressed: () async{
                  context.read<ProfileCubit>().logout(context);

                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Exit'),
                    Icon(Icons.exit_to_app_outlined,)

                  ],
                )),
              ),

            ],
          ),
          SizedBox(height: 10.h,),
          DefaultTabController(

            length: 2,
            initialIndex: 0,
            child: TabBar(
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: false,
                indicatorColor: ColorsManger.yellow,
                tabs: [ProfileTabBarItem(tittle: "Wish List", image: SvgManger.profileWashList),
                  ProfileTabBarItem(tittle: 'History', image: SvgManger.folder)]),

          ),
        ],
      );

    }
    if(state is ProfileErrorState){
      return Center(child: Text(state.message));
    }
    return Center(child:  CircularProgressIndicator(color: ColorsManger.yellow,),);
  },
),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsManger.dark,
                  image: DecorationImage(image: AssetImage(ImagesManger.searchImage))
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
