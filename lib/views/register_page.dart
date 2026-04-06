import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      appBar: AppBar(title: Text('Register'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter your name'),
            ),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter your email'),
            ),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter your password'),
            ),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter your avatar'),
            ),
            ElevatedButton(onPressed: (){
              
            }, child: Text('Register'))
          ],
        ),
      ),
    );
  }
}
