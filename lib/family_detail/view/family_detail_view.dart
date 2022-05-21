import 'package:excel_native/services/auth/drift_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../family_detail.dart';
import '../../family_data/bloc/family_data_bloc.dart';

class FamilyDetailView extends StatelessWidget {
  final Family family;
  const FamilyDetailView({Key? key, required this.family}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(family.nameEng)),
        body: BlocProvider.value(
          value: context.read<FamilyDataBloc>(),
          child: FamilyDetailPage(
            family: family,
          ),
        ));
  }
}
