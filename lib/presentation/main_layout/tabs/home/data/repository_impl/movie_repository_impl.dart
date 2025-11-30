import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/error/exception.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/presentation/main_layout/tabs/home/data/data_source/movie_data_source.dart';
import 'package:movie/presentation/main_layout/tabs/home/data/models/MovieResponse.dart';
import 'package:movie/presentation/main_layout/tabs/home/domain/entity/movie_response_entity.dart';
import 'package:movie/presentation/main_layout/tabs/home/domain/repository/repository.dart';
@Injectable(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository{
  MovieDataSource _dataSource;
  @factoryMethod
  MovieRepositoryImpl(this._dataSource);
  @override
  Future<Either<Failure, MovieResponseEntity>> getMovies()async {
   try{
    var response=await _dataSource.getMovie();
    return Right(response.toMovieResponseEntity());
   }on AppException catch(exception){
     return Left(Failure(exception.message));
   }
  }

  @override
  Future<Either<Failure,MovieResponseEntity>> getMoviesByGenre(int pageNumber, String genre)async {
  try{
    var response =await _dataSource.getMoviesByGenre(pageNumber, genre);
    return Right(response.toMovieResponseEntity());
  }on AppException catch(e){
    return Left(Failure(e.message));
  }

  }

  @override
  Future<Either<Failure, MovieResponseEntity>> search(String q)async {
   try{
     var response=await _dataSource.search(q);
     return Right(response.toMovieResponseEntity());
   }on AppException catch(e){
     return Left(Failure(e.message));
   }
  }

}