// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class LocalAuthUser extends DataClass implements Insertable<LocalAuthUser> {
  final int id;
  final String email;
  final String password;
  LocalAuthUser(
      {required this.id, required this.email, required this.password});
  factory LocalAuthUser.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return LocalAuthUser(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    return map;
  }

  LocalAuthUsersCompanion toCompanion(bool nullToAbsent) {
    return LocalAuthUsersCompanion(
      id: Value(id),
      email: Value(email),
      password: Value(password),
    );
  }

  factory LocalAuthUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalAuthUser(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
    };
  }

  LocalAuthUser copyWith({int? id, String? email, String? password}) =>
      LocalAuthUser(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('LocalAuthUser(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalAuthUser &&
          other.id == this.id &&
          other.email == this.email &&
          other.password == this.password);
}

class LocalAuthUsersCompanion extends UpdateCompanion<LocalAuthUser> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> password;
  const LocalAuthUsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
  });
  LocalAuthUsersCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    required String password,
  })  : email = Value(email),
        password = Value(password);
  static Insertable<LocalAuthUser> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    });
  }

  LocalAuthUsersCompanion copyWith(
      {Value<int>? id, Value<String>? email, Value<String>? password}) {
    return LocalAuthUsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalAuthUsersCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $LocalAuthUsersTable extends LocalAuthUsers
    with TableInfo<$LocalAuthUsersTable, LocalAuthUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalAuthUsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, email, password];
  @override
  String get aliasedName => _alias ?? 'local_auth_users';
  @override
  String get actualTableName => 'local_auth_users';
  @override
  VerificationContext validateIntegrity(Insertable<LocalAuthUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalAuthUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    return LocalAuthUser.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LocalAuthUsersTable createAlias(String alias) {
    return $LocalAuthUsersTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $LocalAuthUsersTable localAuthUsers = $LocalAuthUsersTable(this);
  late final LocalAuthUserDao localAuthUserDao =
      LocalAuthUserDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [localAuthUsers];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$LocalAuthUserDaoMixin on DatabaseAccessor<MyDatabase> {
  $LocalAuthUsersTable get localAuthUsers => attachedDatabase.localAuthUsers;
  Selectable<LocalAuthUser> badLocalAuthUsersGenerated() {
    return customSelect(
        'SELECT * FROM local_auth_users WHERE id > 5 ORDER BY id;',
        variables: [],
        readsFrom: {
          localAuthUsers,
        }).map(localAuthUsers.mapFromRow);
  }
}
