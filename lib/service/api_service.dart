import 'package:dio/dio.dart';
import 'package:withtheclass/storage/token_storage.dart';

class ApiService {
  late Dio dio;
  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        sendTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        connectTimeout: Duration(seconds: 10),
        headers: {'Content-Type': 'application.json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = TokenStorage.getAccessToken;
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
      ),
    );
  }

  Future registerUser() async {
    try {} catch (err) {}
  }
}
