import 'package:drift/drift.dart' as drift;
import 'package:excel_api/excel_api.dart';
import 'package:excel_native/app/bloc/app_bloc.dart';
import 'package:excel_native/services/auth/auth_service.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExcelApi excel = context.read<ExcelApi>();
    MyDatabase localDb = context.read<MyDatabase>();
    return Column(
      children: [
        Center(
          child: Text("Welcome ${context.read<AppBloc>().state.user.email}"),
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(withData: true);
                  if (result != null) {
                    // final fileName = result.files.first.name;
                    final fileBytes = result.files.first.bytes;
                    // print(fileName);
                    // context.read<ExcelApi>().bytes = fileBytes;
                    // var l = context.read<ExcelApi>().readRowsToExcelRows();
                    // print(l);
                    context
                        .read<HomeBloc>()
                        .add(LoadExcelHomeEvent(excelBytes: fileBytes));
                  } else {
                    // discarder file picker
                  }
                },
                child: const Text("Load from Excel"),
              ),
              const SizedBox(
                width: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  context.read<HomeBloc>().add(const UnloadExcelHomeEvent());
                },
                child: const Text("Unload excel"),
              ),
            ],
          ),
        )),
        Center(
          child: ElevatedButton(
              onPressed: () {
                context
                    .read<HomeBloc>()
                    .add(InsertFromExcelToLocalHomeEvent(db: localDb));
              },
              child: const Text("Save data to local DB")),
        ),
        Center(
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            switch (state.homeExcelStatus) {
              case HomeExcelStatus.empty:
                return const Text("No excel file loaded");
              case HomeExcelStatus.loaded:
                return Text(
                    "Loaded excel file successfully, there are ${state.excelRows!.length.toString()} rows");
              default:
                return const Text("Could not load excel file.");
            }
          }),
        ),
        Center(
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            switch (state.homeLocalStatus) {
              case HomeLocalStatus.idle:
                return const Text("No database changes detected");
              case HomeLocalStatus.inserting:
                return const Text("Inserting data...");
              default:
                return const Text(
                    "Could not save excel data to local database.");
            }
          }),
        ),
      ],
    );
  }
}
