/// movieId : "72604"
/// name : "Renovation Romance"
/// rating : 6.3
/// imageURL : "https://yts.mx/assets/images/movies/renovation_romance_2024/large-cover.jpg"
/// year : "2024"

class FavMovie {
  FavMovie({
      this.movieId, 
      this.name, 
      this.rating, 
      this.imageURL, 
      this.year,});

  FavMovie.fromJson(dynamic json) {
    movieId = json['movieId'];
    name = json['name'];
    rating = json['rating'];
    imageURL = json['imageURL'];
    year = json['year'];
  }
  String? movieId;
  String? name;
  double? rating;
  String? imageURL;
  String? year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movieId'] = movieId;
    map['name'] = name;
    map['rating'] = rating;
    map['imageURL'] = imageURL;
    map['year'] = year;
    return map;
  }

}