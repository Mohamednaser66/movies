import 'package:movie/authentication/data/models/LoginRequest.dart';
import 'package:movie/authentication/data/models/User_login_response.dart';
import 'package:movie/authentication/data/models/user_regester_request.dart';
import 'package:movie/authentication/data/models/user_regester_response.dart';

abstract class RemoteDataSource{
  Future<UserRegisterResponse> register(UserRegisterRequest request);
  Future<UserLoginResponse> login(LoginRequest request);
}