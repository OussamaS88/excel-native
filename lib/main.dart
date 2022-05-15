import 'package:excel_api/excel_api.dart';
import 'package:excel_native/app/app.dart';
import 'package:excel_native/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final ExcelApi excelApi = ExcelApi(
      excelReadFilePath: "excelReadFilePath",
      excelExportFilePath: "excelExportFilePath");
      
  final _authService = AuthService.fromLocal();
  runApp(
    MyApp(excelApi: excelApi, authService: _authService,),
  );
}
