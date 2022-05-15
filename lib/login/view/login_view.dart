import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginView());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
    );
  }
}
