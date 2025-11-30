import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:movie/core/constant.dart';
import 'package:movie/presentation/main_layout/tabs/home/presntation/movie_cubit/movie_cubit.dart';
import 'package:movie/presentation/main_layout/tabs/home/presntation/widget/movie_item.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  int currentIndex =0;
  String  currentGenre ='Action';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadGenre();
  }
  void _loadGenre() {
    currentGenre = (GenreConstant.genres..shuffle()).first;
    context.read<MovieCubit>().getMoviesByGenre(currentGenre,1);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
  child: Column(
          children: [
            SizedBox(
              height: 500.h,
              child: BlocBuilder<MovieCubit, MovieState>(
                buildWhen: (previous, current) {
      if(current is MovieSuccessState ||current is MovieErrorState||current is MovieLoadingState){
        return true;
      }return false;},
  builder: (context, state) {
    if(state is MovieErrorState){
      return Center(child: Text(state.message??''),);
    }if(state is MovieSuccessState){
      return Stack(
        children: [
          Positioned.fill(
            child:CachedNetworkImage(
              imageUrl: state.movie.data?.movies![currentIndex].largeCoverImage ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )

          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorsManger.dark.withOpacity(0.8),
                    ColorsManger.dark.withOpacity(0.6),
                    ColorsManger.dark.withOpacity(1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.6, 1.0],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  ImagesManger.availableNow,
                  height: 80.h,
                ),
                SizedBox(height: 20.h),
                SizedBox(
                    height: 350.h,
                    child:CarouselSlider.builder(
                      itemCount: state.movie.data?.movies?.length,
                      itemBuilder: (context, index, realIndex) {
                        return MovieItem(movie:state.movie.data!.movies![index] ,);
                      },

                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex =index;
                          });
                        },
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.55,
                        aspectRatio: 1 / 2,
                      ),
                    )



                ),

              ],
            ),
          ),
        ],
      );
    }return Center(child: CircularProgressIndicator(color: ColorsManger.yellow,),);
  },
),
            ),
            SizedBox(height: 16.h),
            Image.asset(
              ImagesManger.watchNow,
              height: 80.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    currentGenre,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See More",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 16.sp),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: ColorsManger.yellow,
                    size: 16,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 250.h,
              child: BlocBuilder<MovieCubit, MovieState>(
                buildWhen: (previous, current) {
                  if(current is MovieGenreLoadingState||current is MovieGenreErrorState||current is MovieGenreSuccessState){
                    return true;
                  }
                  return false;
                },
  builder: (context, state) {
                  if(state is MovieGenreSuccessState){
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.movie.data?.movies?.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: MovieItem(movie: state.movie.data!.movies?[index],),
                      ),
                    );

                  }
                  if(state is MovieGenreErrorState){
                    return Center(child:  Text(state.message??'Failed To Load Movies'),);
                  }
                  return Center(child: CircularProgressIndicator(color: ColorsManger.yellow,),);
  },
),
             ),
          ],
        ),
),
      );

  }
}
