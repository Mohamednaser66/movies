part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class RegisterLoading extends AuthState {}
final class RegisterError extends AuthState {
  String message;
  RegisterError({required this.message});
}
final class RegisterSuccess extends AuthState {
  RegisterResponseEntity user;
  RegisterSuccess({required this.user});
}
final class LoginLoading extends AuthState {}
final class LoginError extends AuthState {
  String message;
  LoginError({required this.message});
}
final class LoginSuccess extends AuthState {
  UserLoginResponse user;
  LoginSuccess({required this.user});
}
