import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalToken {
  Future<void> saveToken(String token);
  Future<String?> getToken();
}


class Localtokenimp extends LocalToken{
  final SharedPreferences sharedPreferences;
  Localtokenimp({required this.sharedPreferences});
  
  @override
  Future<String?> getToken()async {
    final result = sharedPreferences.getString('token');
    if (result == null) {
      return ("user not logged");
    }else{
    return result;
    }
  }
  
  @override
  Future<void> saveToken(String token) async {
   sharedPreferences.setString('token', token);
  }
}