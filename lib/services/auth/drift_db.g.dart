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
  final String region;
  final String name;
  Camp(
      {required this.id,
      required this.location,
      required this.region,
      required this.name});
  factory Camp.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Camp(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location'])!,
      region: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}region'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['location'] = Variable<String>(location);
    map['region'] = Variable<String>(region);
    map['name'] = Variable<String>(name);
    return map;
  }

  CampsCompanion toCompanion(bool nullToAbsent) {
    return CampsCompanion(
      id: Value(id),
      location: Value(location),
      region: Value(region),
      name: Value(name),
    );
  }

  factory Camp.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Camp(
      id: serializer.fromJson<int>(json['id']),
      location: serializer.fromJson<String>(json['location']),
      region: serializer.fromJson<String>(json['region']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'location': serializer.toJson<String>(location),
      'region': serializer.toJson<String>(region),
      'name': serializer.toJson<String>(name),
    };
  }

  Camp copyWith({int? id, String? location, String? region, String? name}) =>
      Camp(
        id: id ?? this.id,
        location: location ?? this.location,
        region: region ?? this.region,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Camp(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('region: $region, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, location, region, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Camp &&
          other.id == this.id &&
          other.location == this.location &&
          other.region == this.region &&
          other.name == this.name);
}

class CampsCompanion extends UpdateCompanion<Camp> {
  final Value<int> id;
  final Value<String> location;
  final Value<String> region;
  final Value<String> name;
  const CampsCompanion({
    this.id = const Value.absent(),
    this.location = const Value.absent(),
    this.region = const Value.absent(),
    this.name = const Value.absent(),
  });
  CampsCompanion.insert({
    this.id = const Value.absent(),
    required String location,
    required String region,
    required String name,
  })  : location = Value(location),
        region = Value(region),
        name = Value(name);
  static Insertable<Camp> custom({
    Expression<int>? id,
    Expression<String>? location,
    Expression<String>? region,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (location != null) 'location': location,
      if (region != null) 'region': region,
      if (name != null) 'name': name,
    });
  }

  CampsCompanion copyWith(
      {Value<int>? id,
      Value<String>? location,
      Value<String>? region,
      Value<String>? name}) {
    return CampsCompanion(
      id: id ?? this.id,
      location: location ?? this.location,
      region: region ?? this.region,
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
    if (region.present) {
      map['region'] = Variable<String>(region.value);
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
          ..write('region: $region, ')
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
      $customConstraints: 'NOT NULL REFERENCES locations (location)');
  final VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String?> region = GeneratedColumn<String?>(
      'region', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES regions (region)');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, location, region, name];
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
    if (data.containsKey('region')) {
      context.handle(_regionMeta,
          region.isAcceptableOrUnknown(data['region']!, _regionMeta));
    } else if (isInserting) {
      context.missing(_regionMeta);
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
  final int tentId;
  final String nameEng;
  final String nameAr;
  final String phoneNum;
  final String wfpAid;
  final String unhcr;
  final int peopleCount;
  final int womenCount;
  final int childrenCount;
  final int elderlyCount;
  final int casesCount;
  final int educationCount;
  final int employedCount;
  final int unemployedCount;
  final String notes1;
  final String notes2;
  final String location;
  final String region;
  final int campId;
  Family(
      {required this.id,
      required this.tentId,
      required this.nameEng,
      required this.nameAr,
      required this.phoneNum,
      required this.wfpAid,
      required this.unhcr,
      required this.peopleCount,
      required this.womenCount,
      required this.childrenCount,
      required this.elderlyCount,
      required this.casesCount,
      required this.educationCount,
      required this.employedCount,
      required this.unemployedCount,
      required this.notes1,
      required this.notes2,
      required this.location,
      required this.region,
      required this.campId});
  factory Family.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Family(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      tentId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tent_id'])!,
      nameEng: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_eng'])!,
      nameAr: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_ar'])!,
      phoneNum: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_num'])!,
      wfpAid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}wfp_aid'])!,
      unhcr: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unhcr'])!,
      peopleCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}people_count'])!,
      womenCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}women_count'])!,
      childrenCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}children_count'])!,
      elderlyCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}elderly_count'])!,
      casesCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cases_count'])!,
      educationCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}education_count'])!,
      employedCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}employed_count'])!,
      unemployedCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unemployed_count'])!,
      notes1: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}notes1'])!,
      notes2: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}notes2'])!,
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location'])!,
      region: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}region'])!,
      campId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}camp_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tent_id'] = Variable<int>(tentId);
    map['name_eng'] = Variable<String>(nameEng);
    map['name_ar'] = Variable<String>(nameAr);
    map['phone_num'] = Variable<String>(phoneNum);
    map['wfp_aid'] = Variable<String>(wfpAid);
    map['unhcr'] = Variable<String>(unhcr);
    map['people_count'] = Variable<int>(peopleCount);
    map['women_count'] = Variable<int>(womenCount);
    map['children_count'] = Variable<int>(childrenCount);
    map['elderly_count'] = Variable<int>(elderlyCount);
    map['cases_count'] = Variable<int>(casesCount);
    map['education_count'] = Variable<int>(educationCount);
    map['employed_count'] = Variable<int>(employedCount);
    map['unemployed_count'] = Variable<int>(unemployedCount);
    map['notes1'] = Variable<String>(notes1);
    map['notes2'] = Variable<String>(notes2);
    map['location'] = Variable<String>(location);
    map['region'] = Variable<String>(region);
    map['camp_id'] = Variable<int>(campId);
    return map;
  }

  FamilysCompanion toCompanion(bool nullToAbsent) {
    return FamilysCompanion(
      id: Value(id),
      tentId: Value(tentId),
      nameEng: Value(nameEng),
      nameAr: Value(nameAr),
      phoneNum: Value(phoneNum),
      wfpAid: Value(wfpAid),
      unhcr: Value(unhcr),
      peopleCount: Value(peopleCount),
      womenCount: Value(womenCount),
      childrenCount: Value(childrenCount),
      elderlyCount: Value(elderlyCount),
      casesCount: Value(casesCount),
      educationCount: Value(educationCount),
      employedCount: Value(employedCount),
      unemployedCount: Value(unemployedCount),
      notes1: Value(notes1),
      notes2: Value(notes2),
      location: Value(location),
      region: Value(region),
      campId: Value(campId),
    );
  }

  factory Family.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Family(
      id: serializer.fromJson<int>(json['id']),
      tentId: serializer.fromJson<int>(json['tentId']),
      nameEng: serializer.fromJson<String>(json['nameEng']),
      nameAr: serializer.fromJson<String>(json['nameAr']),
      phoneNum: serializer.fromJson<String>(json['phoneNum']),
      wfpAid: serializer.fromJson<String>(json['wfpAid']),
      unhcr: serializer.fromJson<String>(json['unhcr']),
      peopleCount: serializer.fromJson<int>(json['peopleCount']),
      womenCount: serializer.fromJson<int>(json['womenCount']),
      childrenCount: serializer.fromJson<int>(json['childrenCount']),
      elderlyCount: serializer.fromJson<int>(json['elderlyCount']),
      casesCount: serializer.fromJson<int>(json['casesCount']),
      educationCount: serializer.fromJson<int>(json['educationCount']),
      employedCount: serializer.fromJson<int>(json['employedCount']),
      unemployedCount: serializer.fromJson<int>(json['unemployedCount']),
      notes1: serializer.fromJson<String>(json['notes1']),
      notes2: serializer.fromJson<String>(json['notes2']),
      location: serializer.fromJson<String>(json['location']),
      region: serializer.fromJson<String>(json['region']),
      campId: serializer.fromJson<int>(json['campId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tentId': serializer.toJson<int>(tentId),
      'nameEng': serializer.toJson<String>(nameEng),
      'nameAr': serializer.toJson<String>(nameAr),
      'phoneNum': serializer.toJson<String>(phoneNum),
      'wfpAid': serializer.toJson<String>(wfpAid),
      'unhcr': serializer.toJson<String>(unhcr),
      'peopleCount': serializer.toJson<int>(peopleCount),
      'womenCount': serializer.toJson<int>(womenCount),
      'childrenCount': serializer.toJson<int>(childrenCount),
      'elderlyCount': serializer.toJson<int>(elderlyCount),
      'casesCount': serializer.toJson<int>(casesCount),
      'educationCount': serializer.toJson<int>(educationCount),
      'employedCount': serializer.toJson<int>(employedCount),
      'unemployedCount': serializer.toJson<int>(unemployedCount),
      'notes1': serializer.toJson<String>(notes1),
      'notes2': serializer.toJson<String>(notes2),
      'location': serializer.toJson<String>(location),
      'region': serializer.toJson<String>(region),
      'campId': serializer.toJson<int>(campId),
    };
  }

  Family copyWith(
          {int? id,
          int? tentId,
          String? nameEng,
          String? nameAr,
          String? phoneNum,
          String? wfpAid,
          String? unhcr,
          int? peopleCount,
          int? womenCount,
          int? childrenCount,
          int? elderlyCount,
          int? casesCount,
          int? educationCount,
          int? employedCount,
          int? unemployedCount,
          String? notes1,
          String? notes2,
          String? location,
          String? region,
          int? campId}) =>
      Family(
        id: id ?? this.id,
        tentId: tentId ?? this.tentId,
        nameEng: nameEng ?? this.nameEng,
        nameAr: nameAr ?? this.nameAr,
        phoneNum: phoneNum ?? this.phoneNum,
        wfpAid: wfpAid ?? this.wfpAid,
        unhcr: unhcr ?? this.unhcr,
        peopleCount: peopleCount ?? this.peopleCount,
        womenCount: womenCount ?? this.womenCount,
        childrenCount: childrenCount ?? this.childrenCount,
        elderlyCount: elderlyCount ?? this.elderlyCount,
        casesCount: casesCount ?? this.casesCount,
        educationCount: educationCount ?? this.educationCount,
        employedCount: employedCount ?? this.employedCount,
        unemployedCount: unemployedCount ?? this.unemployedCount,
        notes1: notes1 ?? this.notes1,
        notes2: notes2 ?? this.notes2,
        location: location ?? this.location,
        region: region ?? this.region,
        campId: campId ?? this.campId,
      );
  @override
  String toString() {
    return (StringBuffer('Family(')
          ..write('id: $id, ')
          ..write('tentId: $tentId, ')
          ..write('nameEng: $nameEng, ')
          ..write('nameAr: $nameAr, ')
          ..write('phoneNum: $phoneNum, ')
          ..write('wfpAid: $wfpAid, ')
          ..write('unhcr: $unhcr, ')
          ..write('peopleCount: $peopleCount, ')
          ..write('womenCount: $womenCount, ')
          ..write('childrenCount: $childrenCount, ')
          ..write('elderlyCount: $elderlyCount, ')
          ..write('casesCount: $casesCount, ')
          ..write('educationCount: $educationCount, ')
          ..write('employedCount: $employedCount, ')
          ..write('unemployedCount: $unemployedCount, ')
          ..write('notes1: $notes1, ')
          ..write('notes2: $notes2, ')
          ..write('location: $location, ')
          ..write('region: $region, ')
          ..write('campId: $campId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      tentId,
      nameEng,
      nameAr,
      phoneNum,
      wfpAid,
      unhcr,
      peopleCount,
      womenCount,
      childrenCount,
      elderlyCount,
      casesCount,
      educationCount,
      employedCount,
      unemployedCount,
      notes1,
      notes2,
      location,
      region,
      campId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Family &&
          other.id == this.id &&
          other.tentId == this.tentId &&
          other.nameEng == this.nameEng &&
          other.nameAr == this.nameAr &&
          other.phoneNum == this.phoneNum &&
          other.wfpAid == this.wfpAid &&
          other.unhcr == this.unhcr &&
          other.peopleCount == this.peopleCount &&
          other.womenCount == this.womenCount &&
          other.childrenCount == this.childrenCount &&
          other.elderlyCount == this.elderlyCount &&
          other.casesCount == this.casesCount &&
          other.educationCount == this.educationCount &&
          other.employedCount == this.employedCount &&
          other.unemployedCount == this.unemployedCount &&
          other.notes1 == this.notes1 &&
          other.notes2 == this.notes2 &&
          other.location == this.location &&
          other.region == this.region &&
          other.campId == this.campId);
}

class FamilysCompanion extends UpdateCompanion<Family> {
  final Value<int> id;
  final Value<int> tentId;
  final Value<String> nameEng;
  final Value<String> nameAr;
  final Value<String> phoneNum;
  final Value<String> wfpAid;
  final Value<String> unhcr;
  final Value<int> peopleCount;
  final Value<int> womenCount;
  final Value<int> childrenCount;
  final Value<int> elderlyCount;
  final Value<int> casesCount;
  final Value<int> educationCount;
  final Value<int> employedCount;
  final Value<int> unemployedCount;
  final Value<String> notes1;
  final Value<String> notes2;
  final Value<String> location;
  final Value<String> region;
  final Value<int> campId;
  const FamilysCompanion({
    this.id = const Value.absent(),
    this.tentId = const Value.absent(),
    this.nameEng = const Value.absent(),
    this.nameAr = const Value.absent(),
    this.phoneNum = const Value.absent(),
    this.wfpAid = const Value.absent(),
    this.unhcr = const Value.absent(),
    this.peopleCount = const Value.absent(),
    this.womenCount = const Value.absent(),
    this.childrenCount = const Value.absent(),
    this.elderlyCount = const Value.absent(),
    this.casesCount = const Value.absent(),
    this.educationCount = const Value.absent(),
    this.employedCount = const Value.absent(),
    this.unemployedCount = const Value.absent(),
    this.notes1 = const Value.absent(),
    this.notes2 = const Value.absent(),
    this.location = const Value.absent(),
    this.region = const Value.absent(),
    this.campId = const Value.absent(),
  });
  FamilysCompanion.insert({
    this.id = const Value.absent(),
    required int tentId,
    required String nameEng,
    required String nameAr,
    required String phoneNum,
    required String wfpAid,
    required String unhcr,
    required int peopleCount,
    required int womenCount,
    required int childrenCount,
    required int elderlyCount,
    required int casesCount,
    required int educationCount,
    required int employedCount,
    required int unemployedCount,
    required String notes1,
    required String notes2,
    required String location,
    required String region,
    required int campId,
  })  : tentId = Value(tentId),
        nameEng = Value(nameEng),
        nameAr = Value(nameAr),
        phoneNum = Value(phoneNum),
        wfpAid = Value(wfpAid),
        unhcr = Value(unhcr),
        peopleCount = Value(peopleCount),
        womenCount = Value(womenCount),
        childrenCount = Value(childrenCount),
        elderlyCount = Value(elderlyCount),
        casesCount = Value(casesCount),
        educationCount = Value(educationCount),
        employedCount = Value(employedCount),
        unemployedCount = Value(unemployedCount),
        notes1 = Value(notes1),
        notes2 = Value(notes2),
        location = Value(location),
        region = Value(region),
        campId = Value(campId);
  static Insertable<Family> custom({
    Expression<int>? id,
    Expression<int>? tentId,
    Expression<String>? nameEng,
    Expression<String>? nameAr,
    Expression<String>? phoneNum,
    Expression<String>? wfpAid,
    Expression<String>? unhcr,
    Expression<int>? peopleCount,
    Expression<int>? womenCount,
    Expression<int>? childrenCount,
    Expression<int>? elderlyCount,
    Expression<int>? casesCount,
    Expression<int>? educationCount,
    Expression<int>? employedCount,
    Expression<int>? unemployedCount,
    Expression<String>? notes1,
    Expression<String>? notes2,
    Expression<String>? location,
    Expression<String>? region,
    Expression<int>? campId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tentId != null) 'tent_id': tentId,
      if (nameEng != null) 'name_eng': nameEng,
      if (nameAr != null) 'name_ar': nameAr,
      if (phoneNum != null) 'phone_num': phoneNum,
      if (wfpAid != null) 'wfp_aid': wfpAid,
      if (unhcr != null) 'unhcr': unhcr,
      if (peopleCount != null) 'people_count': peopleCount,
      if (womenCount != null) 'women_count': womenCount,
      if (childrenCount != null) 'children_count': childrenCount,
      if (elderlyCount != null) 'elderly_count': elderlyCount,
      if (casesCount != null) 'cases_count': casesCount,
      if (educationCount != null) 'education_count': educationCount,
      if (employedCount != null) 'employed_count': employedCount,
      if (unemployedCount != null) 'unemployed_count': unemployedCount,
      if (notes1 != null) 'notes1': notes1,
      if (notes2 != null) 'notes2': notes2,
      if (location != null) 'location': location,
      if (region != null) 'region': region,
      if (campId != null) 'camp_id': campId,
    });
  }

  FamilysCompanion copyWith(
      {Value<int>? id,
      Value<int>? tentId,
      Value<String>? nameEng,
      Value<String>? nameAr,
      Value<String>? phoneNum,
      Value<String>? wfpAid,
      Value<String>? unhcr,
      Value<int>? peopleCount,
      Value<int>? womenCount,
      Value<int>? childrenCount,
      Value<int>? elderlyCount,
      Value<int>? casesCount,
      Value<int>? educationCount,
      Value<int>? employedCount,
      Value<int>? unemployedCount,
      Value<String>? notes1,
      Value<String>? notes2,
      Value<String>? location,
      Value<String>? region,
      Value<int>? campId}) {
    return FamilysCompanion(
      id: id ?? this.id,
      tentId: tentId ?? this.tentId,
      nameEng: nameEng ?? this.nameEng,
      nameAr: nameAr ?? this.nameAr,
      phoneNum: phoneNum ?? this.phoneNum,
      wfpAid: wfpAid ?? this.wfpAid,
      unhcr: unhcr ?? this.unhcr,
      peopleCount: peopleCount ?? this.peopleCount,
      womenCount: womenCount ?? this.womenCount,
      childrenCount: childrenCount ?? this.childrenCount,
      elderlyCount: elderlyCount ?? this.elderlyCount,
      casesCount: casesCount ?? this.casesCount,
      educationCount: educationCount ?? this.educationCount,
      employedCount: employedCount ?? this.employedCount,
      unemployedCount: unemployedCount ?? this.unemployedCount,
      notes1: notes1 ?? this.notes1,
      notes2: notes2 ?? this.notes2,
      location: location ?? this.location,
      region: region ?? this.region,
      campId: campId ?? this.campId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tentId.present) {
      map['tent_id'] = Variable<int>(tentId.value);
    }
    if (nameEng.present) {
      map['name_eng'] = Variable<String>(nameEng.value);
    }
    if (nameAr.present) {
      map['name_ar'] = Variable<String>(nameAr.value);
    }
    if (phoneNum.present) {
      map['phone_num'] = Variable<String>(phoneNum.value);
    }
    if (wfpAid.present) {
      map['wfp_aid'] = Variable<String>(wfpAid.value);
    }
    if (unhcr.present) {
      map['unhcr'] = Variable<String>(unhcr.value);
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
    if (elderlyCount.present) {
      map['elderly_count'] = Variable<int>(elderlyCount.value);
    }
    if (casesCount.present) {
      map['cases_count'] = Variable<int>(casesCount.value);
    }
    if (educationCount.present) {
      map['education_count'] = Variable<int>(educationCount.value);
    }
    if (employedCount.present) {
      map['employed_count'] = Variable<int>(employedCount.value);
    }
    if (unemployedCount.present) {
      map['unemployed_count'] = Variable<int>(unemployedCount.value);
    }
    if (notes1.present) {
      map['notes1'] = Variable<String>(notes1.value);
    }
    if (notes2.present) {
      map['notes2'] = Variable<String>(notes2.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (campId.present) {
      map['camp_id'] = Variable<int>(campId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FamilysCompanion(')
          ..write('id: $id, ')
          ..write('tentId: $tentId, ')
          ..write('nameEng: $nameEng, ')
          ..write('nameAr: $nameAr, ')
          ..write('phoneNum: $phoneNum, ')
          ..write('wfpAid: $wfpAid, ')
          ..write('unhcr: $unhcr, ')
          ..write('peopleCount: $peopleCount, ')
          ..write('womenCount: $womenCount, ')
          ..write('childrenCount: $childrenCount, ')
          ..write('elderlyCount: $elderlyCount, ')
          ..write('casesCount: $casesCount, ')
          ..write('educationCount: $educationCount, ')
          ..write('employedCount: $employedCount, ')
          ..write('unemployedCount: $unemployedCount, ')
          ..write('notes1: $notes1, ')
          ..write('notes2: $notes2, ')
          ..write('location: $location, ')
          ..write('region: $region, ')
          ..write('campId: $campId')
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
  final VerificationMeta _tentIdMeta = const VerificationMeta('tentId');
  @override
  late final GeneratedColumn<int?> tentId = GeneratedColumn<int?>(
      'tent_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nameEngMeta = const VerificationMeta('nameEng');
  @override
  late final GeneratedColumn<String?> nameEng = GeneratedColumn<String?>(
      'name_eng', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
  @override
  late final GeneratedColumn<String?> nameAr = GeneratedColumn<String?>(
      'name_ar', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _phoneNumMeta = const VerificationMeta('phoneNum');
  @override
  late final GeneratedColumn<String?> phoneNum = GeneratedColumn<String?>(
      'phone_num', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _wfpAidMeta = const VerificationMeta('wfpAid');
  @override
  late final GeneratedColumn<String?> wfpAid = GeneratedColumn<String?>(
      'wfp_aid', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _unhcrMeta = const VerificationMeta('unhcr');
  @override
  late final GeneratedColumn<String?> unhcr = GeneratedColumn<String?>(
      'unhcr', aliasedName, false,
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
  final VerificationMeta _elderlyCountMeta =
      const VerificationMeta('elderlyCount');
  @override
  late final GeneratedColumn<int?> elderlyCount = GeneratedColumn<int?>(
      'elderly_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _casesCountMeta = const VerificationMeta('casesCount');
  @override
  late final GeneratedColumn<int?> casesCount = GeneratedColumn<int?>(
      'cases_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _educationCountMeta =
      const VerificationMeta('educationCount');
  @override
  late final GeneratedColumn<int?> educationCount = GeneratedColumn<int?>(
      'education_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _employedCountMeta =
      const VerificationMeta('employedCount');
  @override
  late final GeneratedColumn<int?> employedCount = GeneratedColumn<int?>(
      'employed_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _unemployedCountMeta =
      const VerificationMeta('unemployedCount');
  @override
  late final GeneratedColumn<int?> unemployedCount = GeneratedColumn<int?>(
      'unemployed_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _notes1Meta = const VerificationMeta('notes1');
  @override
  late final GeneratedColumn<String?> notes1 = GeneratedColumn<String?>(
      'notes1', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _notes2Meta = const VerificationMeta('notes2');
  @override
  late final GeneratedColumn<String?> notes2 = GeneratedColumn<String?>(
      'notes2', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  @override
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES locations(location)');
  final VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String?> region = GeneratedColumn<String?>(
      'region', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES regions(region)');
  final VerificationMeta _campIdMeta = const VerificationMeta('campId');
  @override
  late final GeneratedColumn<int?> campId = GeneratedColumn<int?>(
      'camp_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES camps(id)');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        tentId,
        nameEng,
        nameAr,
        phoneNum,
        wfpAid,
        unhcr,
        peopleCount,
        womenCount,
        childrenCount,
        elderlyCount,
        casesCount,
        educationCount,
        employedCount,
        unemployedCount,
        notes1,
        notes2,
        location,
        region,
        campId
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
    if (data.containsKey('tent_id')) {
      context.handle(_tentIdMeta,
          tentId.isAcceptableOrUnknown(data['tent_id']!, _tentIdMeta));
    } else if (isInserting) {
      context.missing(_tentIdMeta);
    }
    if (data.containsKey('name_eng')) {
      context.handle(_nameEngMeta,
          nameEng.isAcceptableOrUnknown(data['name_eng']!, _nameEngMeta));
    } else if (isInserting) {
      context.missing(_nameEngMeta);
    }
    if (data.containsKey('name_ar')) {
      context.handle(_nameArMeta,
          nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));
    } else if (isInserting) {
      context.missing(_nameArMeta);
    }
    if (data.containsKey('phone_num')) {
      context.handle(_phoneNumMeta,
          phoneNum.isAcceptableOrUnknown(data['phone_num']!, _phoneNumMeta));
    } else if (isInserting) {
      context.missing(_phoneNumMeta);
    }
    if (data.containsKey('wfp_aid')) {
      context.handle(_wfpAidMeta,
          wfpAid.isAcceptableOrUnknown(data['wfp_aid']!, _wfpAidMeta));
    } else if (isInserting) {
      context.missing(_wfpAidMeta);
    }
    if (data.containsKey('unhcr')) {
      context.handle(
          _unhcrMeta, unhcr.isAcceptableOrUnknown(data['unhcr']!, _unhcrMeta));
    } else if (isInserting) {
      context.missing(_unhcrMeta);
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
    if (data.containsKey('elderly_count')) {
      context.handle(
          _elderlyCountMeta,
          elderlyCount.isAcceptableOrUnknown(
              data['elderly_count']!, _elderlyCountMeta));
    } else if (isInserting) {
      context.missing(_elderlyCountMeta);
    }
    if (data.containsKey('cases_count')) {
      context.handle(
          _casesCountMeta,
          casesCount.isAcceptableOrUnknown(
              data['cases_count']!, _casesCountMeta));
    } else if (isInserting) {
      context.missing(_casesCountMeta);
    }
    if (data.containsKey('education_count')) {
      context.handle(
          _educationCountMeta,
          educationCount.isAcceptableOrUnknown(
              data['education_count']!, _educationCountMeta));
    } else if (isInserting) {
      context.missing(_educationCountMeta);
    }
    if (data.containsKey('employed_count')) {
      context.handle(
          _employedCountMeta,
          employedCount.isAcceptableOrUnknown(
              data['employed_count']!, _employedCountMeta));
    } else if (isInserting) {
      context.missing(_employedCountMeta);
    }
    if (data.containsKey('unemployed_count')) {
      context.handle(
          _unemployedCountMeta,
          unemployedCount.isAcceptableOrUnknown(
              data['unemployed_count']!, _unemployedCountMeta));
    } else if (isInserting) {
      context.missing(_unemployedCountMeta);
    }
    if (data.containsKey('notes1')) {
      context.handle(_notes1Meta,
          notes1.isAcceptableOrUnknown(data['notes1']!, _notes1Meta));
    } else if (isInserting) {
      context.missing(_notes1Meta);
    }
    if (data.containsKey('notes2')) {
      context.handle(_notes2Meta,
          notes2.isAcceptableOrUnknown(data['notes2']!, _notes2Meta));
    } else if (isInserting) {
      context.missing(_notes2Meta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('region')) {
      context.handle(_regionMeta,
          region.isAcceptableOrUnknown(data['region']!, _regionMeta));
    } else if (isInserting) {
      context.missing(_regionMeta);
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

class Region extends DataClass implements Insertable<Region> {
  final String region;
  final String location;
  Region({required this.region, required this.location});
  factory Region.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Region(
      region: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}region'])!,
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['region'] = Variable<String>(region);
    map['location'] = Variable<String>(location);
    return map;
  }

  RegionsCompanion toCompanion(bool nullToAbsent) {
    return RegionsCompanion(
      region: Value(region),
      location: Value(location),
    );
  }

  factory Region.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Region(
      region: serializer.fromJson<String>(json['region']),
      location: serializer.fromJson<String>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'region': serializer.toJson<String>(region),
      'location': serializer.toJson<String>(location),
    };
  }

  Region copyWith({String? region, String? location}) => Region(
        region: region ?? this.region,
        location: location ?? this.location,
      );
  @override
  String toString() {
    return (StringBuffer('Region(')
          ..write('region: $region, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(region, location);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Region &&
          other.region == this.region &&
          other.location == this.location);
}

class RegionsCompanion extends UpdateCompanion<Region> {
  final Value<String> region;
  final Value<String> location;
  const RegionsCompanion({
    this.region = const Value.absent(),
    this.location = const Value.absent(),
  });
  RegionsCompanion.insert({
    required String region,
    required String location,
  })  : region = Value(region),
        location = Value(location);
  static Insertable<Region> custom({
    Expression<String>? region,
    Expression<String>? location,
  }) {
    return RawValuesInsertable({
      if (region != null) 'region': region,
      if (location != null) 'location': location,
    });
  }

  RegionsCompanion copyWith({Value<String>? region, Value<String>? location}) {
    return RegionsCompanion(
      region: region ?? this.region,
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegionsCompanion(')
          ..write('region: $region, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

class $RegionsTable extends Regions with TableInfo<$RegionsTable, Region> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegionsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String?> region = GeneratedColumn<String?>(
      'region', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  @override
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES locations (location)');
  @override
  List<GeneratedColumn> get $columns => [region, location];
  @override
  String get aliasedName => _alias ?? 'regions';
  @override
  String get actualTableName => 'regions';
  @override
  VerificationContext validateIntegrity(Insertable<Region> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('region')) {
      context.handle(_regionMeta,
          region.isAcceptableOrUnknown(data['region']!, _regionMeta));
    } else if (isInserting) {
      context.missing(_regionMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {region};
  @override
  Region map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Region.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RegionsTable createAlias(String alias) {
    return $RegionsTable(attachedDatabase, alias);
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
  late final $RegionsTable regions = $RegionsTable(this);
  late final LocalAuthUserDao localAuthUserDao =
      LocalAuthUserDao(this as MyDatabase);
  late final LocalExcelDataDao localExcelDataDao =
      LocalExcelDataDao(this as MyDatabase);
  late final CampDao campDao = CampDao(this as MyDatabase);
  late final TentDao tentDao = TentDao(this as MyDatabase);
  late final FamilyDao familyDao = FamilyDao(this as MyDatabase);
  late final LocationDao locationDao = LocationDao(this as MyDatabase);
  late final RegionDao regionDao = RegionDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        localAuthUsers,
        localExcelDatas,
        camps,
        tents,
        familys,
        locations,
        regions
      ];
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
  $RegionsTable get regions => attachedDatabase.regions;
}
mixin _$FamilyDaoMixin on DatabaseAccessor<MyDatabase> {
  $FamilysTable get familys => attachedDatabase.familys;
  $LocationsTable get locations => attachedDatabase.locations;
  $RegionsTable get regions => attachedDatabase.regions;
  $TentsTable get tents => attachedDatabase.tents;
  $CampsTable get camps => attachedDatabase.camps;
}
mixin _$LocationDaoMixin on DatabaseAccessor<MyDatabase> {
  $LocationsTable get locations => attachedDatabase.locations;
}
mixin _$RegionDaoMixin on DatabaseAccessor<MyDatabase> {
  $RegionsTable get regions => attachedDatabase.regions;
  $LocationsTable get locations => attachedDatabase.locations;
}
