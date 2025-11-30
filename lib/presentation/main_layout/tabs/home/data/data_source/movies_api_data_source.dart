import 'package:injectable/injectable.dart';
import 'package:movie/apis_service/apis_service.dart';
import 'package:movie/core/error/exception.dart';
import 'package:movie/presentation/main_layout/tabs/home/data/data_source/movie_data_source.dart';
import 'package:movie/presentation/main_layout/tabs/home/data/models/MovieResponse.dart';
@Injectable(as: MovieDataSource )
class MoviesApiDataSource implements MovieDataSource{
  @override
 final ApisService _api;
  @factoryMethod
  MoviesApiDataSource(this._api);
  Future<MovieResponse> getMovie()async {
  try{
    var response=await _api.getMovies();
    return response;
  }catch(e){
    throw RemoteException(e.toString());
  }
  }

  @override
  Future<MovieResponse> getMoviesByGenre(int pageNumber,String genre) async{
    try{
    var response=await  _api.getMoviesByGenre(genre, pageNumber: pageNumber);
    return response;

    }catch(e){
      throw RemoteException(e.toString());
    }
  }

  @override
  Future<MovieResponse> search(String q) async{
    try{
  var response= await   _api.search(q);
  return response;

    }catch(e){
      throw RemoteException(e.toString());
    }
  }

}