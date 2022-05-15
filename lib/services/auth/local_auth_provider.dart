import 'package:excel_native/services/auth/auth_provider.dart';
import 'package:excel_native/services/auth/auth_user.dart';

class LocalAuthProvider implements AuthProvider {
  // var db;
  @override
  AuthUser? get currentUser => AuthUser.empty;

  @override
  Future<void> initialize() async{
  }

  @override
  Future<AuthUser> logIn(
      {required String email, required String password}) async {
    var a = AuthUser.empty;
    return a;
  }

  @override
  Future<void> logOut() async {
  }

  @override
  Future<AuthUser> register(
      {required String email,
      required String password,
      required String username}) async {
    var a =  AuthUser.empty;
    return a;
  }

  @override
  Stream<AuthUser> get user => const Stream.empty();
}
