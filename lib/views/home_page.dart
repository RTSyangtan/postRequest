import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:withtheclass/controller/product_controller.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final productCtrl = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if (productCtrl.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (productCtrl.products.isEmpty) {
        return const Center(child: Text("No products found"));
      }
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder:(context,index){
            final product = productCtrl.products[index];
            return Column(
              children: [
                SizedBox(
                    height: 150,
                    width: 150,
                    child: Card(child: Image.network(product.images[0]))),
                Text(product.title)
              ],
            );
          } );
    });
  }
}
