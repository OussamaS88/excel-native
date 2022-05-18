part of './drift_db.dart';

class Familys extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get location => text().withLength(min: 2, max: 100)();
  IntColumn get campId => integer().customConstraint("REFERENCES camps(id)")();
  IntColumn get tentId => integer().customConstraint("REFERENCES tents(id)")();
  TextColumn get phoneNum => text()();
  TextColumn get nameEng => text()();
  IntColumn get peopleCount => integer()();
  IntColumn get womenCount => integer()();
  IntColumn get childrenCount => integer()();
  IntColumn get casesCount => integer()();
}

@DriftAccessor(tables: [Familys])
class FamilyDao extends DatabaseAccessor<MyDatabase> with _$FamilyDaoMixin {
  final MyDatabase db;
  FamilyDao(this.db) : super(db);
}
