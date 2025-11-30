import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/authentication/data/models/LoginRequest.dart';
import 'package:movie/authentication/data/models/User_login_response.dart';
import 'package:movie/authentication/data/models/user_regester_request.dart';
import 'package:movie/authentication/domain/entity/user_register_response-entity.dart';
import 'package:movie/authentication/domain/repository/auth_repository.dart';
import 'package:movie/core/error/failure.dart';

@injectable
class AuthUseCase {
  AuthRepository _repository;

  @factoryMethod
  AuthUseCase(this._repository);

  Future<Either<Failure, UserLoginResponse>> invokeLogin(LoginRequest request)async {
    return  _repository.login(request);
  }

  Future<Either<Failure, RegisterResponseEntity>> invokeRegister(
      UserRegisterRequest request)async  {
    return await _repository.register(request);
  }

  Future<String?> getTokenUseCase() async {
    return await _repository.getToken();
  }
}