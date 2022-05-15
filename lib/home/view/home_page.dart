import 'package:excel_api/excel_api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var excel = context.read<ExcelApi>();
    return Column(
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(withData: true);
              if (result != null) {
                final fileName = result.files.first.name;
                final fileBytes = result.files.first.bytes;
                print(fileName);
                context.read<ExcelApi>().bytes = fileBytes;
                var l = context.read<ExcelApi>().readRowsToExcelRows();
                print(l);
              } else {
                // discarder file picker
              }
            },
            child: const Text("Load from Excel"),
          ),
        )),
      ],
    );
  }
}
