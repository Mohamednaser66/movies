import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/presentation/main_layout/tabs/home/data/models/MovieResponse.dart';
import 'package:movie/presentation/main_layout/tabs/home/domain/entity/movie_response_entity.dart';

abstract class MovieRepository{
  Future<Either<Failure,MovieResponseEntity>> getMovies();
  Future<Either<Failure,MovieResponseEntity>> getMoviesByGenre(int pageNumber,String genre);
  Future<Either<Failure,MovieResponseEntity>> search(String q);

}