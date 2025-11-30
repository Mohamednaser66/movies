import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie/core/constant.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/AddToProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/EditeProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/FavMovieResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ProfileResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ResetPassword.dart';
import 'package:movie/presentation/main_layout/tabs/profile/domain/entity/profile_entity.dart';
import 'package:movie/presentation/main_layout/tabs/profile/domain/use_case/use-case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/fav_movie.dart';

part 'profile_state.dart';
@injectable
class ProfileCubit extends Cubit<ProfileState> {
  @factoryMethod
  ProfileCubit(this._useCase) : super(ProfileInitial());
 final ProfileUseCase _useCase;
 List<FavMovie> favMovies=[];
addFavList(AddToFavRequest request,)async{
  emit(EditFavLoading());
 var result =await  _useCase.invokeAddToFav(request);
 result.fold((error) {
   emit(EditFavError(message: error.message));
 }, (r) {
   emit(EditFavSuccess());
 },);

}
removeFromFavList(String movieId)async{
  emit(EditFavLoading());
  var result =await _useCase.invokeRemoveFromFav(movieId);
  result.fold((error) {
    emit( EditFavError(message: error.message));
  }, (r) {
    emit(EditFavSuccess());
  },);
}
  Future<void>editeFavMovie(bool isFav,String movieId,AddToFavRequest request){
 if(isFav){
   return removeFromFavList(movieId);
 }else{
   return addFavList(request);
 }


}

getFavMovies()async{
  emit(GetFavLoadingState());
  var result =await _useCase.invokeGetFavMovies();
  result.fold((error) {
    emit(GetFavErrorState(message: error.message));
  }, (response) {
    favMovies=response.data!;
    emit(GetFavSuccessState(response:
    response.data));
  },);}
  Future<bool> checkIsFav(String movieId) async {
    try {
      return await _useCase.checkIsFav(movieId);
    } catch (e) {
      return false;
    }
  }
  getProfile()async{
  emit( ProfileLoadingState());
  var result = await _useCase.getProfile();
  result.fold((error) {
    emit(ProfileErrorState(message: error.message));
  }, (response) {
    emit(ProfileSuccessState(profileEntity: response?.data?.toProfileEntity()));
  },);
  }
  logout(BuildContext context)async{
    SharedPreferences shared= await   SharedPreferences.getInstance();
    shared.remove(CacheConstant.token);
    Navigator.pushReplacementNamed(context, RoutesManger.signIn);

  }
  deleteProfile(BuildContext context)async{
  emit(DeleteProfileLoadingState());
 var result =await _useCase.invokeDeleteProfile();
 result.fold((error) {
   emit(DeleteProfileErrorState(message: error.message));
 }, (r) {
   emit(DeleteProfileSuccessState());
   Navigator.pushReplacementNamed(context, RoutesManger.signIn);
 },);
  }
  editeProfile(EditeProfileRequest request)async {
  emit( EditeProfileLoadingState());
  var result =await _useCase.invokeEdieProfile(request);
  result.fold((l) {
    emit( EditeProfileErrorState(message: l.message));
  }, (r) {
    emit( EditeProfileSuccessState());
  },);
  }
  resetPassword(ResetPasswordRequest request)async{
  emit(ResetPasswordLoadingState());
  var result =await _useCase.invokeResetPassword(request);
  result.fold((l) {
    emit(ResetPasswordErrorState(message: l.message));
  }, (r) {
    emit(ResetPasswordSuccessState());
  },);
  }
}
