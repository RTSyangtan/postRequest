import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:withtheclass/controller/nav_bar_controller.dart';
import 'package:withtheclass/views/cart_page.dart';
import 'package:withtheclass/views/home_page.dart';
import 'package:withtheclass/views/profile_page.dart';
import 'package:withtheclass/views/search_page.dart';

class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
  final navCtrl = Get.put(NavBarController());
    final pages = [
      const HomePage(),
      const SearchPage(),
      const CartPage(),
      const ProfilePage()
    ];
    return Obx(()=>
        Scaffold(
          body: IndexedStack(index: navCtrl.index.value,children: pages,),
          bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: navCtrl.index.value,
          onTap: navCtrl.changeIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
          ]),
        ));
  }
}
