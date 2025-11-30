import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:movie/presentation/main_layout/details_screen/widget/custom_details_cotainer.dart';
import 'package:movie/presentation/main_layout/details_screen/widget/movie_details_item.dart';
import 'package:movie/presentation/main_layout/tabs/home/domain/entity/movie_entity.dart';
import 'package:movie/presentation/main_layout/tabs/home/presntation/movie_cubit/movie_cubit.dart';
import 'package:movie/presentation/main_layout/tabs/home/presntation/widget/movie_item.dart';
import 'package:video_player/video_player.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _isLoaded = false;
  VideoPlayerController? _controller;
  bool _isPlaying = false;
  late MovieEntity argument;
  late String genre;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isLoaded) {
      argument = ModalRoute.of(context)!.settings.arguments as MovieEntity;
      genre = (argument.genres?..shuffle())!.first;
      context.read<MovieCubit>().getMoviesByGenre(genre, 1);
      _isLoaded = true;
    }
  }

  Future<void> _initializeMovie() async {
    final movieUrl =
       argument.url;
    _controller = VideoPlayerController.networkUrl(Uri.parse(movieUrl!));
    await _controller!.initialize();
    setState(() {
      _controller!.play();
      _isPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MovieDetailsItem(
                onclick: () async {
        if (_controller == null) {
        await _initializeMovie();
        } else {
        setState(() {
        if (_isPlaying) {
        _controller!.pause();
        } else {
        _controller!.play();
        }
        _isPlaying = !_isPlaying;
        });
        }
        },
               movie: argument,
              ),

              if (_controller != null && _controller!.value.isInitialized)
                AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                )
              else
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(argument.largeCoverImage ?? ''),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white.withOpacity(0.7),
                    size: 60.sp,
                  ),
                ),

              SizedBox(height: 10.h),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManger.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                onPressed: (){

                  },
                child: Text(
                  'watch',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: ColorsManger.white),
                ),
              ),

              SizedBox(height: 8.h),

              Row(
                children: [
                  CustomDetailsContainer(
                    count: argument.rating.toString(),
                    svg: SvgManger.heartIcon,
                  ),
                  const Spacer(),
                  CustomDetailsContainer(
                    count: argument.runtime.toString(),
                    svg: SvgManger.timeIcon,
                  ),
                  const Spacer(),
                  CustomDetailsContainer(
                    count: argument.rating.toString(),
                    svg: SvgManger.starIcon,
                  ),
                ],
              ),

              Text('Summary', style: Theme.of(context).textTheme.titleLarge),
              Text(argument.summary!,
                  style: Theme.of(context).textTheme.labelSmall),
              Text('Genres', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 10.h),
              Wrap(
                runSpacing: 8,
                spacing: 8,
                children: argument.genres!.map((genre) {
                  return Container(
                    padding:
                    REdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: ColorsManger.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      genre,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 10.h),
              Text('Similar', style: Theme.of(context).textTheme.titleLarge),
              BlocBuilder<MovieCubit, MovieState>(
                builder: (context, state) {
                  if (state is MovieGenreSuccessState) {
                    return Center(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.movie.data?.movies?.length,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.h,
                        ),
                        itemBuilder: (context, index) {
                          return MovieItem(
                              movie: state.movie.data?.movies?[index]);
                        },
                      ),
                    );
                  } else if (state is MovieGenreErrorState) {
                    return Center(child: Text(state.message ?? ''));
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorsManger.yellow,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
