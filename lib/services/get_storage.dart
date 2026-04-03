import 'package:get_storage/get_storage.dart';

class TokenStorage {
  static final GetStorage _box = GetStorage();

  static const String _accessToken = 'access_token';

  //save token
  static void saveToken({required String accessToken}) {
    _box.write(_accessToken, accessToken);
  }

  //read token
  static String? get getAccessToken{
    return _box.read(_accessToken);
  }

  //delete token
  static void clearToken(){
    _box.remove(_accessToken);
  }
}
