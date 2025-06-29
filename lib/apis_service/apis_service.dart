import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../authentication/sign_up/data/user_regester_request.dart';
import '../authentication/sign_up/data/user_regester_response.dart';

class ApisService {
  static Future<Either<UserRegisterResponse, String>> regesterUser(
    
      UserRegesterRequest request) async {
    String baseUrl = 'https://route-movie-apis.vercel.app/';
    String regesterEndPoint = 'auth/register';
    Uri url = Uri.parse(baseUrl + regesterEndPoint);
    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request.toJson()),
      );
      print(response.statusCode);
      print(response.body);

      var json = jsonDecode(response.body);
      UserRegisterResponse userResponse = UserRegisterResponse.fromJson(json);
      if (userResponse.statusCode == 200 || userResponse.statusCode == 201) {
        return left(userResponse);
      } else {
        return right(userResponse.message);
      }
    } catch (e) {
      return right(e.toString());
    }
  }
}
