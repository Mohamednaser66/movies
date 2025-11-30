import 'fav_movie.dart';

/// message : "favourites fetched successfully"
/// data : [{"movieId":"72604","name":"Renovation Romance","rating":6.3,"imageURL":"https://yts.mx/assets/images/movies/renovation_romance_2024/large-cover.jpg","year":"2024"},{"movieId":"72585","name":"Smiley","rating":3.3,"imageURL":"https://yts.mx/assets/images/movies/smiley_2012/large-cover.jpg","year":"2012"}]

class FavMovieResponse {
  FavMovieResponse({
      this.message, 
      this.data,});

  FavMovieResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FavMovie.fromJson(v));
      });
    }
  }
  String? message;
  List<FavMovie>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}