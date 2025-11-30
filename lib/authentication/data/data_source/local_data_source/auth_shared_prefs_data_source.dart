import 'package:injectable/injectable.dart';
import 'package:movie/authentication/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:movie/core/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as:AuthLocalDataSource )
class AuthSharedPrefsDataSource implements AuthLocalDataSource{
  @override
  Future<String?> getToken()async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   return  prefs.getString(CacheConstant.token);

  }

  @override
  void saveToken(String token)async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(CacheConstant.token, token);
  }

}