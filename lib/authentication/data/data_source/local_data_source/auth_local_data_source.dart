abstract class AuthLocalDataSource{

  void saveToken(String token);
  Future<String?>getToken();
}