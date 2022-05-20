import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:excel_api/excel_api.dart';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:path_provider/path_provider.dart';
// import 'package:encrypt/encrypt.dart';
import 'package:path/path.dart' as p;

part 'drift_db.g.dart';
part 'drift_tent.dart';
part 'drift_local_excel_data.dart';
part 'drift_local_auth_users.dart';
part 'drift_camp.dart';
part 'drift_family.dart';
part 'drift_location.dart';
part 'drift_region.dart';

class TentsWithCamps {
  final Tent tent;
  final Camp camp;

  TentsWithCamps({required this.tent, required this.camp});
}

class CampsWithLocations {
  final Camp camp;
  final Location location;

  CampsWithLocations({required this.location, required this.camp});
}

@DriftDatabase(tables: [
  LocalAuthUsers,
  LocalExcelDatas,
  Camps,
  Tents,
  Familys,
  Locations,
  Regions
], daos: [
  LocalAuthUserDao,
  LocalExcelDataDao,
  CampDao,
  TentDao,
  FamilyDao,
  LocationDao,
  RegionDao
])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
  @override
  MigrationStrategy get migration =>
      MigrationStrategy(beforeOpen: (details) async {
        await customStatement("PRAGMA foreign_keys on");
      });
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    var pathToExe = Platform.resolvedExecutable;
    pathToExe = pathToExe.substring(0, pathToExe.indexOf("excel_native.exe"));
    final file = File(p.join(pathToExe, 'config'));
    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      // final blob = await rootBundle.load('assets/db.sqliteV2');
      final blob = await rootBundle.load('assets/OLDdb.sqlite');
      final buffer = blob.buffer;
      await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }
    return NativeDatabase(file);
  });
}
