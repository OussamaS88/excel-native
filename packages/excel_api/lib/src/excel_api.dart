import '../excel_api.dart';
import 'dart:io';
import 'package:path/path.dart';
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
}
