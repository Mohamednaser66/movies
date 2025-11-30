 abstract class ApiConstant{
   static const String baseUrl = 'https://route-movie-apis.vercel.app/';
  static const String registerEndPoint = 'auth/register';
  static const String loginEndPoint = 'auth/login';
  static const String resetPassword = 'auth/reset-password';
  static const String movieEndPoint = 'https://yts.mx/api/v2/list_movies.json';
  static const String movieBaseUrl = 'yts.mx';
  static const String bathMovie = '/api/v2/list_movies.json';
  static const String addFav = 'favorites/add';
  static  String removeFav(String movieId) => 'favorites/remove/$movieId';
  static  String getFav ='favorites/all';
  static  String profile ='profile';
  static  String isFav(String movieId) =>'is-favorite/$movieId';
 }
 abstract class CacheConstant{
static const  String token ='token';
 }
abstract class GenreConstant{
  static List<String>  genres = [
    'Action', 'Adventure', 'Animation', 'Biography', 'Comedy',
    'Crime', 'Documentary', 'Drama', 'Family', 'Fantasy',
    'Film-Noir', 'History', 'Horror', 'Music', 'Musical',
    'Mystery', 'Romance', 'Sci-Fi', 'Sport', 'Thriller',
    'War', 'Western'
  ];

}
