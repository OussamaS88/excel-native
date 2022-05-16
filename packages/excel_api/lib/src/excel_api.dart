import 'dart:typed_data';

import 'package:excel_api/src/models/models.dart';

import '../excel_api.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:excel/excel.dart';

class ExcelApi {
  final String excelReadFilePath;
  final String excelExportFilePath;
  var bytes;
  ExcelApi(
      {required this.excelReadFilePath,
      required this.excelExportFilePath,
      this.bytes});

  List<ExcelRow> readRowsToExcelRows() {
    var excel = Excel.decodeBytes(bytes);
    List<ExcelRow> mp = [];
    for (var table in excel.tables.keys) {
      var t = excel.tables[table];
      if (t != null) {
        for (var row in t.rows) {
          mp.add(ExcelRow.fromExcelRow(row: row));
        }
      }
    }
    return mp;
  }

  List<ExcelRow> readRowsToExcelRowsFromBytes(Uint8List excelBytes) {
    var excel = Excel.decodeBytes(excelBytes);
    List<ExcelRow> mp = [];
    for (var table in excel.tables.keys) {
      var t = excel.tables[table];
      if (t != null) {
        for (var row in t.rows) {
          var k = ExcelRow.fromExcelRow(row: row);
          if (k == ExcelRow.empty) {
            continue;
          }
          mp.add(k);
        }
      }
    }
    return mp;
  }

  void exportToExcelFromBytes(
      {required List<ExcelRow> excelRows, required Uint8List excelBytes}) {
    var excel = Excel.decodeBytes(excelBytes);
    for (var table in excel.tables.keys) {
      var t = excel.tables[table];
      if (t != null) {
        for (var row in excelRows) {
          t.appendRow(row.mp);
        }
      }
    }
    print(excelRows);
    print("saving...");
    var k = excel.encode();
    var pathToExe = Platform.resolvedExecutable;
    pathToExe = pathToExe.substring(0, pathToExe.indexOf("excel_native.exe"));
    File(p.join(pathToExe, "new_data.xlsx"))
      ..createSync(recursive: true)
      ..writeAsBytesSync(k!);
    print("done saving.");
  }
}
