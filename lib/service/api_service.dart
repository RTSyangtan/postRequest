import 'package:dio/dio.dart';

class ApiService {

  late Dio dio;
ApiService(){
  dio = Dio(BaseOptions(
    baseUrl: '',
    sendTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
    connectTimeout: Duration(seconds: 10),
    headers: {
      'Content-Type': 'application.json'
    })
  );

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options,handler){

    },
    onResponse: (response,handler){

  }
  ));

}


  Future registerUser() async{
    try{

    }catch(err){

    }
  }
}