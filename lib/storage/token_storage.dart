import 'package:get_storage/get_storage.dart';

class TokenStorage {

  static final GetStorage _box = GetStorage();

  static final String _accessToken = 'access_token';

  //save token
  void saveToken({required String accessToken}){
    _box.write(_accessToken, accessToken);
  }

  //read token

}