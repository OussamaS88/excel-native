part of './drift_db.dart';

class Familys extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tentId => integer()();
  TextColumn get nameEng => text()();
  TextColumn get nameAr => text()();
  TextColumn get phoneNum => text()();
  TextColumn get wfpAid => text()();
  TextColumn get unhcr => text()();
  IntColumn get peopleCount => integer()();
  IntColumn get womenCount => integer()();
  IntColumn get childrenCount => integer()();
  IntColumn get elderlyCount => integer()();
  IntColumn get casesCount => integer()();
  IntColumn get educationCount => integer()();
  IntColumn get employedCount => integer()();
  IntColumn get unemployedCount => integer()();
  TextColumn get notes1 => text()();
  TextColumn get notes2 => text()();
  TextColumn get location => text()
      .customConstraint("REFERENCES locations(location)")
      .withLength(min: 2, max: 100)();
  TextColumn get region => text()
      .customConstraint("REFERENCES regions(region)")
      .withLength(min: 2, max: 100)();
  IntColumn get campId => integer().customConstraint("REFERENCES camps(id)")();
}

@DriftAccessor(tables: [Familys, Locations, Regions, Tents, Camps])
class FamilyDao extends DatabaseAccessor<MyDatabase> with _$FamilyDaoMixin {
  final MyDatabase db;
  FamilyDao(this.db) : super(db);

  // FROM FAMILY
  Future insertFamily({required FamilysCompanion familysCompanion}) =>
      into(familys).insert(familysCompanion, mode: InsertMode.insertOrIgnore);

  Future<Family?> getSingleFamilyFromId({required int pId}) =>
      (select(familys)..where((tbl) => tbl.id.equals(pId))).getSingleOrNull();

  Future<List<Family>> getAllFamilys() => select(familys).get();

  // FROM CAMP
  Future<List<Family>> getAllFamilysFromCamp({required Camp camp}) =>
      (select(familys)..where((tbl) => tbl.campId.equals(camp.id))).get();

  Stream<List<Family>> watchAllFamilysFromCamp({required Camp camp}) =>
      (select(familys)..where((tbl) => tbl.campId.equals(camp.id))).watch();

  // FROM LOCATION
  Future<List<Family>> getAllFamilysFromLocation(
          {required Location location}) =>
      (select(familys)..where((tbl) => tbl.location.equals(location.location)))
          .get();

  Stream<List<Family>> watchAllFamilysFromLocation(
          {required Location location}) =>
      (select(familys)..where((tbl) => tbl.location.equals(location.location)))
          .watch();

  // FROM REGION
  Future<List<Family>> getAllFamilysFromRegion({required Region region}) =>
      (select(familys)..where((tbl) => tbl.region.equals(region.region))).get();

  Stream<List<Family>> watchAllFamilysFromLRegion({required Region region}) =>
      (select(familys)..where((tbl) => tbl.region.equals(region.region)))
          .watch();
}
