import 'package:dio/dio.dart';
import 'package:withtheclass/model/user_model.dart';

class ApiService {

  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.escuelajs.co/api/v1/')
  );

  Future<void> registerUser(UserModel model) async{
    try{
      await dio.post('users',data: model.toJson());
    }on DioException catch(err){
      throw '$err';
    }
  }

}