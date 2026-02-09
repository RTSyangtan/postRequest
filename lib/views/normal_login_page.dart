import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:withtheclass/provider/user_controller.dart';

class NormalLoginPage extends StatefulWidget {
  const NormalLoginPage({super.key});

  @override
  State<NormalLoginPage> createState() => _NormalLoginPageState();
}

class _NormalLoginPageState extends State<NormalLoginPage> {
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    final avatarCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Normal Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          children: [
            TextFormField(
              controller: nameCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text('Enter your Name'),
              ),
            ),
            TextFormField(
              controller: emailCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text('Enter your Email'),
              ),
            ),
            TextFormField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text('Enter your Password'),
              ),
            ),
            TextFormField(
              controller: avatarCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text('Enter your Avatar'),
              ),
            ),
            Obx(() {
              return ElevatedButton(
                onPressed: () {
                  userController.registerUser(
                    name: nameCtrl.text,
                    email: emailCtrl.text,
                    password: passwordCtrl.text,
                    avatar: avatarCtrl.text,
                  );
                },
                child: Text('Login'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
