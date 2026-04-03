import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:withtheclass/controller/register_controller.dart';
import 'package:withtheclass/model/user_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  final userCtrl = Get.put(RegisterController());
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final avatarCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    avatarCtrl.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Page')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter your name'),
              controller: nameCtrl,
            ),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter your email'),
              controller: emailCtrl,
            ),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter your password'),
              controller: passwordCtrl,
            ),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter your avatar'),
              controller: avatarCtrl,
            ),

            ElevatedButton(onPressed: (){
              final user = UserModel(
                  name: nameCtrl.text,
                  email: emailCtrl.text,
                  password: passwordCtrl.text,
                  avatar: avatarCtrl.text);

              userCtrl.registerUser(user);
            }, child: Text('Register'))
          ],
        ),
      ),
    );
  }
}
