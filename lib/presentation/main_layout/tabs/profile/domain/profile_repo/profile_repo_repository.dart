import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/AddToProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/EditeProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/FavMovieResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ProfileResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ResetPassword.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/profile.dart';
import 'package:movie/presentation/main_layout/tabs/profile/domain/entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure,void>> addToFav(AddToFavRequest request);
  Future<Either<Failure,void>> removeFromFav(String movieId);
  Future<Either<Failure,FavMovieResponse>> getFavMovies();
  Future<Either<Failure,ProfileResponse>> getProfile();
  Future<bool> isFavMovie(String movieId);
  Future<Either<Failure,void>>deleteProfile();
  Future<Either<Failure, void>> editeProfile(EditeProfileRequest request);
  Future<Either<Failure, void>> resetPassword(ResetPasswordRequest request);
}