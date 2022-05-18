part of './drift_db.dart';

class Tents extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get campId => integer().customConstraint("REFERENCES camps(id)")();
}

@DriftAccessor(tables: [Tents, Camps])
class TentDao extends DatabaseAccessor<MyDatabase> with _$TentDaoMixin {
  final MyDatabase db;
  TentDao(this.db) : super(db);

  Future<List<TentsWithCamps>> getAllTentsWithCamps() => (select(tents))
      .join([leftOuterJoin(camps, tents.id.equalsExp(tents.campId))])
      .get()
      .then((value) => value.map((e) => TentsWithCamps(
          tent: e.readTable(tents),
          camp: e.readTable(camps))).toList());

  Future insertTent(TentsCompanion tentsCompanion) =>
      into(tents).insert(tentsCompanion, mode: InsertMode.insertOrIgnore);

  Future<Tent?> getSingleTentFromId({required int pId}) =>
      (select(tents)..where((tbl) => tbl.id.equals(pId))).getSingleOrNull();

  Future<Tent?> getSingleTentFromCampId({required int pCId}) =>
      (select(tents)..where((tbl) => tbl.campId.equals(pCId)))
          .getSingleOrNull();

  Future<List<Tent>> getAllTents() => select(tents).get();
}
