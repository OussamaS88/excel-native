import 'package:excel_api/excel_api.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../family_data.dart';

class FamilyDataView extends StatelessWidget {
  final Camp camp;
  const FamilyDataView({Key? key, required this.camp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExcelApi excel = context.read<ExcelApi>();
    // return Scaffold(
    // appBar: AppBar(title: Text(camp.name)),
    // body:
    return BlocProvider(
      create: (context) => FamilyDataBloc(
        db: context.read<MyDatabase>(),
        camp: camp,
        excelApi: excel,
      ),
      child: const FamilyDataPage(),
    );
    // );
  }
}
