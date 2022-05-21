import 'package:excel_native/app/bloc/app_bloc.dart';
import 'package:excel_native/home/view/view.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../camp.dart';

class CampView extends StatelessWidget {
  const CampView({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: CampView());
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => CampBloc(db: context.read<MyDatabase>()),
        child: const CampPage(),
      );
  }
}
