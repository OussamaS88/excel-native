import 'package:excel_native/services/auth/drift_db.dart';
import 'package:flutter/material.dart';
import '../detailed_camp.dart';

class DetailedCampView extends StatelessWidget {
  final Region region;
  const DetailedCampView({Key? key, required this.region}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${region.region} camps:")),
      body: const DetailedCampPage(),
    );
  }
}
