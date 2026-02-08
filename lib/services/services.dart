import 'package:dio/dio.dart';
import 'package:withtheclass/constant/api.dart';
import 'package:withtheclass/model/user_model.dart';

import '../model/user_model.dart';

class Services {

  final dio = Dio();

  Future createUser(UserModel model) async{
    try{
      final req = await dio.post(Api.userUrl);
      return (req.data).UserModel.toJson();
    }on DioException catch(e){
      throw e;
    }
  }
}