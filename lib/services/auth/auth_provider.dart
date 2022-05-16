import 'package:excel_native/services/auth/auth_user.dart';
import 'package:excel_native/services/auth/drift_db.dart';

abstract class AuthProvider {
  Stream<AuthUser> get user;

  Future<void> initialize();

  AuthUser? get currentUser;

  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  Future<AuthUser> register({
    required String email,
    required String password,
    required String username,
  });

  Future<void> logOut();

}
