import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/presentation/main_layout/tabs/home/domain/entity/movie_response_entity.dart';
import 'package:movie/presentation/main_layout/tabs/home/domain/repository/repository.dart';
@injectable
class MovieUseCase{
 final  MovieRepository _repository;
 @factoryMethod
 const MovieUseCase(this._repository);

 Future<Either<Failure,MovieResponseEntity>> invokeGetMovies(){
   return _repository.getMovies();
 }
 Future<Either<Failure,MovieResponseEntity>> invokeGetMoviesByGenre(String genre,int pageNumber){
  return _repository.getMoviesByGenre(pageNumber, genre);
 }
 Future<Either<Failure,MovieResponseEntity>> search(String q){
  return _repository.search(q);
 }

}