part of './drift_db.dart';

class LocalAuthUsers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text().withLength(min: 4, max: 100)();
  TextColumn get password => text().withLength(min: 4, max: 100)();
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
