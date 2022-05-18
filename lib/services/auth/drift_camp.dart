part of './drift_db.dart';


class Camps extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get location => text().withLength(min: 2, max: 100)();
}

@DriftAccessor(tables: [Camps])
class CampDao extends DatabaseAccessor<MyDatabase> with _$CampDaoMixin {
  final MyDatabase db;
  CampDao(this.db) : super(db);
  Future insertCamp(CampsCompanion campsCompanion) =>
      into(camps).insert(campsCompanion, mode: InsertMode.insertOrIgnore);

  Future<Camp?> getSingleCampFromId({required int pId}) =>
      (select(camps)..where((tbl) => tbl.id.equals(pId))).getSingleOrNull();

  Future<Camp?> getSingleCampFromLocation({required String pLocation}) =>
      (select(camps)..where((tbl) => tbl.location.equals(pLocation)))
          .getSingleOrNull();

  Future<List<Camp>> getAllCamps() => select(camps).get();
}