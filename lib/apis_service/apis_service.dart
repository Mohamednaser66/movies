import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movie/authentication/data/models/LoginRequest.dart';
import 'package:movie/authentication/data/models/User_login_response.dart';
import 'package:movie/core/constant.dart';
import 'package:movie/presentation/main_layout/tabs/home/data/models/MovieResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/EditFavResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/AddToProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/EditeProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/FavMovieResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/IsFavResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ProfileResponse.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ResetPassword.dart';
import 'package:movie/presentation/main_layout/tabs/profile/presentation/screens/update_profile.dart';

import '../authentication/data/models/user_regester_request.dart';
import '../authentication/data/models/user_regester_response.dart';

@singleton
class ApisService {


  Future<UserRegisterResponse> registerUser(UserRegisterRequest request) async {
    Uri url = Uri.parse(ApiConstant.baseUrl + ApiConstant.registerEndPoint);
    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    var json = jsonDecode(response.body);
    return UserRegisterResponse.fromJson(json);
  }

  Future<UserLoginResponse> login(LoginRequest request) async {
    Uri url = Uri.parse(ApiConstant.baseUrl + ApiConstant.loginEndPoint);
    http.Response response = await http.post(url, headers: {
      'Content-Type': 'application/json',
    }, body: jsonEncode(request.toJson()));
    var json = jsonDecode(response.body);
    return UserLoginResponse.fromJson(json);
  }

  Future<MovieResponse> getMovies() async {
    Uri url = Uri.parse(ApiConstant.movieEndPoint);
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    return MovieResponse.fromJson(json);
  }


  Future<MovieResponse> getMoviesByGenre(
      String genre,
      { required int pageNumber }) async {

    final url = Uri.https('yts.mx', '/api/v2/list_movies.json', {
      'genre': genre,
      'limit': '20',
      'page': "${pageNumber.toString()}",
    },
    );
    final response = await http.get(url);
    var json = jsonDecode(response.body);
    return MovieResponse.fromJson(json);
  }
  Future<MovieResponse> search(String q)async{
    final url=Uri.https('yts.mx', '/api/v2/list_movies.json',{
      'query_term': q,
    });
  http.Response response=await   http.get(url);
  var json =jsonDecode(response.body);
  return MovieResponse.fromJson(json);
  }
 Future<EditFavResponse> addMovieToFav(AddToFavRequest request,String token)async{
    final url =Uri.parse(ApiConstant.baseUrl+ApiConstant.addFav);
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(request.toJson()),
    );
  final json =jsonDecode(response.body);
  return EditFavResponse.fromJson(json);
  }
 Future<EditFavResponse> removeFromFav(String movieId,String token)async{
    final url =Uri.parse(ApiConstant.baseUrl+ApiConstant.removeFav(movieId));
 final response=await   http.delete(url, headers: {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token",
    }, );
   var json =jsonDecode(response.body);
   return EditFavResponse.fromJson(json);

  }
 Future<FavMovieResponse> getFavMovies(String token)async{
    Uri url =Uri.parse(ApiConstant.baseUrl+ApiConstant.getFav);
   var response=await http.get(url,headers:{
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    },);
    var json=jsonDecode(response.body);
    return FavMovieResponse.fromJson(json);
  }
  Future<IsFavResponse>checkIsFav(String token,String movieId)async{
    Uri url =Uri.parse(ApiConstant.baseUrl+ApiConstant.isFav(movieId));
   var response=await http.get(url,headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    }, );
    var json =jsonDecode(response.body);
    return IsFavResponse.fromJson(json);
  }
  Future<ProfileResponse> getProfile(String token)async{
    Uri url =Uri.parse(ApiConstant.baseUrl+ApiConstant.profile);
    var response=await http.get(url,headers:{
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    },);
    var json=jsonDecode(response.body);
    return ProfileResponse.fromJson(json);
  }
  Future<void> deleteProfile(String token)async{
    Uri url =Uri.parse(ApiConstant.baseUrl+ApiConstant.profile);
   var response=await http.delete(url,headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });
   var json=jsonDecode(response.body);
  }
  Future<void> updateProfile(String token,EditeProfileRequest request)async{
    Uri url =Uri.parse(ApiConstant.baseUrl+ApiConstant.profile);
 var response =await   http.patch(url,body: json.encode(request.toJson()),headers: { "Content-Type": "application/json",
      "Authorization": "Bearer $token",} );

  }
  Future<void> resetPassword(ResetPasswordRequest request,String token)async{
    Uri url =Uri.parse(ApiConstant.baseUrl+ApiConstant.resetPassword);
   var response=await  http.patch(url,headers: { "Content-Type": "application/json",
      "Authorization": "Bearer $token",},body: json.encode(request.toJson()));

  }
}