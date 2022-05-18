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

class Camp extends DataClass implements Insertable<Camp> {
  final int id;
  final String location;
  final String name;
  Camp({required this.id, required this.location, required this.name});
  factory Camp.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Camp(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['location'] = Variable<String>(location);
    map['name'] = Variable<String>(name);
    return map;
  }

  CampsCompanion toCompanion(bool nullToAbsent) {
    return CampsCompanion(
      id: Value(id),
      location: Value(location),
      name: Value(name),
    );
  }

  factory Camp.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Camp(
      id: serializer.fromJson<int>(json['id']),
      location: serializer.fromJson<String>(json['location']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'location': serializer.toJson<String>(location),
      'name': serializer.toJson<String>(name),
    };
  }

  Camp copyWith({int? id, String? location, String? name}) => Camp(
        id: id ?? this.id,
        location: location ?? this.location,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Camp(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, location, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Camp &&
          other.id == this.id &&
          other.location == this.location &&
          other.name == this.name);
}

class CampsCompanion extends UpdateCompanion<Camp> {
  final Value<int> id;
  final Value<String> location;
  final Value<String> name;
  const CampsCompanion({
    this.id = const Value.absent(),
    this.location = const Value.absent(),
    this.name = const Value.absent(),
  });
  CampsCompanion.insert({
    this.id = const Value.absent(),
    required String location,
    required String name,
  })  : location = Value(location),
        name = Value(name);
  static Insertable<Camp> custom({
    Expression<int>? id,
    Expression<String>? location,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
    });
  }

  CampsCompanion copyWith(
      {Value<int>? id, Value<String>? location, Value<String>? name}) {
    return CampsCompanion(
      id: id ?? this.id,
      location: location ?? this.location,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CampsCompanion(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CampsTable extends Camps with TableInfo<$CampsTable, Camp> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CampsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  @override
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES locations (name)');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, location, name];
  @override
  String get aliasedName => _alias ?? 'camps';
  @override
  String get actualTableName => 'camps';
  @override
  VerificationContext validateIntegrity(Insertable<Camp> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Camp map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Camp.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CampsTable createAlias(String alias) {
    return $CampsTable(attachedDatabase, alias);
  }
}

class Tent extends DataClass implements Insertable<Tent> {
  final int id;
  final int campId;
  Tent({required this.id, required this.campId});
  factory Tent.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Tent(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      campId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}camp_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['camp_id'] = Variable<int>(campId);
    return map;
  }

  TentsCompanion toCompanion(bool nullToAbsent) {
    return TentsCompanion(
      id: Value(id),
      campId: Value(campId),
    );
  }

  factory Tent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tent(
      id: serializer.fromJson<int>(json['id']),
      campId: serializer.fromJson<int>(json['campId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'campId': serializer.toJson<int>(campId),
    };
  }

  Tent copyWith({int? id, int? campId}) => Tent(
        id: id ?? this.id,
        campId: campId ?? this.campId,
      );
  @override
  String toString() {
    return (StringBuffer('Tent(')
          ..write('id: $id, ')
          ..write('campId: $campId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, campId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tent && other.id == this.id && other.campId == this.campId);
}

class TentsCompanion extends UpdateCompanion<Tent> {
  final Value<int> id;
  final Value<int> campId;
  const TentsCompanion({
    this.id = const Value.absent(),
    this.campId = const Value.absent(),
  });
  TentsCompanion.insert({
    this.id = const Value.absent(),
    required int campId,
  }) : campId = Value(campId);
  static Insertable<Tent> custom({
    Expression<int>? id,
    Expression<int>? campId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (campId != null) 'camp_id': campId,
    });
  }

  TentsCompanion copyWith({Value<int>? id, Value<int>? campId}) {
    return TentsCompanion(
      id: id ?? this.id,
      campId: campId ?? this.campId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (campId.present) {
      map['camp_id'] = Variable<int>(campId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TentsCompanion(')
          ..write('id: $id, ')
          ..write('campId: $campId')
          ..write(')'))
        .toString();
  }
}

class $TentsTable extends Tents with TableInfo<$TentsTable, Tent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TentsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _campIdMeta = const VerificationMeta('campId');
  @override
  late final GeneratedColumn<int?> campId = GeneratedColumn<int?>(
      'camp_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES camps(id)');
  @override
  List<GeneratedColumn> get $columns => [id, campId];
  @override
  String get aliasedName => _alias ?? 'tents';
  @override
  String get actualTableName => 'tents';
  @override
  VerificationContext validateIntegrity(Insertable<Tent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('camp_id')) {
      context.handle(_campIdMeta,
          campId.isAcceptableOrUnknown(data['camp_id']!, _campIdMeta));
    } else if (isInserting) {
      context.missing(_campIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tent map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Tent.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TentsTable createAlias(String alias) {
    return $TentsTable(attachedDatabase, alias);
  }
}

class Family extends DataClass implements Insertable<Family> {
  final int id;
  final String location;
  final int campId;
  final int tentId;
  final String phoneNum;
  final String nameEng;
  final int peopleCount;
  final int womenCount;
  final int childrenCount;
  final int casesCount;
  Family(
      {required this.id,
      required this.location,
      required this.campId,
      required this.tentId,
      required this.phoneNum,
      required this.nameEng,
      required this.peopleCount,
      required this.womenCount,
      required this.childrenCount,
      required this.casesCount});
  factory Family.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Family(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location'])!,
      campId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}camp_id'])!,
      tentId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tent_id'])!,
      phoneNum: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_num'])!,
      nameEng: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_eng'])!,
      peopleCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}people_count'])!,
      womenCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}women_count'])!,
      childrenCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}children_count'])!,
      casesCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cases_count'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['location'] = Variable<String>(location);
    map['camp_id'] = Variable<int>(campId);
    map['tent_id'] = Variable<int>(tentId);
    map['phone_num'] = Variable<String>(phoneNum);
    map['name_eng'] = Variable<String>(nameEng);
    map['people_count'] = Variable<int>(peopleCount);
    map['women_count'] = Variable<int>(womenCount);
    map['children_count'] = Variable<int>(childrenCount);
    map['cases_count'] = Variable<int>(casesCount);
    return map;
  }

  FamilysCompanion toCompanion(bool nullToAbsent) {
    return FamilysCompanion(
      id: Value(id),
      location: Value(location),
      campId: Value(campId),
      tentId: Value(tentId),
      phoneNum: Value(phoneNum),
      nameEng: Value(nameEng),
      peopleCount: Value(peopleCount),
      womenCount: Value(womenCount),
      childrenCount: Value(childrenCount),
      casesCount: Value(casesCount),
    );
  }

  factory Family.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Family(
      id: serializer.fromJson<int>(json['id']),
      location: serializer.fromJson<String>(json['location']),
      campId: serializer.fromJson<int>(json['campId']),
      tentId: serializer.fromJson<int>(json['tentId']),
      phoneNum: serializer.fromJson<String>(json['phoneNum']),
      nameEng: serializer.fromJson<String>(json['nameEng']),
      peopleCount: serializer.fromJson<int>(json['peopleCount']),
      womenCount: serializer.fromJson<int>(json['womenCount']),
      childrenCount: serializer.fromJson<int>(json['childrenCount']),
      casesCount: serializer.fromJson<int>(json['casesCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'location': serializer.toJson<String>(location),
      'campId': serializer.toJson<int>(campId),
      'tentId': serializer.toJson<int>(tentId),
      'phoneNum': serializer.toJson<String>(phoneNum),
      'nameEng': serializer.toJson<String>(nameEng),
      'peopleCount': serializer.toJson<int>(peopleCount),
      'womenCount': serializer.toJson<int>(womenCount),
      'childrenCount': serializer.toJson<int>(childrenCount),
      'casesCount': serializer.toJson<int>(casesCount),
    };
  }

  Family copyWith(
          {int? id,
          String? location,
          int? campId,
          int? tentId,
          String? phoneNum,
          String? nameEng,
          int? peopleCount,
          int? womenCount,
          int? childrenCount,
          int? casesCount}) =>
      Family(
        id: id ?? this.id,
        location: location ?? this.location,
        campId: campId ?? this.campId,
        tentId: tentId ?? this.tentId,
        phoneNum: phoneNum ?? this.phoneNum,
        nameEng: nameEng ?? this.nameEng,
        peopleCount: peopleCount ?? this.peopleCount,
        womenCount: womenCount ?? this.womenCount,
        childrenCount: childrenCount ?? this.childrenCount,
        casesCount: casesCount ?? this.casesCount,
      );
  @override
  String toString() {
    return (StringBuffer('Family(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('campId: $campId, ')
          ..write('tentId: $tentId, ')
          ..write('phoneNum: $phoneNum, ')
          ..write('nameEng: $nameEng, ')
          ..write('peopleCount: $peopleCount, ')
          ..write('womenCount: $womenCount, ')
          ..write('childrenCount: $childrenCount, ')
          ..write('casesCount: $casesCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, location, campId, tentId, phoneNum,
      nameEng, peopleCount, womenCount, childrenCount, casesCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Family &&
          other.id == this.id &&
          other.location == this.location &&
          other.campId == this.campId &&
          other.tentId == this.tentId &&
          other.phoneNum == this.phoneNum &&
          other.nameEng == this.nameEng &&
          other.peopleCount == this.peopleCount &&
          other.womenCount == this.womenCount &&
          other.childrenCount == this.childrenCount &&
          other.casesCount == this.casesCount);
}

class FamilysCompanion extends UpdateCompanion<Family> {
  final Value<int> id;
  final Value<String> location;
  final Value<int> campId;
  final Value<int> tentId;
  final Value<String> phoneNum;
  final Value<String> nameEng;
  final Value<int> peopleCount;
  final Value<int> womenCount;
  final Value<int> childrenCount;
  final Value<int> casesCount;
  const FamilysCompanion({
    this.id = const Value.absent(),
    this.location = const Value.absent(),
    this.campId = const Value.absent(),
    this.tentId = const Value.absent(),
    this.phoneNum = const Value.absent(),
    this.nameEng = const Value.absent(),
    this.peopleCount = const Value.absent(),
    this.womenCount = const Value.absent(),
    this.childrenCount = const Value.absent(),
    this.casesCount = const Value.absent(),
  });
  FamilysCompanion.insert({
    this.id = const Value.absent(),
    required String location,
    required int campId,
    required int tentId,
    required String phoneNum,
    required String nameEng,
    required int peopleCount,
    required int womenCount,
    required int childrenCount,
    required int casesCount,
  })  : location = Value(location),
        campId = Value(campId),
        tentId = Value(tentId),
        phoneNum = Value(phoneNum),
        nameEng = Value(nameEng),
        peopleCount = Value(peopleCount),
        womenCount = Value(womenCount),
        childrenCount = Value(childrenCount),
        casesCount = Value(casesCount);
  static Insertable<Family> custom({
    Expression<int>? id,
    Expression<String>? location,
    Expression<int>? campId,
    Expression<int>? tentId,
    Expression<String>? phoneNum,
    Expression<String>? nameEng,
    Expression<int>? peopleCount,
    Expression<int>? womenCount,
    Expression<int>? childrenCount,
    Expression<int>? casesCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (location != null) 'location': location,
      if (campId != null) 'camp_id': campId,
      if (tentId != null) 'tent_id': tentId,
      if (phoneNum != null) 'phone_num': phoneNum,
      if (nameEng != null) 'name_eng': nameEng,
      if (peopleCount != null) 'people_count': peopleCount,
      if (womenCount != null) 'women_count': womenCount,
      if (childrenCount != null) 'children_count': childrenCount,
      if (casesCount != null) 'cases_count': casesCount,
    });
  }

  FamilysCompanion copyWith(
      {Value<int>? id,
      Value<String>? location,
      Value<int>? campId,
      Value<int>? tentId,
      Value<String>? phoneNum,
      Value<String>? nameEng,
      Value<int>? peopleCount,
      Value<int>? womenCount,
      Value<int>? childrenCount,
      Value<int>? casesCount}) {
    return FamilysCompanion(
      id: id ?? this.id,
      location: location ?? this.location,
      campId: campId ?? this.campId,
      tentId: tentId ?? this.tentId,
      phoneNum: phoneNum ?? this.phoneNum,
      nameEng: nameEng ?? this.nameEng,
      peopleCount: peopleCount ?? this.peopleCount,
      womenCount: womenCount ?? this.womenCount,
      childrenCount: childrenCount ?? this.childrenCount,
      casesCount: casesCount ?? this.casesCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (campId.present) {
      map['camp_id'] = Variable<int>(campId.value);
    }
    if (tentId.present) {
      map['tent_id'] = Variable<int>(tentId.value);
    }
    if (phoneNum.present) {
      map['phone_num'] = Variable<String>(phoneNum.value);
    }
    if (nameEng.present) {
      map['name_eng'] = Variable<String>(nameEng.value);
    }
    if (peopleCount.present) {
      map['people_count'] = Variable<int>(peopleCount.value);
    }
    if (womenCount.present) {
      map['women_count'] = Variable<int>(womenCount.value);
    }
    if (childrenCount.present) {
      map['children_count'] = Variable<int>(childrenCount.value);
    }
    if (casesCount.present) {
      map['cases_count'] = Variable<int>(casesCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FamilysCompanion(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('campId: $campId, ')
          ..write('tentId: $tentId, ')
          ..write('phoneNum: $phoneNum, ')
          ..write('nameEng: $nameEng, ')
          ..write('peopleCount: $peopleCount, ')
          ..write('womenCount: $womenCount, ')
          ..write('childrenCount: $childrenCount, ')
          ..write('casesCount: $casesCount')
          ..write(')'))
        .toString();
  }
}

class $FamilysTable extends Familys with TableInfo<$FamilysTable, Family> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FamilysTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  @override
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _campIdMeta = const VerificationMeta('campId');
  @override
  late final GeneratedColumn<int?> campId = GeneratedColumn<int?>(
      'camp_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES camps(id)');
  final VerificationMeta _tentIdMeta = const VerificationMeta('tentId');
  @override
  late final GeneratedColumn<int?> tentId = GeneratedColumn<int?>(
      'tent_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES tents(id)');
  final VerificationMeta _phoneNumMeta = const VerificationMeta('phoneNum');
  @override
  late final GeneratedColumn<String?> phoneNum = GeneratedColumn<String?>(
      'phone_num', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameEngMeta = const VerificationMeta('nameEng');
  @override
  late final GeneratedColumn<String?> nameEng = GeneratedColumn<String?>(
      'name_eng', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _peopleCountMeta =
      const VerificationMeta('peopleCount');
  @override
  late final GeneratedColumn<int?> peopleCount = GeneratedColumn<int?>(
      'people_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _womenCountMeta = const VerificationMeta('womenCount');
  @override
  late final GeneratedColumn<int?> womenCount = GeneratedColumn<int?>(
      'women_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _childrenCountMeta =
      const VerificationMeta('childrenCount');
  @override
  late final GeneratedColumn<int?> childrenCount = GeneratedColumn<int?>(
      'children_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _casesCountMeta = const VerificationMeta('casesCount');
  @override
  late final GeneratedColumn<int?> casesCount = GeneratedColumn<int?>(
      'cases_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        location,
        campId,
        tentId,
        phoneNum,
        nameEng,
        peopleCount,
        womenCount,
        childrenCount,
        casesCount
      ];
  @override
  String get aliasedName => _alias ?? 'familys';
  @override
  String get actualTableName => 'familys';
  @override
  VerificationContext validateIntegrity(Insertable<Family> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('camp_id')) {
      context.handle(_campIdMeta,
          campId.isAcceptableOrUnknown(data['camp_id']!, _campIdMeta));
    } else if (isInserting) {
      context.missing(_campIdMeta);
    }
    if (data.containsKey('tent_id')) {
      context.handle(_tentIdMeta,
          tentId.isAcceptableOrUnknown(data['tent_id']!, _tentIdMeta));
    } else if (isInserting) {
      context.missing(_tentIdMeta);
    }
    if (data.containsKey('phone_num')) {
      context.handle(_phoneNumMeta,
          phoneNum.isAcceptableOrUnknown(data['phone_num']!, _phoneNumMeta));
    } else if (isInserting) {
      context.missing(_phoneNumMeta);
    }
    if (data.containsKey('name_eng')) {
      context.handle(_nameEngMeta,
          nameEng.isAcceptableOrUnknown(data['name_eng']!, _nameEngMeta));
    } else if (isInserting) {
      context.missing(_nameEngMeta);
    }
    if (data.containsKey('people_count')) {
      context.handle(
          _peopleCountMeta,
          peopleCount.isAcceptableOrUnknown(
              data['people_count']!, _peopleCountMeta));
    } else if (isInserting) {
      context.missing(_peopleCountMeta);
    }
    if (data.containsKey('women_count')) {
      context.handle(
          _womenCountMeta,
          womenCount.isAcceptableOrUnknown(
              data['women_count']!, _womenCountMeta));
    } else if (isInserting) {
      context.missing(_womenCountMeta);
    }
    if (data.containsKey('children_count')) {
      context.handle(
          _childrenCountMeta,
          childrenCount.isAcceptableOrUnknown(
              data['children_count']!, _childrenCountMeta));
    } else if (isInserting) {
      context.missing(_childrenCountMeta);
    }
    if (data.containsKey('cases_count')) {
      context.handle(
          _casesCountMeta,
          casesCount.isAcceptableOrUnknown(
              data['cases_count']!, _casesCountMeta));
    } else if (isInserting) {
      context.missing(_casesCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Family map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Family.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FamilysTable createAlias(String alias) {
    return $FamilysTable(attachedDatabase, alias);
  }
}

class Location extends DataClass implements Insertable<Location> {
  final String location;
  Location({required this.location});
  factory Location.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Location(
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['location'] = Variable<String>(location);
    return map;
  }

  LocationsCompanion toCompanion(bool nullToAbsent) {
    return LocationsCompanion(
      location: Value(location),
    );
  }

  factory Location.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Location(
      location: serializer.fromJson<String>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'location': serializer.toJson<String>(location),
    };
  }

  Location copyWith({String? location}) => Location(
        location: location ?? this.location,
      );
  @override
  String toString() {
    return (StringBuffer('Location(')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => location.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Location && other.location == this.location);
}

class LocationsCompanion extends UpdateCompanion<Location> {
  final Value<String> location;
  const LocationsCompanion({
    this.location = const Value.absent(),
  });
  LocationsCompanion.insert({
    required String location,
  }) : location = Value(location);
  static Insertable<Location> custom({
    Expression<String>? location,
  }) {
    return RawValuesInsertable({
      if (location != null) 'location': location,
    });
  }

  LocationsCompanion copyWith({Value<String>? location}) {
    return LocationsCompanion(
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationsCompanion(')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

class $LocationsTable extends Locations
    with TableInfo<$LocationsTable, Location> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  @override
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [location];
  @override
  String get aliasedName => _alias ?? 'locations';
  @override
  String get actualTableName => 'locations';
  @override
  VerificationContext validateIntegrity(Insertable<Location> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {location};
  @override
  Location map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Location.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LocationsTable createAlias(String alias) {
    return $LocationsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $LocalAuthUsersTable localAuthUsers = $LocalAuthUsersTable(this);
  late final $LocalExcelDatasTable localExcelDatas =
      $LocalExcelDatasTable(this);
  late final $CampsTable camps = $CampsTable(this);
  late final $TentsTable tents = $TentsTable(this);
  late final $FamilysTable familys = $FamilysTable(this);
  late final $LocationsTable locations = $LocationsTable(this);
  late final LocalAuthUserDao localAuthUserDao =
      LocalAuthUserDao(this as MyDatabase);
  late final LocalExcelDataDao localExcelDataDao =
      LocalExcelDataDao(this as MyDatabase);
  late final CampDao campDao = CampDao(this as MyDatabase);
  late final TentDao tentDao = TentDao(this as MyDatabase);
  late final FamilyDao familyDao = FamilyDao(this as MyDatabase);
  late final LocationDao locationDao = LocationDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [localAuthUsers, localExcelDatas, camps, tents, familys, locations];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TentDaoMixin on DatabaseAccessor<MyDatabase> {
  $TentsTable get tents => attachedDatabase.tents;
  $CampsTable get camps => attachedDatabase.camps;
}
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
mixin _$CampDaoMixin on DatabaseAccessor<MyDatabase> {
  $CampsTable get camps => attachedDatabase.camps;
  $LocationsTable get locations => attachedDatabase.locations;
}
mixin _$FamilyDaoMixin on DatabaseAccessor<MyDatabase> {
  $FamilysTable get familys => attachedDatabase.familys;
}
mixin _$LocationDaoMixin on DatabaseAccessor<MyDatabase> {
  $LocationsTable get locations => attachedDatabase.locations;
}
