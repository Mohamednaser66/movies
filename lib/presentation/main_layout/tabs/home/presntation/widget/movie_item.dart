import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/presentation/main_layout/tabs/home/domain/entity/movie_entity.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key,required this.movie});
 final MovieEntity? movie;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 188.w,
      child: Stack(
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesManger.movieDetails,arguments: movie);
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: CachedNetworkImage(
            imageUrl: movie?.largeCoverImage??'',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Text(movie?.rating.toString()??'',style: Theme.of(context).textTheme.titleSmall,),
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
  }
}
