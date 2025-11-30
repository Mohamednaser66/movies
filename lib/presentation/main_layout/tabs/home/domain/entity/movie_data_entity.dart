import 'package:movie/presentation/main_layout/tabs/home/domain/entity/movie_entity.dart';

class MovieDataEntity{
  int? limit;
  int? pageNumber;
  List<MovieEntity>? movies;
  MovieDataEntity({required this.pageNumber,required this.limit,required this.movies});
}