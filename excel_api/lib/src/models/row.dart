import 'package:equatable/equatable.dart';
import 'package:excel/excel.dart';

import '../../excel_api.dart';

class ExcelRow extends Equatable {
  final List<dynamic> mp;
  const ExcelRow({required this.mp});
  factory ExcelRow.fromExcelRow({required List<Data?> row}) {
    List<dynamic> cMap = [];
    for (Data? d in row) {
      if (d == null) {
        cMap.add("");
      } else {
        cMap.add(d.value);
      }
    }
    return ExcelRow(mp: cMap);
  }

  @override
  List<Object?> get props => [mp];
}
