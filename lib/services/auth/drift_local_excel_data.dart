part of './drift_db.dart';

class LocalExcelDatas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fName => text()();
  TextColumn get lName => text()();
  TextColumn get location => text()();
  TextColumn get phoneNumber => text()();
  IntColumn get age => integer()();
}

@DriftAccessor(tables: [LocalExcelDatas])
class LocalExcelDataDao extends DatabaseAccessor<MyDatabase>
    with _$LocalExcelDataDaoMixin {
  final MyDatabase db;
  LocalExcelDataDao(this.db) : super(db);

  Future insertLocaExcelData(LocalExcelDatasCompanion localExcelData) =>
      into(localExcelDatas)
          .insert(localExcelData, mode: InsertMode.insertOrIgnore);

  Future<void> insertMultipleLocalExcelData(List<ExcelRow> rowsList) async {
    await batch((batch) {
      batch.insertAll(localExcelDatas, rowsList.map((row) {
        return LocalExcelDatasCompanion.insert(
          fName: row.mp[1],
          lName: row.mp[2],
          location: row.mp[3],
          phoneNumber: row.mp[4],
          age: row.mp[5],
        );
      }), mode: InsertMode.insertOrReplace);
    });
  }

  Future<List<LocalExcelData>> getAllLocalExcelData() {
    return select(localExcelDatas).get();
  }

  Stream<List<LocalExcelData>> watchAllLocalExcelData() {
    return select(localExcelDatas).watch();
  }
}
