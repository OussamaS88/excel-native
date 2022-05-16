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

class LocalExcelData extends DataClass implements Insertable<LocalExcelData> {
  final int id;
  final String fName;
  final String lName;
  final String location;
  final String phoneNumber;
  final int age;
  LocalExcelData(
      {required this.id,
      required this.fName,
      required this.lName,
      required this.location,
      required this.phoneNumber,
      required this.age});
  factory LocalExcelData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return LocalExcelData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      fName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}f_name'])!,
      lName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}l_name'])!,
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location'])!,
      phoneNumber: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_number'])!,
      age: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}age'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['f_name'] = Variable<String>(fName);
    map['l_name'] = Variable<String>(lName);
    map['location'] = Variable<String>(location);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['age'] = Variable<int>(age);
    return map;
  }

  LocalExcelDatasCompanion toCompanion(bool nullToAbsent) {
    return LocalExcelDatasCompanion(
      id: Value(id),
      fName: Value(fName),
      lName: Value(lName),
      location: Value(location),
      phoneNumber: Value(phoneNumber),
      age: Value(age),
    );
  }

  factory LocalExcelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalExcelData(
      id: serializer.fromJson<int>(json['id']),
      fName: serializer.fromJson<String>(json['fName']),
      lName: serializer.fromJson<String>(json['lName']),
      location: serializer.fromJson<String>(json['location']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      age: serializer.fromJson<int>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fName': serializer.toJson<String>(fName),
      'lName': serializer.toJson<String>(lName),
      'location': serializer.toJson<String>(location),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'age': serializer.toJson<int>(age),
    };
  }

  LocalExcelData copyWith(
          {int? id,
          String? fName,
          String? lName,
          String? location,
          String? phoneNumber,
          int? age}) =>
      LocalExcelData(
        id: id ?? this.id,
        fName: fName ?? this.fName,
        lName: lName ?? this.lName,
        location: location ?? this.location,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        age: age ?? this.age,
      );
  @override
  String toString() {
    return (StringBuffer('LocalExcelData(')
          ..write('id: $id, ')
          ..write('fName: $fName, ')
          ..write('lName: $lName, ')
          ..write('location: $location, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fName, lName, location, phoneNumber, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalExcelData &&
          other.id == this.id &&
          other.fName == this.fName &&
          other.lName == this.lName &&
          other.location == this.location &&
          other.phoneNumber == this.phoneNumber &&
          other.age == this.age);
}

class LocalExcelDatasCompanion extends UpdateCompanion<LocalExcelData> {
  final Value<int> id;
  final Value<String> fName;
  final Value<String> lName;
  final Value<String> location;
  final Value<String> phoneNumber;
  final Value<int> age;
  const LocalExcelDatasCompanion({
    this.id = const Value.absent(),
    this.fName = const Value.absent(),
    this.lName = const Value.absent(),
    this.location = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.age = const Value.absent(),
  });
  LocalExcelDatasCompanion.insert({
    this.id = const Value.absent(),
    required String fName,
    required String lName,
    required String location,
    required String phoneNumber,
    required int age,
  })  : fName = Value(fName),
        lName = Value(lName),
        location = Value(location),
        phoneNumber = Value(phoneNumber),
        age = Value(age);
  static Insertable<LocalExcelData> custom({
    Expression<int>? id,
    Expression<String>? fName,
    Expression<String>? lName,
    Expression<String>? location,
    Expression<String>? phoneNumber,
    Expression<int>? age,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fName != null) 'f_name': fName,
      if (lName != null) 'l_name': lName,
      if (location != null) 'location': location,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (age != null) 'age': age,
    });
  }

  LocalExcelDatasCompanion copyWith(
      {Value<int>? id,
      Value<String>? fName,
      Value<String>? lName,
      Value<String>? location,
      Value<String>? phoneNumber,
      Value<int>? age}) {
    return LocalExcelDatasCompanion(
      id: id ?? this.id,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      location: location ?? this.location,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      age: age ?? this.age,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fName.present) {
      map['f_name'] = Variable<String>(fName.value);
    }
    if (lName.present) {
      map['l_name'] = Variable<String>(lName.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalExcelDatasCompanion(')
          ..write('id: $id, ')
          ..write('fName: $fName, ')
          ..write('lName: $lName, ')
          ..write('location: $location, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }
}

class $LocalExcelDatasTable extends LocalExcelDatas
    with TableInfo<$LocalExcelDatasTable, LocalExcelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalExcelDatasTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _fNameMeta = const VerificationMeta('fName');
  @override
  late final GeneratedColumn<String?> fName = GeneratedColumn<String?>(
      'f_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _lNameMeta = const VerificationMeta('lName');
  @override
  late final GeneratedColumn<String?> lName = GeneratedColumn<String?>(
      'l_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  @override
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String?> phoneNumber = GeneratedColumn<String?>(
      'phone_number', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int?> age = GeneratedColumn<int?>(
      'age', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, fName, lName, location, phoneNumber, age];
  @override
  String get aliasedName => _alias ?? 'local_excel_datas';
  @override
  String get actualTableName => 'local_excel_datas';
  @override
  VerificationContext validateIntegrity(Insertable<LocalExcelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('f_name')) {
      context.handle(
          _fNameMeta, fName.isAcceptableOrUnknown(data['f_name']!, _fNameMeta));
    } else if (isInserting) {
      context.missing(_fNameMeta);
    }
    if (data.containsKey('l_name')) {
      context.handle(
          _lNameMeta, lName.isAcceptableOrUnknown(data['l_name']!, _lNameMeta));
    } else if (isInserting) {
      context.missing(_lNameMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalExcelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return LocalExcelData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LocalExcelDatasTable createAlias(String alias) {
    return $LocalExcelDatasTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $LocalAuthUsersTable localAuthUsers = $LocalAuthUsersTable(this);
  late final $LocalExcelDatasTable localExcelDatas =
      $LocalExcelDatasTable(this);
  late final LocalAuthUserDao localAuthUserDao =
      LocalAuthUserDao(this as MyDatabase);
  late final LocalExcelDataDao localExcelDataDao =
      LocalExcelDataDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [localAuthUsers, localExcelDatas];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$LocalExcelDataDaoMixin on DatabaseAccessor<MyDatabase> {
  $LocalExcelDatasTable get localExcelDatas => attachedDatabase.localExcelDatas;
}
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
