import 'package:excel_native/services/auth/drift_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../family_data.dart';

class FamilyDataView extends StatelessWidget {
  final Camp camp;
  const FamilyDataView({Key? key, required this.camp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(camp.name)),
      body: BlocProvider(
        create: (context) => FamilyDataBloc(
          db: context.read<MyDatabase>(),
          camp: camp,
        ),
        child: const FamilyDataPage(),
      ),
    );
  }
}
