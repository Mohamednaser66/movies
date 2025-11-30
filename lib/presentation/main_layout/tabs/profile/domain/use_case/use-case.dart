import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/AddToProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/EditeProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/FavMovieResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ProfileResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ResetPassword.dart';
import 'package:movie/presentation/main_layout/tabs/profile/domain/entity/profile_entity.dart';
import 'package:movie/presentation/main_layout/tabs/profile/domain/profile_repo/profile_repo_repository.dart';
@injectable
class ProfileUseCase{
final  ProfileRepository _repository;
  @factoryMethod
  ProfileUseCase(this._repository);
 Future<Either<Failure,void>> invokeAddToFav(AddToFavRequest request){
 return  _repository.addToFav(request);
}
Future<Either<Failure,void>>invokeRemoveFromFav(String movieId){
   return _repository.removeFromFav(movieId);
}
Future<Either<Failure,FavMovieResponse>>invokeGetFavMovies(){
   return _repository.getFavMovies();
}
Future<bool> checkIsFav(String movieId)async{
   return await _repository.isFavMovie(movieId);
}
Future<Either<Failure,ProfileResponse?>> getProfile()async{
  return await _repository.getProfile();
}
Future<Either<Failure,void>>invokeDeleteProfile()async{
   return await _repository.deleteProfile();

}
Future<Either<Failure,void>> invokeEdieProfile(EditeProfileRequest request)async{
   return await _repository.editeProfile(request);
}
Future<Either<Failure,void>> invokeResetPassword(ResetPasswordRequest request)async{
  return await _repository.resetPassword(request);
}
}