import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:movie/presentation/main_layout/details_screen/widget/fav_button.dart';
import 'package:movie/presentation/main_layout/tabs/home/domain/entity/movie_entity.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/AddToProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/presentation/profile_cubit/profile_cubit.dart';

class MovieDetailsItem extends StatefulWidget {
  const MovieDetailsItem(
      {super.key, required this.movie, required this.onclick});

  final MovieEntity movie;
  final VoidCallback onclick;

  @override
  State<MovieDetailsItem> createState() => _MovieDetailsItemState();
}

class _MovieDetailsItemState extends State<MovieDetailsItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      isFav = await context
          .read<ProfileCubit>()
          .checkIsFav(widget.movie.id.toString());

    });

  }

  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    log('isFav====$isFav');
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Stack(
        children: [
          Positioned.fill(
              child: CachedNetworkImage(
            imageUrl: widget.movie.largeCoverImage ?? '',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )),
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
            padding: REdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                    Spacer(),
                    FavButton(
                      isFav: isFav,
                      onClick: () {
                        final newFavStatus = !isFav;
                        setState(() {
                          isFav = newFavStatus;
                        });

                        context.read<ProfileCubit>().editeFavMovie(
                          newFavStatus,
                          widget.movie.id.toString(),
                          AddToFavRequest(
                            year: widget.movie.year.toString(),
                            rating: widget.movie.rating,
                            movieId: widget.movie.id.toString(),
                            imageURL: widget.movie.largeCoverImage,
                            name: widget.movie.title,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      widget.onclick();
                    },
                    icon: Image.asset(ImagesManger.playIcon)),
                Spacer(),
                Column(
                  children: [
                    Text(
                      widget.movie.title ?? '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      widget.movie.year.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
