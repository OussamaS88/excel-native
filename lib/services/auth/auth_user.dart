import 'package:equatable/equatable.dart';
import 'package:excel_native/services/auth/drift_db.dart';
// import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

@immutable
class AuthUser extends Equatable {
  final String id;
  final String email;
  const AuthUser({required this.id, required this.email});

  // factory AuthUser.fromFirebase(User user) => AuthUser(
  //       id: user.uid,
  //     );
  factory AuthUser.fromLocalAuthUser(LocalAuthUser user) =>
      AuthUser(id: user.id.toString(), email: user.email);

  static const empty = AuthUser(id: '', email: '');

  bool get isEmpty => this == AuthUser.empty;

  @override
  List<Object?> get props => [id];
}
