import 'package:excel_api/excel_api.dart';
import 'package:excel_native/app/bloc/app_bloc.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomeView());
  @override
  Widget build(BuildContext context) {
    MyDatabase localDb = context.read<MyDatabase>();
    ExcelApi excel = context.read<ExcelApi>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  context.read<AppBloc>().add(AppLogoutRequested());
                  break;
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text('Log out'),
                )
              ];
            },
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(db: localDb, excelApi: excel),
        child: const HomePage(),
      ),
    );
  }
}
