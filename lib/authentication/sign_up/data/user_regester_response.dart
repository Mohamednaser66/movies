import 'dart:convert';

import 'package:movie/authentication/sign_up/data/user_regester_Data.dart';
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












}