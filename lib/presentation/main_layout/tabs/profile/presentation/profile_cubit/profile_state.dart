part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class EditFavLoading extends ProfileState {}
final class EditFavError extends ProfileState {
  String message;
  EditFavError({required this.message});
}
final class EditFavSuccess extends ProfileState {
}
final class GetFavLoadingState extends ProfileState {}
final class GetFavErrorState extends ProfileState {
  String message;
  GetFavErrorState({required this.message});
}
final class GetFavSuccessState extends ProfileState {
 List<FavMovie>?  response;
  GetFavSuccessState({required this.response});
}


final class ProfileLoadingState extends ProfileState {}
final class ProfileErrorState extends ProfileState {
  String message;
  ProfileErrorState({required this.message});
}
final class ProfileSuccessState extends ProfileState{
final  ProfileEntity? profileEntity;
ProfileSuccessState({required this.profileEntity});
}
final class DeleteProfileLoadingState extends ProfileState {}
final class DeleteProfileSuccessState extends ProfileState {}
final class DeleteProfileErrorState extends ProfileState {
  String message;
  DeleteProfileErrorState({required this.message});
}
final class EditeProfileLoadingState extends ProfileState {}
final class EditeProfileSuccessState extends ProfileState {}
final class EditeProfileErrorState extends ProfileState {
  String message;
  EditeProfileErrorState({required this.message});
}
final class ResetPasswordLoadingState extends ProfileState {}
final class ResetPasswordSuccessState extends ProfileState {}
final class ResetPasswordErrorState extends ProfileState {
  String message;
  ResetPasswordErrorState({required this.message});
}




