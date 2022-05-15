import 'dart:async';

import 'package:excel_native/services/auth/auth_provider.dart';
import 'package:excel_native/services/auth/auth_user.dart';
import 'package:excel_native/services/auth/drift_db.dart';

class LocalAuthProvider implements AuthProvider {
  late MyDatabase db;
  final _controller = StreamController<AuthUser>();
  @override
  AuthUser? get currentUser => AuthUser.empty;

  @override
  Stream<AuthUser> get user async* {
    yield AuthUser.empty;
    yield* _controller.stream;
  }

  @override
  Future<void> initialize() async {
    db = MyDatabase();
  }

  @override
  Future<AuthUser> logIn(
      {required String email, required String password}) async {
    var tempUser = AuthUser.empty;
    var k = await db.localAuthUserDao
        .authenticate(email: email, password: password)
        .onError((error, stackTrace) =>
            LocalAuthUser(id: -1, email: '', password: ''));
    if (k.id != -1) {
      tempUser = AuthUser.fromLocalAuthUser(k);
      _controller.add(tempUser);
    }
    return tempUser;
  }

  @override
  Future<void> logOut() async {
    _controller.add(AuthUser.empty);
  }

  @override
  Future<AuthUser> register(
      {required String email,
      required String password,
      required String username}) async {
    var a = AuthUser.empty;
    return a;
  }
}
