import 'dart:convert';

import 'package:movie/authentication/data/models/user_regester_Data.dart';
import 'package:movie/authentication/domain/entity/user_register_response-entity.dart';
class UserRegisterResponse {
  final String message;
  final String? error;
  final int? statusCode;
  final UserRegisteredData? data;

  UserRegisterResponse({
    required this.message,
    this.data,
    this.statusCode,
    this.error,
  });

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) {
    String parsedMessage = "";
    if (json['message'] is String) {
      parsedMessage = json['message'];
    } else if (json['message'] is List) {
      parsedMessage = (json['message'] as List).join('\n');
    }
    //  else {
    //   parsedMessage = "User created successfully";
    // }

    return UserRegisterResponse(
      message: parsedMessage,
      statusCode: json['statusCode'],
      error: json['error'],
      data: json['data'] != null ? UserRegisteredData.fromJson(json['data']) : null,
    );
  }


// UserRegisterResponse.fromJson(Map<String, dynamic> json)
//   : this(
//       message: json['message'],
//       statusCode: json['statusCode'],
//       error: json['error'],
//       data: json['data'] != null ? UserRegisteredData.fromJson(json['data']) : null,
//     );





  RegisterResponseEntity toRegisterResponseEntity(){
    return RegisterResponseEntity(message: message, user: data?.toRegisterUserEntity());
}






}