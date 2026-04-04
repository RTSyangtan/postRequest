import 'package:get/get.dart';
import 'package:withtheclass/services/api_service.dart';

import '../model/product_model.dart';

class ProductController extends GetxController{

  final isLoading = false.obs;
  final products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }
  Future<void> getProduct() async {
    try {
      isLoading.value = true;
      products.value = await ApiService().getProduct();
    } finally {
      isLoading.value = false;
    }
  }
}