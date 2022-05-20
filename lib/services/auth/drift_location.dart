part of './drift_db.dart';

class Locations extends Table {
  TextColumn get location => text().withLength(min: 2, max: 100)();
  @override
  Set<Column> get primaryKey => {location};
}

@DriftAccessor(tables: [Locations])
class LocationDao extends DatabaseAccessor<MyDatabase> with _$LocationDaoMixin {
  final MyDatabase db;
  LocationDao(this.db) : super(db);

  Future<List<Location>> getAllLocations() => select(locations).get();
  
  Stream<List<Location>> watchAllLocations() => select(locations).watch();

  Future createLocation(LocationsCompanion locationsCompanion) =>
      into(locations).insert(locationsCompanion);
}
