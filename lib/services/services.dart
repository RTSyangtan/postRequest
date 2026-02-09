import 'package:dio/dio.dart';
import 'package:withtheclass/constant/api.dart';
import 'package:withtheclass/model/user_model.dart';

class Services {

  static final dio = Dio();

 static Future createUser(UserModel model) async{
    try{
     await dio.post(Api.userUrl,data: model.toJson());
    }on DioException catch(err){
      throw '$err';
    }
  }
}