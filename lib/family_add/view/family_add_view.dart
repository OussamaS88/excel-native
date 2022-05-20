
import 'package:excel_native/family_data/family_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../family_add.dart';
class FamilyAddView extends StatelessWidget {
  const FamilyAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("New Family")),
        body: BlocProvider.value(
          value: context.read<FamilyDataBloc>(),
          child: const FamilyAddPage(),
        ));
  }
}