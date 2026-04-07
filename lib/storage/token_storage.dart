import 'package:get_storage/get_storage.dart';

class TokenStorage {

  static final GetStorage _box = GetStorage();
  static const String _accessToken = 'access_token';

  //save token
  static void saveToken({required String accessToken}){
    _box.write(_accessToken, accessToken);
  }

  //get token
  static String? get getAccessToken{
    return _box.read(_accessToken);
  }

  //remove token
  static void removeToken(){
    _box.remove(_accessToken);
  }
}