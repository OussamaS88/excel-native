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
          child: ElevatedButton(
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
        )),
        Center(
          child: ElevatedButton(
              onPressed: () {
                // localDb.insertLocaExcelData(const LocalExcelDatasCompanion(
                //   fName: drift.Value("Name"),
                //   lName: drift.Value("Last"),
                //   phoneNumber: drift.Value("+96100990099"),
                //   location: drift.Value("Tripoli"),
                //   age: drift.Value(60),
                // ));
                context
                    .read<HomeBloc>()
                    .add(InsertFromExcelToLocalHomeEvent(db: localDb));
              },
              child: const Text("Insert random data")),
        ),
      ],
    );
  }
}
