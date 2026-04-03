import 'package:get/get.dart';
import 'package:withtheclass/model/user_model.dart';
import 'package:withtheclass/services/api_service.dart';

class RegisterController {

  var isLoading = false.obs;

  Future<void> registerUser(UserModel model) async{

    try{
      isLoading.value = true;
      await ApiService().registerUser(model);

      isLoading.value = false;
      Get.snackbar('Success', 'User created successfully');
    }catch(err){
      isLoading.value = false;
      Get.snackbar('Failed', 'User creation Failed! error $err');
      print('hellooooooooooooooooooooooooooohere it is$err');
    }
  }
}