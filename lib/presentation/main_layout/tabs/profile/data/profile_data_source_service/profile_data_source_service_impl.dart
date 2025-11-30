import 'package:injectable/injectable.dart';
import 'package:movie/apis_service/apis_service.dart';
import 'package:movie/authentication/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:movie/core/error/exception.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/EditFavResponse.dart';

import 'package:movie/presentation/main_layout/tabs/profile/data/models/AddToProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/EditeProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/FavMovieResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/IsFavResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ProfileResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ResetPassword.dart';

import 'profile_data_source_service.dart';
@Injectable(as:ProfileDataSourceService )
class ProfileDataSourceServiceImpl implements ProfileDataSourceService {
  AuthLocalDataSource _localDataSource;
  ApisService _apisService;
  @factoryMethod
  ProfileDataSourceServiceImpl(this._localDataSource,this._apisService);


  @override
  Future<EditFavResponse> addToFav(AddToFavRequest request) async{
   final token =await _localDataSource.getToken();

    try{
   final response= await _apisService.addMovieToFav(request, token!);
   return response;
  }catch(e){
    throw RemoteException(e.toString());
  }


  }

  @override
  Future<EditFavResponse> removeFromFav(String movieId)async {
    final   token =await _localDataSource.getToken();
 try{
   var response =await  _apisService.removeFromFav(movieId, token!);
   return response;
 }catch(e){
   throw RemoteException(e.toString());
 }


  }

  @override
  Future<FavMovieResponse> getFavMovies()async {
    final  token =await _localDataSource.getToken();
  try{
    var response=await  _apisService.getFavMovies(token!);
    return response;
  }catch(e){
    throw RemoteException(e.toString());
  }
  }

  @override
  Future<IsFavResponse> isFavMovie(String movieId)async {
    final  token =await _localDataSource.getToken();
  try{
  var response=await   _apisService.checkIsFav(token!, movieId);
  return response;
  }catch(ex){
    throw RemoteException(ex.toString());
  }
  }

  @override
  Future<ProfileResponse> getProfile() async{
    final  token =await _localDataSource.getToken();
 try{
   var response=await  _apisService.getProfile(token!);
   return response;
 }catch(ex){
   throw RemoteException(ex.toString());
 }
  }

  @override
  Future<void> deleteProfile()async {
  final token=await _localDataSource.getToken();
   try{
     _apisService.deleteProfile(token!);
   }catch(ex){
     throw RemoteException(ex.toString());
   }
  }
  Future<void> editeProfile(EditeProfileRequest request)async {
    final token=await _localDataSource.getToken();
    try{
      _apisService.updateProfile(token!, request);
    }catch(ex){
      throw RemoteException(ex.toString());
    }
  }
  Future<void> resetPassword(ResetPasswordRequest request)async {
    final token=await _localDataSource.getToken();
    try{
      _apisService.resetPassword( request,token!);
    }catch(ex){
      throw RemoteException(ex.toString());
    }
  }
}
