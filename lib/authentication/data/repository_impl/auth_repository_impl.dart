import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/authentication/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:movie/authentication/data/models/LoginRequest.dart';
import 'package:movie/authentication/data/models/User_login_response.dart';
import 'package:movie/authentication/data/models/user_regester_request.dart';
import 'package:movie/authentication/domain/entity/user_register_response-entity.dart';
import 'package:movie/authentication/domain/repository/auth_repository.dart';
import 'package:movie/core/error/exception.dart';
import 'package:movie/core/error/failure.dart';

import '../data_source/local_data_source/auth_local_data_source.dart';
@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{

final  RemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  @factoryMethod
  AuthRepositoryImpl(this._localDataSource,this._remoteDataSource);
  @override
  Future<Either<Failure, UserLoginResponse>> login(LoginRequest request)async {
 try{
var  response=await _remoteDataSource.login(request);

 _localDataSource.saveToken(response.token??'');


return Right(response);
 }on AppException catch(exception){
   return Left(Failure(exception.message));
 }
  }

  @override
  Future<Either<Failure, RegisterResponseEntity>> register(UserRegisterRequest request) async{
    try{
  var response=await   _remoteDataSource.register(request);

  return Right(response.toRegisterResponseEntity());
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }
@override
Future<String?> getToken()async {
  return await _localDataSource.getToken();
}




}