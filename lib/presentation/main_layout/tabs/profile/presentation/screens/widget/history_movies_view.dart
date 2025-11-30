import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/main_layout/tabs/home/domain/entity/movie_entity.dart';
import 'package:movie/presentation/main_layout/tabs/home/presntation/widget/movie_item.dart';
import 'package:movie/presentation/main_layout/tabs/profile/presentation/profile_cubit/profile_cubit.dart';

class HistoryMoviesView extends StatefulWidget {
  HistoryMoviesView({super.key});

  @override
  State<HistoryMoviesView> createState() => _HistoryMoviesViewState();
}

class _HistoryMoviesViewState extends State<HistoryMoviesView> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    history = context
        .read<ProfileCubit>()
        .historyMovies;
  }
  @override


  late List<MovieEntity> history;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: history.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemBuilder: (context, index) => MovieItem(movie: history[index]),);
  }
}
