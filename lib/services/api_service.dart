import 'package:dio/dio.dart';
import 'package:withtheclass/model/login_model.dart';
import 'package:withtheclass/model/product_model.dart';
import 'package:withtheclass/model/user_model.dart';
import 'package:withtheclass/services/get_storage.dart';

class ApiService {

  late Dio dio;
  ApiService(){
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://api.escuelajs.co/api/v1/',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 20),
          sendTimeout: const Duration(seconds: 20),
          headers: {
            'Content-Type':'application/json'}
      ),
      
    );
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options,handler){
        final token = TokenStorage.getAccessToken;
        if(token != null){
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onResponse: (response,handler ){
        handler.next(response);
    }
    ));
  }


  Future<void> registerUser(UserModel model) async {
    try {
      await dio.post('users', data: model.toJson());
    } on DioException catch (err) {
      throw '$err';
    }
  }
  
  Future loginUser(LoginModel model )async{
    try{
      final response = await dio.post('auth/login',data:model.toJson() );
     return response.data;
    }on DioException catch(err){
      throw '$err';
    }
  }

  Future<List<ProductModel>> getProduct() async{
    try {
      final response = await dio.get('products');
      print(response.data);
      print('Hereeeeeee inm Serviceeeeeeeeeeeeeee');
      return ((response.data)as List).map((e)=>ProductModel.fromJson(e)).toList();
    }on DioException catch(err){
      throw '$err';
    }
  }

}
