import 'package:movie/presentation/main_layout/tabs/home/data/models/MovieResponse.dart';

abstract class MovieDataSource{
  Future<MovieResponse> getMovie();
  Future<MovieResponse> getMoviesByGenre(int pageNumber,String genre);
  Future<MovieResponse> search(String q);
}