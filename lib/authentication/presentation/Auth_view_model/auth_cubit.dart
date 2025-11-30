import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie/authentication/data/models/LoginRequest.dart';
import 'package:movie/authentication/data/models/User_login_response.dart';
import 'package:movie/authentication/data/models/user_regester_request.dart';
import 'package:movie/authentication/domain/entity/register_user_entity.dart';
import 'package:movie/authentication/domain/entity/user_register_response-entity.dart';
import 'package:movie/authentication/domain/use_case/auth_use_case.dart';

part 'auth_state.dart';
@injectable
class AuthCubit extends Cubit<AuthState> {
  @factoryMethod
  AuthCubit(this._useCase) : super(AuthInitial());
 final AuthUseCase _useCase;

 register(UserRegisterRequest request)async{
   emit(RegisterLoading());
 var result= await  _useCase.invokeRegister(request);
 result.fold((error) {
   emit(RegisterError(message: error.message));
 }, (response) {
   emit(RegisterSuccess(user: response));
 },);
 }
 login(LoginRequest request)async{
   emit( LoginLoading());
   var result =await _useCase.invokeLogin(request);
   result.fold((error) {
     emit(LoginError(message: error.message));
   }, (response) {
     emit(LoginSuccess(user: response));

   },);
 }
 Future<String?> getToken()async{
 return await  _useCase.getTokenUseCase();
 }
}
