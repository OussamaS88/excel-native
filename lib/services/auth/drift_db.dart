import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:path_provider/path_provider.dart';
import 'package:encrypt/encrypt.dart';
import 'package:path/path.dart' as p;

part 'drift_db.g.dart';

class LocalExcelData extends Table{
  IntColumn get id => integer().autoIncrement()();
}

class LocalAuthUsers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text().withLength(min: 4, max: 100)();
  TextColumn get password => text().withLength(min: 4, max: 100)();
}

@DriftDatabase(tables: [LocalAuthUsers], daos: [LocalAuthUserDao])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [
  LocalAuthUsers
], queries: {
  'badLocalAuthUsersGenerated':
      "SELECT * FROM local_auth_users WHERE id > 5 ORDER BY id;"
})
class LocalAuthUserDao extends DatabaseAccessor<MyDatabase>
    with _$LocalAuthUserDaoMixin {
  final MyDatabase db;
  LocalAuthUserDao(this.db) : super(db);

  Future<LocalAuthUser> authenticate(
      {required String email, required String password}) {
    return (select(localAuthUsers)
          ..where((tbl) => tbl.email.equals(email))
          ..where((tbl) => tbl.password.equals(password)))
        .getSingle();
  }

  Future<List<LocalAuthUser>> getAllLocalAuthUsers() =>
      select(localAuthUsers).get();
  Stream<List<LocalAuthUser>> watchAllLocalAuthUsers() {
    return (select(localAuthUsers)
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.id, mode: OrderingMode.asc),
          ]))
        .watch();
  }

  Future insertLocalAuthUser(LocalAuthUsersCompanion localAuthUser) =>
      into(localAuthUsers)
          .insert(localAuthUser, mode: InsertMode.insertOrIgnore);
  Future updateLocalAuthUse(Insertable<LocalAuthUser> localAuthUser) =>
      update(localAuthUsers).replace(localAuthUser);
  Future deleteLocalAuthUse(Insertable<LocalAuthUser> localAuthUser) =>
      delete(localAuthUsers).delete(localAuthUser);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    var pathToExe = Platform.resolvedExecutable;
    pathToExe = pathToExe.substring(0, pathToExe.indexOf("excel_native.exe"));
    // final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(pathToExe, 'config'));
    print(pathToExe);
    print(file);
    // print("loading file");
    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      final blob = await rootBundle.load('assets/db.sqlite');
      // print("using local");
      final buffer = blob.buffer;
      await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }
    // print("loaded file");
    // print(file.absolute);
    return NativeDatabase(file);
  });
}
