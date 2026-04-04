import 'package:get/get.dart';

class NavBarController extends GetxController{

  var index = 0.obs;

  void changeIndex(int newIndex) {
    index.value = newIndex;
  }
}