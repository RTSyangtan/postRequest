import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:withtheclass/model/user_model.dart';
import 'package:withtheclass/services/services.dart';

class UserController extends GetxController {
  var isLoading = false.obs;

  Future registerUser({
    required String name,
    required String email,
    required String password,
    required String avatar,
  }) async {
    try {
      isLoading.value = true;

      final user = UserModel(
        name: name,
        email: email,
        password: password,
        avatar: avatar,
      );

      await Services.createUser(user);
      isLoading.value = false;

      Get.snackbar('Successful', 'User Creation Successful');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Failed', 'Failed while Creating User');
    }
  }
}
