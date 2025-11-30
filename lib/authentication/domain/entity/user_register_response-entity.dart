import 'package:movie/authentication/domain/entity/register_user_entity.dart';

class RegisterResponseEntity{
  final String message;
  final RegisterUserEntity? user;
  RegisterResponseEntity({required this.message,required this.user});
}