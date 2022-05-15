import 'package:drift/drift.dart' as drift;
import 'package:excel_api/excel_api.dart';
import 'package:excel_native/app/bloc/app_bloc.dart';
import 'package:excel_native/routes/routes.dart';
import 'package:excel_native/services/auth/auth_service.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final ExcelApi excelApi;
  final AuthService authService;
  const MyApp({Key? key, required this.excelApi, required this.authService})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: excelApi),
        RepositoryProvider.value(value: authService),
        // RepositoryProvider.value(value: MyDatabase().localAuthUserDao),
      ],
      child: BlocProvider(
        create: (_) => AppBloc(
          authService: authService,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final database = context.read<LocalAuthUserDao>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
      // home: Scaffold(
      //   appBar: AppBar(title: const Text("data")),
      //   body: Column(
      //     children: [
      //       ElevatedButton(
      //           onPressed: () async {
      //             await database.insertLocalAuthUser(LocalAuthUsersCompanion(
      //                 email: drift.Value("email"),
      //                 password: drift.Value("password")));
      //           },
      //           child: const Text("data")),
      //       StreamBuilder(
      //           stream: database.watchAllLocalAuthUsers(),
      //           builder:
      //               (context, AsyncSnapshot<List<LocalAuthUser>> snapshot) {
      //             final localAuthUsers = snapshot.data ?? [];

      //             print("ddd");
      //             print(localAuthUsers);

      //             return Expanded(
      //               child: ListView.builder(
      //                   itemCount: localAuthUsers.length,
      //                   itemBuilder: (_, index) {
      //                     print("object");
      //                     final lau = localAuthUsers[index];
      //                     return Text(
      //                         lau.id.toString() + lau.email + lau.password);
      //                   }),
      //             );
      //           }),
      //     ],
      //   ),
      // ),
    );
  }
}
