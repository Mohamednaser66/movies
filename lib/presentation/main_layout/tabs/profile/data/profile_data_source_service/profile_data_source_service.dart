import 'package:movie/presentation/main_layout/tabs/profile/data/models/EditFavResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/AddToProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/EditeProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/FavMovieResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/IsFavResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ProfileResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ResetPassword.dart';

abstract class ProfileDataSourceService {
  Future<EditFavResponse> addToFav(AddToFavRequest request);
  Future<EditFavResponse> removeFromFav(String movieId);
  Future<FavMovieResponse> getFavMovies();
  Future<ProfileResponse> getProfile();
  Future<IsFavResponse> isFavMovie(String movieId);
  Future<void> deleteProfile();
  Future<void> editeProfile(EditeProfileRequest request);
  Future<void> resetPassword(ResetPasswordRequest request);

}