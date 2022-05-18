import 'package:flutter/material.dart';
import '../camp.dart';

class CampView extends StatelessWidget {
  const CampView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camps")),
      body: const CampPage(),
    );
  }
}
