import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/core/error/exception.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/AddToProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/EditeProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/FavMovieResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ProfileResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ResetPassword.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/profile_data_source_service/profile_data_source_service.dart';
import 'package:movie/presentation/main_layout/tabs/profile/domain/entity/profile_entity.dart';
import 'package:movie/presentation/main_layout/tabs/profile/domain/profile_repo/profile_repo_repository.dart';

import '../../presentation/screens/profile.dart';
@Injectable(as: ProfileRepository)
class ProfileRepoRepositoryImpl implements ProfileRepository {
 final ProfileDataSourceService _dataSourceService;
  @factoryMethod
  ProfileRepoRepositoryImpl(this._dataSourceService);
  @override
  Future<Either<Failure, void>> addToFav(AddToFavRequest request) async{
    try{
      var response=await   _dataSourceService.addToFav(request);
      return Right(response);
    }on AppException catch(e){
      return Left(Failure(e.message));
    }


  }

  @override
  Future<Either<Failure, void>> removeFromFav(String movieId)async {
    try{
    final response=await   _dataSourceService.removeFromFav(movieId);
    return Right( response);

  }on AppException catch(e){
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, FavMovieResponse>> getFavMovies()async {
  try{
  var response=await  _dataSourceService.getFavMovies();
  return Right(response);
  }on AppException catch(ex){
    return Left(Failure(ex.message));
  }
  }

  @override
  @override
  Future<bool> isFavMovie(String movieId) async {
    final response = await _dataSourceService.isFavMovie(movieId);

    if (response == null) return false;

    return response.data ?? false;
  }

  @override
  Future<Either<Failure, ProfileResponse>> getProfile() async {
    try {
      var response = await _dataSourceService.getProfile();



      return Right(response);

    } on AppException catch (ex) {
      return Left(Failure(ex.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProfile()async {
    try{
  var response=  await  _dataSourceService.deleteProfile();
  return Right(response);
    }on AppException catch(ex){
      return Left(Failure(ex.message));
    }
  }
 Future<Either<Failure, void>> editeProfile(EditeProfileRequest request)async {
   try{
     var response=  await  _dataSourceService.editeProfile(request);
     return Right(response);
   }on AppException catch(ex){
     return Left(Failure(ex.message));
   }
 }
 Future<Either<Failure, void>> resetPassword(ResetPasswordRequest request)async {
   try{
     var response=  await  _dataSourceService.resetPassword(request);
     return Right(response);
   }on AppException catch(ex){
     return Left(Failure(ex.message));
   }
 }

}


