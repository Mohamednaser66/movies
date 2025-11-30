import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:movie/core/constant.dart';
import 'package:movie/presentation/main_layout/tabs/browse/widget/custom_tab_bar_componant.dart';
import 'package:movie/presentation/main_layout/tabs/home/presntation/movie_cubit/movie_cubit.dart';
import 'package:movie/presentation/main_layout/tabs/home/presntation/widget/movie_item.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  late ScrollController controller;
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller=ScrollController();
    controller.addListener(() {
      if(controller.position.atEdge&&controller.position.pixels !=0&&!isLoadingMore){
      isLoadingMore=true;
      pageNumber++;
          context.read<MovieCubit>()
              .getMoviesByGenre(GenreConstant.genres[newIndex], pageNumber)
              .then((_) => isLoadingMore = false);

        }


    },);
    loadData();


  }

  loadData(){
   context.read<MovieCubit>()..getMoviesByGenre(GenreConstant.genres[newIndex], pageNumber);
  }


  int pageNumber=1;
  int newIndex =0;
  bool isLoadingMore=false;

  @override
  Widget build(BuildContext context) {
       return SafeArea(
         child: Scaffold(
          body:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
        DefaultTabController(length: GenreConstant.genres.length,
                    initialIndex: newIndex,

                    child: TabBar(isScrollable: true,
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.symmetric(horizontal: 8),
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      tabs: (GenreConstant.genres.map((e) => CustomTabBarComponent(movieGenre: e, isSelected: GenreConstant.genres.indexOf(e)==newIndex)).toList()),
                    onTap: (value) {
                     setState(() {
                       newIndex=value;
                       pageNumber=1;

                     });
                     context.read<MovieCubit>().clearMovies();
                     loadData();
                    }
                    ,),
    
  
),
                BlocBuilder<MovieCubit, MovieState>(
                  buildWhen: (previous, current) {
                    if(current is MovieGenreSuccessState ||current is MovieGenreErrorState||current is MovieGenreLoadingState){
                      return true;
                    }return false;
                  } ,
  builder: (context, state) {

    if(state is MovieGenreSuccessState){

      return Expanded(
        child: GridView.builder(
          controller: controller,
          itemCount: state.movie.data?.movies?.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,),
          itemBuilder:   (context, index) {
        return  MovieItem(movie: state.movie.data?.movies?[index]) ;
        },),
      );
    }if(state is MovieGenreErrorState){
      return Center(child: Text(state.message!),);
    }
    return Center(child: CircularProgressIndicator(color: ColorsManger.yellow,),);
  },
)
              ],
            ),
          ),
         ),
       );
  }
}
