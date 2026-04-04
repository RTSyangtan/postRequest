import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:withtheclass/controller/login_controller.dart';
import 'package:withtheclass/model/login_model.dart';
import 'package:withtheclass/views/widget/bottom_nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final loginCtrl = Get.put(LoginController());

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Login Page'),),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 10,
        children: [
          TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter your email'),
            controller: emailCtrl,
          ),
          TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter your password'),
            controller: passwordCtrl,
          ),
          Obx(()=>
              ElevatedButton(onPressed: () async{
                final modelUser = LoginModel(email: emailCtrl.text, password: passwordCtrl.text);
                bool success = await loginCtrl.loginUser(modelUser);
                if(success){
                  Get.offAll(() => BottomNavBarPage());
                }
              }, child: loginCtrl.isLoading.value? CircularProgressIndicator(): Text('Login'))
          )
        ],
      ),
    ),);
  }
}
