part of 'movie_cubit.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}
final class MovieLoadingState extends MovieState {}
final class MovieErrorState extends MovieState {
  String? message;
  MovieErrorState({required this.message});
}
final class MovieSuccessState extends MovieState {
  MovieResponseEntity movie;
  MovieSuccessState({required this.movie});
}
final class MovieGenreLoadingState extends MovieState {}
final class MovieGenreErrorState extends MovieState {
  String? message;
  MovieGenreErrorState({required this.message});
}
final class MovieGenreSuccessState extends MovieState {
  MovieResponseEntity movie;
  MovieGenreSuccessState({required this.movie});

}
final class SearchLoadingState extends MovieState {}
final class SearchErrorState extends MovieState {
  String? message;
  SearchErrorState({required this.message});
}
final class SearchSuccessState extends MovieState {
  MovieResponseEntity movie;
  SearchSuccessState({required this.movie});

}
