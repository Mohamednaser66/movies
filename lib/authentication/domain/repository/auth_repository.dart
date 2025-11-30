import 'package:dartz/dartz.dart';
import 'package:movie/authentication/data/models/LoginRequest.dart';
import 'package:movie/authentication/data/models/User_login_response.dart';
import 'package:movie/authentication/data/models/user_regester_request.dart';
import 'package:movie/authentication/domain/entity/user_register_response-entity.dart';
import 'package:movie/core/error/failure.dart';

abstract class AuthRepository{
  Future<Either<Failure,RegisterResponseEntity>>register(UserRegisterRequest request);
  Future<Either<Failure,UserLoginResponse>>login(LoginRequest request);
 Future<String?> getToken();
}