part of './drift_db.dart';

class Camps extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get location => text()
      .customConstraint('NOT NULL REFERENCES locations (location)')
      .withLength(min: 2, max: 100)();
  TextColumn get region => text()
      .customConstraint('NOT NULL REFERENCES regions (region)')
      .withLength(min: 2, max: 100)();
  TextColumn get name => text().withLength(min: 2, max: 100)();
}

@DriftAccessor(tables: [Camps, Locations, Regions])
class CampDao extends DatabaseAccessor<MyDatabase> with _$CampDaoMixin {
  final MyDatabase db;
  CampDao(this.db) : super(db);

  Future<List<CampsWithLocations>> getAllCampsWithLocations() => (select(camps))
      .join([leftOuterJoin(locations, camps.id.equalsExp(camps.id))])
      .get()
      .then((value) => value
          .map((e) => CampsWithLocations(
              camp: e.readTable(camps), location: e.readTable(locations)))
          .toList());

  Future insertCamp(CampsCompanion campsCompanion) =>
      into(camps).insert(campsCompanion, mode: InsertMode.insertOrIgnore);

  Future<Camp?> getSingleCampFromId({required int pId}) =>
      (select(camps)..where((tbl) => tbl.id.equals(pId))).getSingleOrNull();

  Future<Camp?> getSingleCampFromLocation({required String pLocation}) =>
      (select(camps)..where((tbl) => tbl.location.equals(pLocation)))
          .getSingleOrNull();

  Future<List<Camp>> getAllCamps() => select(camps).get();

  Future<List<Camp>> getAllCampsFromLocation({required String pLocation}) =>
      (select(camps)..where((tbl) => tbl.location.equals(pLocation))).get();

  Future<List<Camp>> getAllCampsFromRegion({required String pRegion}) =>
      (select(camps)..where((tbl) => tbl.region.equals(pRegion))).get();

  Stream<List<Camp>> watchAllCampsFromRegion({required String pRegion}) =>
      (select(camps)..where((tbl) => tbl.region.equals(pRegion))).watch();

  Stream<List<Camp>> watchAllCampsFromLocation({required String pLocation}) =>
      (select(camps)..where((tbl) => tbl.location.equals(pLocation))).watch();
}
