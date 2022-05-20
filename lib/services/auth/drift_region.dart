part of './drift_db.dart';

class Regions extends Table {
  TextColumn get region => text().withLength(min: 2, max: 100)();
  TextColumn get location => text()
      .customConstraint('NOT NULL REFERENCES locations (location)')
      .withLength(min: 2, max: 100)();
  @override
  Set<Column> get primaryKey => {region};
}

@DriftAccessor(tables: [Regions, Locations])
class RegionDao extends DatabaseAccessor<MyDatabase> with _$RegionDaoMixin {
  final MyDatabase db;
  RegionDao(this.db) : super(db);

  Future<List<Region>> getAllRegionsFromLocation({required String pLocation}) =>
      (select(regions)..where((tbl) => tbl.location.equals(pLocation))).get();

      
  Stream<List<Region>> watchAllRegionsFromLocation({required String pLocation}) =>
      (select(regions)..where((tbl) => tbl.location.equals(pLocation))).watch();

  Future<List<Region>> getAllRegions() => select(regions).get();

  Future<int> insertRegion({required RegionsCompanion regionsCompanion}) =>
      into(regions).insert(regionsCompanion);
}
