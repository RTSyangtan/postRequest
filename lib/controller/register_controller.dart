import 'package:get/get.dart';
import 'package:withtheclass/model/user_model.dart';
import 'package:withtheclass/services/api_service.dart';

class RegisterController {

  final _apiService = ApiService();

  var isLoading = false.obs;

  Future<void> registerUser(UserModel model) async{

    try{
      isLoading = true.obs;
      await _apiService.registerUser(model);
      Get.snackbar('Success', 'User created successfully');
    }catch(err){
      isLoading = false.obs;
      Get.snackbar('Failed', 'User creation Failed! error $err');
    }
  }
}