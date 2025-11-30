import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie/apis_service/apis_service.dart';
import 'package:movie/authentication/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:movie/authentication/data/models/LoginRequest.dart';
import 'package:movie/authentication/data/models/User_login_response.dart';
import 'package:movie/authentication/data/models/user_regester_request.dart';
import 'package:movie/authentication/data/models/user_regester_response.dart';
import 'package:movie/core/error/exception.dart';
import 'package:movie/core/error/failure.dart';
@Injectable(as:RemoteDataSource )
class ApiDataSourceImpl implements RemoteDataSource{
  final ApisService api;
  @factoryMethod
  ApiDataSourceImpl(this.api);
  @override
  Future<UserLoginResponse> login(LoginRequest request)async {
    try{
     var response= await api.login(request);
     return response;
    }on HttpException catch(exception){
      String? message;
      message=exception.message;
      throw RemoteException(message);
    }

  }

  @override
  Future<UserRegisterResponse> register(UserRegisterRequest request) async{
    try {
  var response= await  api.registerUser(request);
  return response;
    }on HttpException catch(exception){
      String? message;
      message= exception.message;
      throw RemoteException(message);
    }
  }

}