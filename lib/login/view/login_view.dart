import 'package:flutter/material.dart';
import '../login.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginView());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: const LoginPage(),
    );
  }
}
