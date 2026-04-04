import 'package:get/get.dart';
import 'package:withtheclass/model/login_model.dart';
import 'package:withtheclass/services/api_service.dart';
import 'package:withtheclass/services/get_storage.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;

  Future<bool> loginUser(LoginModel model) async {
    try {
      isLoading.value = true;
      final response = await ApiService().loginUser(model);
      final token = response['access_token'];

      TokenStorage.saveToken(accessToken: token);
      return true;
    } catch (err) {
      Get.snackbar('Failed', 'Error while logging in $err');
      return false;
    }finally{
      isLoading.value = false;
    }
  }
}
