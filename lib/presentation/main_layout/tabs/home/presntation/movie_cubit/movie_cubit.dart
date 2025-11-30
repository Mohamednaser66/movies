import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie/presentation/main_layout/tabs/home/domain/entity/movie_entity.dart';
import 'package:movie/presentation/main_layout/tabs/home/domain/entity/movie_response_entity.dart';
import 'package:movie/presentation/main_layout/tabs/home/domain/use_case/movie_use_case.dart';
part 'movie_state.dart';
@injectable
class MovieCubit extends Cubit<MovieState> {
  final MovieUseCase _useCase;
  List<MovieEntity>movies=[];
  List<MovieEntity>?SearchMovies=[];
 late var result;
  @factoryMethod
  MovieCubit(this._useCase) : super(MovieInitial());
  getMovies()async{
    emit(MovieInitial());
    var result = await _useCase.invokeGetMovies();
    result.fold((error) {
      emit( MovieErrorState(message: error.message));
    }, (response) {
      emit(MovieSuccessState(movie: response));
    },);
  }
  getMoviesByGenre(String genre,int pageNumber)async{
  var result= await _useCase.invokeGetMoviesByGenre(genre, pageNumber);
  emit(MovieGenreLoadingState());
  result.fold((error) {
  emit(MovieGenreErrorState(message: error.message));
  }, (response) {
    movies.addAll(response.data!.movies!);
        emit(MovieGenreSuccessState(movie: response));
  },);
  }
   clearMovies(){
     movies.clear();
    emit(MovieGenreLoadingState());
  }
  search(String q)async{
    if(q.trim().isEmpty){
      SearchMovies=[];
      return;}
      emit(SearchLoadingState());
   final result =await _useCase.search(q);
   result.fold((error) {
     emit(SearchErrorState(message: error.message));
   }, (response) {
     if(q.trim().isNotEmpty){
       emit(SearchSuccessState(movie: response));
       SearchMovies=   response.data?.movies;
     }

   },);

  }
}
