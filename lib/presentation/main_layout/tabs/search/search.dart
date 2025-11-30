import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:movie/presentation/main_layout/tabs/home/presntation/movie_cubit/movie_cubit.dart';
import 'package:movie/presentation/main_layout/tabs/home/presntation/widget/movie_item.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}
String query='';
class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ColorsManger.dark,
        child: Padding(
          padding:  REdgeInsets.all(10.0),
          child: Column(
            children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
                if (value.isNotEmpty) {
                  context.read<MovieCubit>().search(value);
                }
              },

              cursorColor: ColorsManger.white,
      
            style: TextStyle(
              color: ColorsManger.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
                hintText: 'search',
                hintStyle: Theme.of(context).textTheme.titleSmall,
                prefixIcon: Padding(
                  padding:  REdgeInsets.all(8.0),
                  child: SvgPicture.asset(SvgManger.search),
                ),
               ),
          ),
              BlocBuilder<MovieCubit, MovieState>(
                builder: (context, state) {
                  if (query.isEmpty) {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Image.asset(ImagesManger.searchImage),
                           SizedBox(height: 20.h),
                          Text('Type something to search', style: TextStyle(color: ColorsManger.white)),
                        ],
                      ),
                    );
                  }

                  if (state is SearchLoadingState) {
                    return  Expanded(
                      child: Center(
                        child: CircularProgressIndicator(color: ColorsManger.yellow),
                      ),
                    );
                  }

                  if (state is SearchSuccessState) {
                    final movies = context.read<MovieCubit>().SearchMovies ?? [];
                    if (movies.isEmpty) {
                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(ImagesManger.searchImage),
                             SizedBox(height: 20.h),
                            Text('No movies found', style: TextStyle(color: ColorsManger.white)),
                          ],
                        ),
                      );
                    }
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: movies.length,
                        itemBuilder: (context, index) => MovieItem(movie: movies[index]),
                      ),
                    );
                  }

                  if (state is SearchErrorState) {
                    return Expanded(
                      child: Center(child: Text(state.message ?? 'Failed to find movies')),
                    );
                  }

                  return  SizedBox.shrink();
                },
              ),


            ],
          ),
        ),
      ),
    );
  }
}
