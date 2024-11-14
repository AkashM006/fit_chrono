// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MuscleMapsTable extends MuscleMaps
    with TableInfo<$MuscleMapsTable, MuscleMap> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MuscleMapsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'muscle_maps';
  @override
  VerificationContext validateIntegrity(Insertable<MuscleMap> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
  MuscleMap map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MuscleMap(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $MuscleMapsTable createAlias(String alias) {
    return $MuscleMapsTable(attachedDatabase, alias);
  }
}

class MuscleMap extends DataClass implements Insertable<MuscleMap> {
  final int id;
  final String name;
  const MuscleMap({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  MuscleMapsCompanion toCompanion(bool nullToAbsent) {
    return MuscleMapsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory MuscleMap.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MuscleMap(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  MuscleMap copyWith({int? id, String? name}) => MuscleMap(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  MuscleMap copyWithCompanion(MuscleMapsCompanion data) {
    return MuscleMap(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MuscleMap(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MuscleMap && other.id == this.id && other.name == this.name);
}

class MuscleMapsCompanion extends UpdateCompanion<MuscleMap> {
  final Value<int> id;
  final Value<String> name;
  const MuscleMapsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  MuscleMapsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<MuscleMap> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  MuscleMapsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return MuscleMapsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MuscleMapsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $WorkoutsTable extends Workouts with TableInfo<$WorkoutsTable, Workout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workouts';
  @override
  VerificationContext validateIntegrity(Insertable<Workout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
  Workout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Workout(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $WorkoutsTable createAlias(String alias) {
    return $WorkoutsTable(attachedDatabase, alias);
  }
}

class Workout extends DataClass implements Insertable<Workout> {
  final int id;
  final String name;
  const Workout({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  WorkoutsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Workout.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Workout(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Workout copyWith({int? id, String? name}) => Workout(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Workout copyWithCompanion(WorkoutsCompanion data) {
    return Workout(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Workout(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Workout && other.id == this.id && other.name == this.name);
}

class WorkoutsCompanion extends UpdateCompanion<Workout> {
  final Value<int> id;
  final Value<String> name;
  const WorkoutsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  WorkoutsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Workout> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  WorkoutsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return WorkoutsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $MuscleMapsForWorkoutsTable extends MuscleMapsForWorkouts
    with TableInfo<$MuscleMapsForWorkoutsTable, MuscleMapsForWorkout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MuscleMapsForWorkoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<int> workoutId = GeneratedColumn<int>(
      'workout_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES workouts (id) ON DELETE CASCADE'));
  static const VerificationMeta _muscleMapIdMeta =
      const VerificationMeta('muscleMapId');
  @override
  late final GeneratedColumn<int> muscleMapId = GeneratedColumn<int>(
      'muscle_map_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES muscle_maps (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [workoutId, muscleMapId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'muscle_maps_for_workouts';
  @override
  VerificationContext validateIntegrity(
      Insertable<MuscleMapsForWorkout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    } else if (isInserting) {
      context.missing(_workoutIdMeta);
    }
    if (data.containsKey('muscle_map_id')) {
      context.handle(
          _muscleMapIdMeta,
          muscleMapId.isAcceptableOrUnknown(
              data['muscle_map_id']!, _muscleMapIdMeta));
    } else if (isInserting) {
      context.missing(_muscleMapIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workoutId, muscleMapId};
  @override
  MuscleMapsForWorkout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MuscleMapsForWorkout(
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}workout_id'])!,
      muscleMapId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}muscle_map_id'])!,
    );
  }

  @override
  $MuscleMapsForWorkoutsTable createAlias(String alias) {
    return $MuscleMapsForWorkoutsTable(attachedDatabase, alias);
  }
}

class MuscleMapsForWorkout extends DataClass
    implements Insertable<MuscleMapsForWorkout> {
  final int workoutId;
  final int muscleMapId;
  const MuscleMapsForWorkout(
      {required this.workoutId, required this.muscleMapId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['workout_id'] = Variable<int>(workoutId);
    map['muscle_map_id'] = Variable<int>(muscleMapId);
    return map;
  }

  MuscleMapsForWorkoutsCompanion toCompanion(bool nullToAbsent) {
    return MuscleMapsForWorkoutsCompanion(
      workoutId: Value(workoutId),
      muscleMapId: Value(muscleMapId),
    );
  }

  factory MuscleMapsForWorkout.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MuscleMapsForWorkout(
      workoutId: serializer.fromJson<int>(json['workoutId']),
      muscleMapId: serializer.fromJson<int>(json['muscleMapId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workoutId': serializer.toJson<int>(workoutId),
      'muscleMapId': serializer.toJson<int>(muscleMapId),
    };
  }

  MuscleMapsForWorkout copyWith({int? workoutId, int? muscleMapId}) =>
      MuscleMapsForWorkout(
        workoutId: workoutId ?? this.workoutId,
        muscleMapId: muscleMapId ?? this.muscleMapId,
      );
  MuscleMapsForWorkout copyWithCompanion(MuscleMapsForWorkoutsCompanion data) {
    return MuscleMapsForWorkout(
      workoutId: data.workoutId.present ? data.workoutId.value : this.workoutId,
      muscleMapId:
          data.muscleMapId.present ? data.muscleMapId.value : this.muscleMapId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MuscleMapsForWorkout(')
          ..write('workoutId: $workoutId, ')
          ..write('muscleMapId: $muscleMapId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(workoutId, muscleMapId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MuscleMapsForWorkout &&
          other.workoutId == this.workoutId &&
          other.muscleMapId == this.muscleMapId);
}

class MuscleMapsForWorkoutsCompanion
    extends UpdateCompanion<MuscleMapsForWorkout> {
  final Value<int> workoutId;
  final Value<int> muscleMapId;
  final Value<int> rowid;
  const MuscleMapsForWorkoutsCompanion({
    this.workoutId = const Value.absent(),
    this.muscleMapId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MuscleMapsForWorkoutsCompanion.insert({
    required int workoutId,
    required int muscleMapId,
    this.rowid = const Value.absent(),
  })  : workoutId = Value(workoutId),
        muscleMapId = Value(muscleMapId);
  static Insertable<MuscleMapsForWorkout> custom({
    Expression<int>? workoutId,
    Expression<int>? muscleMapId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (workoutId != null) 'workout_id': workoutId,
      if (muscleMapId != null) 'muscle_map_id': muscleMapId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MuscleMapsForWorkoutsCompanion copyWith(
      {Value<int>? workoutId, Value<int>? muscleMapId, Value<int>? rowid}) {
    return MuscleMapsForWorkoutsCompanion(
      workoutId: workoutId ?? this.workoutId,
      muscleMapId: muscleMapId ?? this.muscleMapId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workoutId.present) {
      map['workout_id'] = Variable<int>(workoutId.value);
    }
    if (muscleMapId.present) {
      map['muscle_map_id'] = Variable<int>(muscleMapId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MuscleMapsForWorkoutsCompanion(')
          ..write('workoutId: $workoutId, ')
          ..write('muscleMapId: $muscleMapId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutWavesTable extends WorkoutWaves
    with TableInfo<$WorkoutWavesTable, WorkoutWave> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutWavesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timesMeta = const VerificationMeta('times');
  @override
  late final GeneratedColumn<int> times = GeneratedColumn<int>(
      'times', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, name, times];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_waves';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutWave> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('times')) {
      context.handle(
          _timesMeta, times.isAcceptableOrUnknown(data['times']!, _timesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutWave map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutWave(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      times: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}times'])!,
    );
  }

  @override
  $WorkoutWavesTable createAlias(String alias) {
    return $WorkoutWavesTable(attachedDatabase, alias);
  }
}

class WorkoutWave extends DataClass implements Insertable<WorkoutWave> {
  final int id;
  final String name;
  final int times;
  const WorkoutWave(
      {required this.id, required this.name, required this.times});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['times'] = Variable<int>(times);
    return map;
  }

  WorkoutWavesCompanion toCompanion(bool nullToAbsent) {
    return WorkoutWavesCompanion(
      id: Value(id),
      name: Value(name),
      times: Value(times),
    );
  }

  factory WorkoutWave.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutWave(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      times: serializer.fromJson<int>(json['times']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'times': serializer.toJson<int>(times),
    };
  }

  WorkoutWave copyWith({int? id, String? name, int? times}) => WorkoutWave(
        id: id ?? this.id,
        name: name ?? this.name,
        times: times ?? this.times,
      );
  WorkoutWave copyWithCompanion(WorkoutWavesCompanion data) {
    return WorkoutWave(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      times: data.times.present ? data.times.value : this.times,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutWave(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('times: $times')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, times);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutWave &&
          other.id == this.id &&
          other.name == this.name &&
          other.times == this.times);
}

class WorkoutWavesCompanion extends UpdateCompanion<WorkoutWave> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> times;
  const WorkoutWavesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.times = const Value.absent(),
  });
  WorkoutWavesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.times = const Value.absent(),
  }) : name = Value(name);
  static Insertable<WorkoutWave> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? times,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (times != null) 'times': times,
    });
  }

  WorkoutWavesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? times}) {
    return WorkoutWavesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      times: times ?? this.times,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (times.present) {
      map['times'] = Variable<int>(times.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutWavesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('times: $times')
          ..write(')'))
        .toString();
  }
}

class $WorkoutsInWavesTable extends WorkoutsInWaves
    with TableInfo<$WorkoutsInWavesTable, WorkoutsInWave> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutsInWavesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<int> workoutId = GeneratedColumn<int>(
      'workout_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES workouts (id) ON DELETE CASCADE'));
  static const VerificationMeta _workoutWaveIdMeta =
      const VerificationMeta('workoutWaveId');
  @override
  late final GeneratedColumn<int> workoutWaveId = GeneratedColumn<int>(
      'workout_wave_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES workout_waves (id) ON DELETE CASCADE'));
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [workoutId, workoutWaveId, position];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workouts_in_waves';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutsInWave> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    } else if (isInserting) {
      context.missing(_workoutIdMeta);
    }
    if (data.containsKey('workout_wave_id')) {
      context.handle(
          _workoutWaveIdMeta,
          workoutWaveId.isAcceptableOrUnknown(
              data['workout_wave_id']!, _workoutWaveIdMeta));
    } else if (isInserting) {
      context.missing(_workoutWaveIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workoutId, workoutWaveId, position};
  @override
  WorkoutsInWave map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutsInWave(
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}workout_id'])!,
      workoutWaveId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}workout_wave_id'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
    );
  }

  @override
  $WorkoutsInWavesTable createAlias(String alias) {
    return $WorkoutsInWavesTable(attachedDatabase, alias);
  }
}

class WorkoutsInWave extends DataClass implements Insertable<WorkoutsInWave> {
  final int workoutId;
  final int workoutWaveId;
  final int position;
  const WorkoutsInWave(
      {required this.workoutId,
      required this.workoutWaveId,
      required this.position});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['workout_id'] = Variable<int>(workoutId);
    map['workout_wave_id'] = Variable<int>(workoutWaveId);
    map['position'] = Variable<int>(position);
    return map;
  }

  WorkoutsInWavesCompanion toCompanion(bool nullToAbsent) {
    return WorkoutsInWavesCompanion(
      workoutId: Value(workoutId),
      workoutWaveId: Value(workoutWaveId),
      position: Value(position),
    );
  }

  factory WorkoutsInWave.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutsInWave(
      workoutId: serializer.fromJson<int>(json['workoutId']),
      workoutWaveId: serializer.fromJson<int>(json['workoutWaveId']),
      position: serializer.fromJson<int>(json['position']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workoutId': serializer.toJson<int>(workoutId),
      'workoutWaveId': serializer.toJson<int>(workoutWaveId),
      'position': serializer.toJson<int>(position),
    };
  }

  WorkoutsInWave copyWith(
          {int? workoutId, int? workoutWaveId, int? position}) =>
      WorkoutsInWave(
        workoutId: workoutId ?? this.workoutId,
        workoutWaveId: workoutWaveId ?? this.workoutWaveId,
        position: position ?? this.position,
      );
  WorkoutsInWave copyWithCompanion(WorkoutsInWavesCompanion data) {
    return WorkoutsInWave(
      workoutId: data.workoutId.present ? data.workoutId.value : this.workoutId,
      workoutWaveId: data.workoutWaveId.present
          ? data.workoutWaveId.value
          : this.workoutWaveId,
      position: data.position.present ? data.position.value : this.position,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsInWave(')
          ..write('workoutId: $workoutId, ')
          ..write('workoutWaveId: $workoutWaveId, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(workoutId, workoutWaveId, position);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutsInWave &&
          other.workoutId == this.workoutId &&
          other.workoutWaveId == this.workoutWaveId &&
          other.position == this.position);
}

class WorkoutsInWavesCompanion extends UpdateCompanion<WorkoutsInWave> {
  final Value<int> workoutId;
  final Value<int> workoutWaveId;
  final Value<int> position;
  final Value<int> rowid;
  const WorkoutsInWavesCompanion({
    this.workoutId = const Value.absent(),
    this.workoutWaveId = const Value.absent(),
    this.position = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutsInWavesCompanion.insert({
    required int workoutId,
    required int workoutWaveId,
    required int position,
    this.rowid = const Value.absent(),
  })  : workoutId = Value(workoutId),
        workoutWaveId = Value(workoutWaveId),
        position = Value(position);
  static Insertable<WorkoutsInWave> custom({
    Expression<int>? workoutId,
    Expression<int>? workoutWaveId,
    Expression<int>? position,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (workoutId != null) 'workout_id': workoutId,
      if (workoutWaveId != null) 'workout_wave_id': workoutWaveId,
      if (position != null) 'position': position,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutsInWavesCompanion copyWith(
      {Value<int>? workoutId,
      Value<int>? workoutWaveId,
      Value<int>? position,
      Value<int>? rowid}) {
    return WorkoutsInWavesCompanion(
      workoutId: workoutId ?? this.workoutId,
      workoutWaveId: workoutWaveId ?? this.workoutWaveId,
      position: position ?? this.position,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workoutId.present) {
      map['workout_id'] = Variable<int>(workoutId.value);
    }
    if (workoutWaveId.present) {
      map['workout_wave_id'] = Variable<int>(workoutWaveId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsInWavesCompanion(')
          ..write('workoutId: $workoutId, ')
          ..write('workoutWaveId: $workoutWaveId, ')
          ..write('position: $position, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutsWithMeasurementTable extends WorkoutsWithMeasurement
    with TableInfo<$WorkoutsWithMeasurementTable, WorkoutsWithMeasurementData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutsWithMeasurementTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<int> workoutId = GeneratedColumn<int>(
      'workout_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES workouts (id) ON DELETE CASCADE'));
  static const VerificationMeta _repititionMeta =
      const VerificationMeta('repitition');
  @override
  late final GeneratedColumn<int> repitition = GeneratedColumn<int>(
      'repitition', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _repititionTypeMeta =
      const VerificationMeta('repititionType');
  @override
  late final GeneratedColumn<String> repititionType = GeneratedColumn<String>(
      'repitition_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, workoutId, repitition, repititionType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workouts_with_measurement';
  @override
  VerificationContext validateIntegrity(
      Insertable<WorkoutsWithMeasurementData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    } else if (isInserting) {
      context.missing(_workoutIdMeta);
    }
    if (data.containsKey('repitition')) {
      context.handle(
          _repititionMeta,
          repitition.isAcceptableOrUnknown(
              data['repitition']!, _repititionMeta));
    } else if (isInserting) {
      context.missing(_repititionMeta);
    }
    if (data.containsKey('repitition_type')) {
      context.handle(
          _repititionTypeMeta,
          repititionType.isAcceptableOrUnknown(
              data['repitition_type']!, _repititionTypeMeta));
    } else if (isInserting) {
      context.missing(_repititionTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {workoutId, repitition, repititionType},
      ];
  @override
  WorkoutsWithMeasurementData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutsWithMeasurementData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}workout_id'])!,
      repitition: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}repitition'])!,
      repititionType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}repitition_type'])!,
    );
  }

  @override
  $WorkoutsWithMeasurementTable createAlias(String alias) {
    return $WorkoutsWithMeasurementTable(attachedDatabase, alias);
  }
}

class WorkoutsWithMeasurementData extends DataClass
    implements Insertable<WorkoutsWithMeasurementData> {
  final int id;
  final int workoutId;
  final int repitition;
  final String repititionType;
  const WorkoutsWithMeasurementData(
      {required this.id,
      required this.workoutId,
      required this.repitition,
      required this.repititionType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['workout_id'] = Variable<int>(workoutId);
    map['repitition'] = Variable<int>(repitition);
    map['repitition_type'] = Variable<String>(repititionType);
    return map;
  }

  WorkoutsWithMeasurementCompanion toCompanion(bool nullToAbsent) {
    return WorkoutsWithMeasurementCompanion(
      id: Value(id),
      workoutId: Value(workoutId),
      repitition: Value(repitition),
      repititionType: Value(repititionType),
    );
  }

  factory WorkoutsWithMeasurementData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutsWithMeasurementData(
      id: serializer.fromJson<int>(json['id']),
      workoutId: serializer.fromJson<int>(json['workoutId']),
      repitition: serializer.fromJson<int>(json['repitition']),
      repititionType: serializer.fromJson<String>(json['repititionType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workoutId': serializer.toJson<int>(workoutId),
      'repitition': serializer.toJson<int>(repitition),
      'repititionType': serializer.toJson<String>(repititionType),
    };
  }

  WorkoutsWithMeasurementData copyWith(
          {int? id, int? workoutId, int? repitition, String? repititionType}) =>
      WorkoutsWithMeasurementData(
        id: id ?? this.id,
        workoutId: workoutId ?? this.workoutId,
        repitition: repitition ?? this.repitition,
        repititionType: repititionType ?? this.repititionType,
      );
  WorkoutsWithMeasurementData copyWithCompanion(
      WorkoutsWithMeasurementCompanion data) {
    return WorkoutsWithMeasurementData(
      id: data.id.present ? data.id.value : this.id,
      workoutId: data.workoutId.present ? data.workoutId.value : this.workoutId,
      repitition:
          data.repitition.present ? data.repitition.value : this.repitition,
      repititionType: data.repititionType.present
          ? data.repititionType.value
          : this.repititionType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsWithMeasurementData(')
          ..write('id: $id, ')
          ..write('workoutId: $workoutId, ')
          ..write('repitition: $repitition, ')
          ..write('repititionType: $repititionType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, workoutId, repitition, repititionType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutsWithMeasurementData &&
          other.id == this.id &&
          other.workoutId == this.workoutId &&
          other.repitition == this.repitition &&
          other.repititionType == this.repititionType);
}

class WorkoutsWithMeasurementCompanion
    extends UpdateCompanion<WorkoutsWithMeasurementData> {
  final Value<int> id;
  final Value<int> workoutId;
  final Value<int> repitition;
  final Value<String> repititionType;
  const WorkoutsWithMeasurementCompanion({
    this.id = const Value.absent(),
    this.workoutId = const Value.absent(),
    this.repitition = const Value.absent(),
    this.repititionType = const Value.absent(),
  });
  WorkoutsWithMeasurementCompanion.insert({
    this.id = const Value.absent(),
    required int workoutId,
    required int repitition,
    required String repititionType,
  })  : workoutId = Value(workoutId),
        repitition = Value(repitition),
        repititionType = Value(repititionType);
  static Insertable<WorkoutsWithMeasurementData> custom({
    Expression<int>? id,
    Expression<int>? workoutId,
    Expression<int>? repitition,
    Expression<String>? repititionType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutId != null) 'workout_id': workoutId,
      if (repitition != null) 'repitition': repitition,
      if (repititionType != null) 'repitition_type': repititionType,
    });
  }

  WorkoutsWithMeasurementCompanion copyWith(
      {Value<int>? id,
      Value<int>? workoutId,
      Value<int>? repitition,
      Value<String>? repititionType}) {
    return WorkoutsWithMeasurementCompanion(
      id: id ?? this.id,
      workoutId: workoutId ?? this.workoutId,
      repitition: repitition ?? this.repitition,
      repititionType: repititionType ?? this.repititionType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<int>(workoutId.value);
    }
    if (repitition.present) {
      map['repitition'] = Variable<int>(repitition.value);
    }
    if (repititionType.present) {
      map['repitition_type'] = Variable<String>(repititionType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsWithMeasurementCompanion(')
          ..write('id: $id, ')
          ..write('workoutId: $workoutId, ')
          ..write('repitition: $repitition, ')
          ..write('repititionType: $repititionType')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MuscleMapsTable muscleMaps = $MuscleMapsTable(this);
  late final $WorkoutsTable workouts = $WorkoutsTable(this);
  late final $MuscleMapsForWorkoutsTable muscleMapsForWorkouts =
      $MuscleMapsForWorkoutsTable(this);
  late final $WorkoutWavesTable workoutWaves = $WorkoutWavesTable(this);
  late final $WorkoutsInWavesTable workoutsInWaves =
      $WorkoutsInWavesTable(this);
  late final $WorkoutsWithMeasurementTable workoutsWithMeasurement =
      $WorkoutsWithMeasurementTable(this);
  late final MuscleMapDao muscleMapDao = MuscleMapDao(this as AppDatabase);
  late final WorkoutDao workoutDao = WorkoutDao(this as AppDatabase);
  late final WorkoutWaveDao workoutWaveDao =
      WorkoutWaveDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        muscleMaps,
        workouts,
        muscleMapsForWorkouts,
        workoutWaves,
        workoutsInWaves,
        workoutsWithMeasurement
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('workouts',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('muscle_maps_for_workouts', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('muscle_maps',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('muscle_maps_for_workouts', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('workouts',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('workouts_in_waves', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('workout_waves',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('workouts_in_waves', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('workouts',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('workouts_with_measurement', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$MuscleMapsTableCreateCompanionBuilder = MuscleMapsCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$MuscleMapsTableUpdateCompanionBuilder = MuscleMapsCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$MuscleMapsTableReferences
    extends BaseReferences<_$AppDatabase, $MuscleMapsTable, MuscleMap> {
  $$MuscleMapsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MuscleMapsForWorkoutsTable,
      List<MuscleMapsForWorkout>> _muscleMapsForWorkoutsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.muscleMapsForWorkouts,
          aliasName: $_aliasNameGenerator(
              db.muscleMaps.id, db.muscleMapsForWorkouts.muscleMapId));

  $$MuscleMapsForWorkoutsTableProcessedTableManager
      get muscleMapsForWorkoutsRefs {
    final manager = $$MuscleMapsForWorkoutsTableTableManager(
            $_db, $_db.muscleMapsForWorkouts)
        .filter((f) => f.muscleMapId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_muscleMapsForWorkoutsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MuscleMapsTableFilterComposer
    extends Composer<_$AppDatabase, $MuscleMapsTable> {
  $$MuscleMapsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> muscleMapsForWorkoutsRefs(
      Expression<bool> Function($$MuscleMapsForWorkoutsTableFilterComposer f)
          f) {
    final $$MuscleMapsForWorkoutsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.muscleMapsForWorkouts,
            getReferencedColumn: (t) => t.muscleMapId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MuscleMapsForWorkoutsTableFilterComposer(
                  $db: $db,
                  $table: $db.muscleMapsForWorkouts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$MuscleMapsTableOrderingComposer
    extends Composer<_$AppDatabase, $MuscleMapsTable> {
  $$MuscleMapsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$MuscleMapsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MuscleMapsTable> {
  $$MuscleMapsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> muscleMapsForWorkoutsRefs<T extends Object>(
      Expression<T> Function($$MuscleMapsForWorkoutsTableAnnotationComposer a)
          f) {
    final $$MuscleMapsForWorkoutsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.muscleMapsForWorkouts,
            getReferencedColumn: (t) => t.muscleMapId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MuscleMapsForWorkoutsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.muscleMapsForWorkouts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$MuscleMapsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MuscleMapsTable,
    MuscleMap,
    $$MuscleMapsTableFilterComposer,
    $$MuscleMapsTableOrderingComposer,
    $$MuscleMapsTableAnnotationComposer,
    $$MuscleMapsTableCreateCompanionBuilder,
    $$MuscleMapsTableUpdateCompanionBuilder,
    (MuscleMap, $$MuscleMapsTableReferences),
    MuscleMap,
    PrefetchHooks Function({bool muscleMapsForWorkoutsRefs})> {
  $$MuscleMapsTableTableManager(_$AppDatabase db, $MuscleMapsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MuscleMapsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MuscleMapsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MuscleMapsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              MuscleMapsCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              MuscleMapsCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MuscleMapsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({muscleMapsForWorkoutsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (muscleMapsForWorkoutsRefs) db.muscleMapsForWorkouts
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (muscleMapsForWorkoutsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MuscleMapsTableReferences
                            ._muscleMapsForWorkoutsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MuscleMapsTableReferences(db, table, p0)
                                .muscleMapsForWorkoutsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.muscleMapId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MuscleMapsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MuscleMapsTable,
    MuscleMap,
    $$MuscleMapsTableFilterComposer,
    $$MuscleMapsTableOrderingComposer,
    $$MuscleMapsTableAnnotationComposer,
    $$MuscleMapsTableCreateCompanionBuilder,
    $$MuscleMapsTableUpdateCompanionBuilder,
    (MuscleMap, $$MuscleMapsTableReferences),
    MuscleMap,
    PrefetchHooks Function({bool muscleMapsForWorkoutsRefs})>;
typedef $$WorkoutsTableCreateCompanionBuilder = WorkoutsCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$WorkoutsTableUpdateCompanionBuilder = WorkoutsCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$WorkoutsTableReferences
    extends BaseReferences<_$AppDatabase, $WorkoutsTable, Workout> {
  $$WorkoutsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MuscleMapsForWorkoutsTable,
      List<MuscleMapsForWorkout>> _muscleMapsForWorkoutsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.muscleMapsForWorkouts,
          aliasName: $_aliasNameGenerator(
              db.workouts.id, db.muscleMapsForWorkouts.workoutId));

  $$MuscleMapsForWorkoutsTableProcessedTableManager
      get muscleMapsForWorkoutsRefs {
    final manager = $$MuscleMapsForWorkoutsTableTableManager(
            $_db, $_db.muscleMapsForWorkouts)
        .filter((f) => f.workoutId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_muscleMapsForWorkoutsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$WorkoutsInWavesTable, List<WorkoutsInWave>>
      _workoutsInWavesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.workoutsInWaves,
              aliasName: $_aliasNameGenerator(
                  db.workouts.id, db.workoutsInWaves.workoutId));

  $$WorkoutsInWavesTableProcessedTableManager get workoutsInWavesRefs {
    final manager =
        $$WorkoutsInWavesTableTableManager($_db, $_db.workoutsInWaves)
            .filter((f) => f.workoutId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_workoutsInWavesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$WorkoutsWithMeasurementTable,
      List<WorkoutsWithMeasurementData>> _workoutsWithMeasurementRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.workoutsWithMeasurement,
          aliasName: $_aliasNameGenerator(
              db.workouts.id, db.workoutsWithMeasurement.workoutId));

  $$WorkoutsWithMeasurementTableProcessedTableManager
      get workoutsWithMeasurementRefs {
    final manager = $$WorkoutsWithMeasurementTableTableManager(
            $_db, $_db.workoutsWithMeasurement)
        .filter((f) => f.workoutId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_workoutsWithMeasurementRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WorkoutsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> muscleMapsForWorkoutsRefs(
      Expression<bool> Function($$MuscleMapsForWorkoutsTableFilterComposer f)
          f) {
    final $$MuscleMapsForWorkoutsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.muscleMapsForWorkouts,
            getReferencedColumn: (t) => t.workoutId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MuscleMapsForWorkoutsTableFilterComposer(
                  $db: $db,
                  $table: $db.muscleMapsForWorkouts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> workoutsInWavesRefs(
      Expression<bool> Function($$WorkoutsInWavesTableFilterComposer f) f) {
    final $$WorkoutsInWavesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.workoutsInWaves,
        getReferencedColumn: (t) => t.workoutId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsInWavesTableFilterComposer(
              $db: $db,
              $table: $db.workoutsInWaves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> workoutsWithMeasurementRefs(
      Expression<bool> Function($$WorkoutsWithMeasurementTableFilterComposer f)
          f) {
    final $$WorkoutsWithMeasurementTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.workoutsWithMeasurement,
            getReferencedColumn: (t) => t.workoutId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$WorkoutsWithMeasurementTableFilterComposer(
                  $db: $db,
                  $table: $db.workoutsWithMeasurement,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$WorkoutsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$WorkoutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> muscleMapsForWorkoutsRefs<T extends Object>(
      Expression<T> Function($$MuscleMapsForWorkoutsTableAnnotationComposer a)
          f) {
    final $$MuscleMapsForWorkoutsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.muscleMapsForWorkouts,
            getReferencedColumn: (t) => t.workoutId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MuscleMapsForWorkoutsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.muscleMapsForWorkouts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> workoutsInWavesRefs<T extends Object>(
      Expression<T> Function($$WorkoutsInWavesTableAnnotationComposer a) f) {
    final $$WorkoutsInWavesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.workoutsInWaves,
        getReferencedColumn: (t) => t.workoutId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsInWavesTableAnnotationComposer(
              $db: $db,
              $table: $db.workoutsInWaves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> workoutsWithMeasurementRefs<T extends Object>(
      Expression<T> Function($$WorkoutsWithMeasurementTableAnnotationComposer a)
          f) {
    final $$WorkoutsWithMeasurementTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.workoutsWithMeasurement,
            getReferencedColumn: (t) => t.workoutId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$WorkoutsWithMeasurementTableAnnotationComposer(
                  $db: $db,
                  $table: $db.workoutsWithMeasurement,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$WorkoutsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutsTable,
    Workout,
    $$WorkoutsTableFilterComposer,
    $$WorkoutsTableOrderingComposer,
    $$WorkoutsTableAnnotationComposer,
    $$WorkoutsTableCreateCompanionBuilder,
    $$WorkoutsTableUpdateCompanionBuilder,
    (Workout, $$WorkoutsTableReferences),
    Workout,
    PrefetchHooks Function(
        {bool muscleMapsForWorkoutsRefs,
        bool workoutsInWavesRefs,
        bool workoutsWithMeasurementRefs})> {
  $$WorkoutsTableTableManager(_$AppDatabase db, $WorkoutsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              WorkoutsCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              WorkoutsCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$WorkoutsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {muscleMapsForWorkoutsRefs = false,
              workoutsInWavesRefs = false,
              workoutsWithMeasurementRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (muscleMapsForWorkoutsRefs) db.muscleMapsForWorkouts,
                if (workoutsInWavesRefs) db.workoutsInWaves,
                if (workoutsWithMeasurementRefs) db.workoutsWithMeasurement
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (muscleMapsForWorkoutsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$WorkoutsTableReferences
                            ._muscleMapsForWorkoutsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkoutsTableReferences(db, table, p0)
                                .muscleMapsForWorkoutsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workoutId == item.id),
                        typedResults: items),
                  if (workoutsInWavesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$WorkoutsTableReferences
                            ._workoutsInWavesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkoutsTableReferences(db, table, p0)
                                .workoutsInWavesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workoutId == item.id),
                        typedResults: items),
                  if (workoutsWithMeasurementRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$WorkoutsTableReferences
                            ._workoutsWithMeasurementRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkoutsTableReferences(db, table, p0)
                                .workoutsWithMeasurementRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workoutId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WorkoutsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkoutsTable,
    Workout,
    $$WorkoutsTableFilterComposer,
    $$WorkoutsTableOrderingComposer,
    $$WorkoutsTableAnnotationComposer,
    $$WorkoutsTableCreateCompanionBuilder,
    $$WorkoutsTableUpdateCompanionBuilder,
    (Workout, $$WorkoutsTableReferences),
    Workout,
    PrefetchHooks Function(
        {bool muscleMapsForWorkoutsRefs,
        bool workoutsInWavesRefs,
        bool workoutsWithMeasurementRefs})>;
typedef $$MuscleMapsForWorkoutsTableCreateCompanionBuilder
    = MuscleMapsForWorkoutsCompanion Function({
  required int workoutId,
  required int muscleMapId,
  Value<int> rowid,
});
typedef $$MuscleMapsForWorkoutsTableUpdateCompanionBuilder
    = MuscleMapsForWorkoutsCompanion Function({
  Value<int> workoutId,
  Value<int> muscleMapId,
  Value<int> rowid,
});

final class $$MuscleMapsForWorkoutsTableReferences extends BaseReferences<
    _$AppDatabase, $MuscleMapsForWorkoutsTable, MuscleMapsForWorkout> {
  $$MuscleMapsForWorkoutsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutsTable _workoutIdTable(_$AppDatabase db) =>
      db.workouts.createAlias($_aliasNameGenerator(
          db.muscleMapsForWorkouts.workoutId, db.workouts.id));

  $$WorkoutsTableProcessedTableManager? get workoutId {
    if ($_item.workoutId == null) return null;
    final manager = $$WorkoutsTableTableManager($_db, $_db.workouts)
        .filter((f) => f.id($_item.workoutId!));
    final item = $_typedResult.readTableOrNull(_workoutIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MuscleMapsTable _muscleMapIdTable(_$AppDatabase db) =>
      db.muscleMaps.createAlias($_aliasNameGenerator(
          db.muscleMapsForWorkouts.muscleMapId, db.muscleMaps.id));

  $$MuscleMapsTableProcessedTableManager? get muscleMapId {
    if ($_item.muscleMapId == null) return null;
    final manager = $$MuscleMapsTableTableManager($_db, $_db.muscleMaps)
        .filter((f) => f.id($_item.muscleMapId!));
    final item = $_typedResult.readTableOrNull(_muscleMapIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MuscleMapsForWorkoutsTableFilterComposer
    extends Composer<_$AppDatabase, $MuscleMapsForWorkoutsTable> {
  $$MuscleMapsForWorkoutsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorkoutsTableFilterComposer get workoutId {
    final $$WorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableFilterComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MuscleMapsTableFilterComposer get muscleMapId {
    final $$MuscleMapsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscleMapId,
        referencedTable: $db.muscleMaps,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MuscleMapsTableFilterComposer(
              $db: $db,
              $table: $db.muscleMaps,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MuscleMapsForWorkoutsTableOrderingComposer
    extends Composer<_$AppDatabase, $MuscleMapsForWorkoutsTable> {
  $$MuscleMapsForWorkoutsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorkoutsTableOrderingComposer get workoutId {
    final $$WorkoutsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableOrderingComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MuscleMapsTableOrderingComposer get muscleMapId {
    final $$MuscleMapsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscleMapId,
        referencedTable: $db.muscleMaps,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MuscleMapsTableOrderingComposer(
              $db: $db,
              $table: $db.muscleMaps,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MuscleMapsForWorkoutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MuscleMapsForWorkoutsTable> {
  $$MuscleMapsForWorkoutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$WorkoutsTableAnnotationComposer get workoutId {
    final $$WorkoutsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableAnnotationComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MuscleMapsTableAnnotationComposer get muscleMapId {
    final $$MuscleMapsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscleMapId,
        referencedTable: $db.muscleMaps,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MuscleMapsTableAnnotationComposer(
              $db: $db,
              $table: $db.muscleMaps,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MuscleMapsForWorkoutsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MuscleMapsForWorkoutsTable,
    MuscleMapsForWorkout,
    $$MuscleMapsForWorkoutsTableFilterComposer,
    $$MuscleMapsForWorkoutsTableOrderingComposer,
    $$MuscleMapsForWorkoutsTableAnnotationComposer,
    $$MuscleMapsForWorkoutsTableCreateCompanionBuilder,
    $$MuscleMapsForWorkoutsTableUpdateCompanionBuilder,
    (MuscleMapsForWorkout, $$MuscleMapsForWorkoutsTableReferences),
    MuscleMapsForWorkout,
    PrefetchHooks Function({bool workoutId, bool muscleMapId})> {
  $$MuscleMapsForWorkoutsTableTableManager(
      _$AppDatabase db, $MuscleMapsForWorkoutsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MuscleMapsForWorkoutsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MuscleMapsForWorkoutsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MuscleMapsForWorkoutsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> workoutId = const Value.absent(),
            Value<int> muscleMapId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MuscleMapsForWorkoutsCompanion(
            workoutId: workoutId,
            muscleMapId: muscleMapId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int workoutId,
            required int muscleMapId,
            Value<int> rowid = const Value.absent(),
          }) =>
              MuscleMapsForWorkoutsCompanion.insert(
            workoutId: workoutId,
            muscleMapId: muscleMapId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MuscleMapsForWorkoutsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workoutId = false, muscleMapId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workoutId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workoutId,
                    referencedTable: $$MuscleMapsForWorkoutsTableReferences
                        ._workoutIdTable(db),
                    referencedColumn: $$MuscleMapsForWorkoutsTableReferences
                        ._workoutIdTable(db)
                        .id,
                  ) as T;
                }
                if (muscleMapId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.muscleMapId,
                    referencedTable: $$MuscleMapsForWorkoutsTableReferences
                        ._muscleMapIdTable(db),
                    referencedColumn: $$MuscleMapsForWorkoutsTableReferences
                        ._muscleMapIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MuscleMapsForWorkoutsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $MuscleMapsForWorkoutsTable,
        MuscleMapsForWorkout,
        $$MuscleMapsForWorkoutsTableFilterComposer,
        $$MuscleMapsForWorkoutsTableOrderingComposer,
        $$MuscleMapsForWorkoutsTableAnnotationComposer,
        $$MuscleMapsForWorkoutsTableCreateCompanionBuilder,
        $$MuscleMapsForWorkoutsTableUpdateCompanionBuilder,
        (MuscleMapsForWorkout, $$MuscleMapsForWorkoutsTableReferences),
        MuscleMapsForWorkout,
        PrefetchHooks Function({bool workoutId, bool muscleMapId})>;
typedef $$WorkoutWavesTableCreateCompanionBuilder = WorkoutWavesCompanion
    Function({
  Value<int> id,
  required String name,
  Value<int> times,
});
typedef $$WorkoutWavesTableUpdateCompanionBuilder = WorkoutWavesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int> times,
});

final class $$WorkoutWavesTableReferences
    extends BaseReferences<_$AppDatabase, $WorkoutWavesTable, WorkoutWave> {
  $$WorkoutWavesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WorkoutsInWavesTable, List<WorkoutsInWave>>
      _workoutsInWavesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.workoutsInWaves,
              aliasName: $_aliasNameGenerator(
                  db.workoutWaves.id, db.workoutsInWaves.workoutWaveId));

  $$WorkoutsInWavesTableProcessedTableManager get workoutsInWavesRefs {
    final manager =
        $$WorkoutsInWavesTableTableManager($_db, $_db.workoutsInWaves)
            .filter((f) => f.workoutWaveId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_workoutsInWavesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WorkoutWavesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutWavesTable> {
  $$WorkoutWavesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get times => $composableBuilder(
      column: $table.times, builder: (column) => ColumnFilters(column));

  Expression<bool> workoutsInWavesRefs(
      Expression<bool> Function($$WorkoutsInWavesTableFilterComposer f) f) {
    final $$WorkoutsInWavesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.workoutsInWaves,
        getReferencedColumn: (t) => t.workoutWaveId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsInWavesTableFilterComposer(
              $db: $db,
              $table: $db.workoutsInWaves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorkoutWavesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutWavesTable> {
  $$WorkoutWavesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get times => $composableBuilder(
      column: $table.times, builder: (column) => ColumnOrderings(column));
}

class $$WorkoutWavesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutWavesTable> {
  $$WorkoutWavesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get times =>
      $composableBuilder(column: $table.times, builder: (column) => column);

  Expression<T> workoutsInWavesRefs<T extends Object>(
      Expression<T> Function($$WorkoutsInWavesTableAnnotationComposer a) f) {
    final $$WorkoutsInWavesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.workoutsInWaves,
        getReferencedColumn: (t) => t.workoutWaveId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsInWavesTableAnnotationComposer(
              $db: $db,
              $table: $db.workoutsInWaves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorkoutWavesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutWavesTable,
    WorkoutWave,
    $$WorkoutWavesTableFilterComposer,
    $$WorkoutWavesTableOrderingComposer,
    $$WorkoutWavesTableAnnotationComposer,
    $$WorkoutWavesTableCreateCompanionBuilder,
    $$WorkoutWavesTableUpdateCompanionBuilder,
    (WorkoutWave, $$WorkoutWavesTableReferences),
    WorkoutWave,
    PrefetchHooks Function({bool workoutsInWavesRefs})> {
  $$WorkoutWavesTableTableManager(_$AppDatabase db, $WorkoutWavesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutWavesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutWavesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutWavesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> times = const Value.absent(),
          }) =>
              WorkoutWavesCompanion(
            id: id,
            name: name,
            times: times,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<int> times = const Value.absent(),
          }) =>
              WorkoutWavesCompanion.insert(
            id: id,
            name: name,
            times: times,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkoutWavesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workoutsInWavesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (workoutsInWavesRefs) db.workoutsInWaves
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (workoutsInWavesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$WorkoutWavesTableReferences
                            ._workoutsInWavesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkoutWavesTableReferences(db, table, p0)
                                .workoutsInWavesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workoutWaveId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WorkoutWavesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkoutWavesTable,
    WorkoutWave,
    $$WorkoutWavesTableFilterComposer,
    $$WorkoutWavesTableOrderingComposer,
    $$WorkoutWavesTableAnnotationComposer,
    $$WorkoutWavesTableCreateCompanionBuilder,
    $$WorkoutWavesTableUpdateCompanionBuilder,
    (WorkoutWave, $$WorkoutWavesTableReferences),
    WorkoutWave,
    PrefetchHooks Function({bool workoutsInWavesRefs})>;
typedef $$WorkoutsInWavesTableCreateCompanionBuilder = WorkoutsInWavesCompanion
    Function({
  required int workoutId,
  required int workoutWaveId,
  required int position,
  Value<int> rowid,
});
typedef $$WorkoutsInWavesTableUpdateCompanionBuilder = WorkoutsInWavesCompanion
    Function({
  Value<int> workoutId,
  Value<int> workoutWaveId,
  Value<int> position,
  Value<int> rowid,
});

final class $$WorkoutsInWavesTableReferences extends BaseReferences<
    _$AppDatabase, $WorkoutsInWavesTable, WorkoutsInWave> {
  $$WorkoutsInWavesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutsTable _workoutIdTable(_$AppDatabase db) =>
      db.workouts.createAlias(
          $_aliasNameGenerator(db.workoutsInWaves.workoutId, db.workouts.id));

  $$WorkoutsTableProcessedTableManager? get workoutId {
    if ($_item.workoutId == null) return null;
    final manager = $$WorkoutsTableTableManager($_db, $_db.workouts)
        .filter((f) => f.id($_item.workoutId!));
    final item = $_typedResult.readTableOrNull(_workoutIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $WorkoutWavesTable _workoutWaveIdTable(_$AppDatabase db) =>
      db.workoutWaves.createAlias($_aliasNameGenerator(
          db.workoutsInWaves.workoutWaveId, db.workoutWaves.id));

  $$WorkoutWavesTableProcessedTableManager? get workoutWaveId {
    if ($_item.workoutWaveId == null) return null;
    final manager = $$WorkoutWavesTableTableManager($_db, $_db.workoutWaves)
        .filter((f) => f.id($_item.workoutWaveId!));
    final item = $_typedResult.readTableOrNull(_workoutWaveIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$WorkoutsInWavesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutsInWavesTable> {
  $$WorkoutsInWavesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnFilters(column));

  $$WorkoutsTableFilterComposer get workoutId {
    final $$WorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableFilterComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WorkoutWavesTableFilterComposer get workoutWaveId {
    final $$WorkoutWavesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutWaveId,
        referencedTable: $db.workoutWaves,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutWavesTableFilterComposer(
              $db: $db,
              $table: $db.workoutWaves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkoutsInWavesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutsInWavesTable> {
  $$WorkoutsInWavesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnOrderings(column));

  $$WorkoutsTableOrderingComposer get workoutId {
    final $$WorkoutsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableOrderingComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WorkoutWavesTableOrderingComposer get workoutWaveId {
    final $$WorkoutWavesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutWaveId,
        referencedTable: $db.workoutWaves,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutWavesTableOrderingComposer(
              $db: $db,
              $table: $db.workoutWaves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkoutsInWavesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutsInWavesTable> {
  $$WorkoutsInWavesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  $$WorkoutsTableAnnotationComposer get workoutId {
    final $$WorkoutsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableAnnotationComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WorkoutWavesTableAnnotationComposer get workoutWaveId {
    final $$WorkoutWavesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutWaveId,
        referencedTable: $db.workoutWaves,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutWavesTableAnnotationComposer(
              $db: $db,
              $table: $db.workoutWaves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkoutsInWavesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutsInWavesTable,
    WorkoutsInWave,
    $$WorkoutsInWavesTableFilterComposer,
    $$WorkoutsInWavesTableOrderingComposer,
    $$WorkoutsInWavesTableAnnotationComposer,
    $$WorkoutsInWavesTableCreateCompanionBuilder,
    $$WorkoutsInWavesTableUpdateCompanionBuilder,
    (WorkoutsInWave, $$WorkoutsInWavesTableReferences),
    WorkoutsInWave,
    PrefetchHooks Function({bool workoutId, bool workoutWaveId})> {
  $$WorkoutsInWavesTableTableManager(
      _$AppDatabase db, $WorkoutsInWavesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutsInWavesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutsInWavesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutsInWavesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> workoutId = const Value.absent(),
            Value<int> workoutWaveId = const Value.absent(),
            Value<int> position = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutsInWavesCompanion(
            workoutId: workoutId,
            workoutWaveId: workoutWaveId,
            position: position,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int workoutId,
            required int workoutWaveId,
            required int position,
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutsInWavesCompanion.insert(
            workoutId: workoutId,
            workoutWaveId: workoutWaveId,
            position: position,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkoutsInWavesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workoutId = false, workoutWaveId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workoutId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workoutId,
                    referencedTable:
                        $$WorkoutsInWavesTableReferences._workoutIdTable(db),
                    referencedColumn:
                        $$WorkoutsInWavesTableReferences._workoutIdTable(db).id,
                  ) as T;
                }
                if (workoutWaveId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workoutWaveId,
                    referencedTable: $$WorkoutsInWavesTableReferences
                        ._workoutWaveIdTable(db),
                    referencedColumn: $$WorkoutsInWavesTableReferences
                        ._workoutWaveIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$WorkoutsInWavesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkoutsInWavesTable,
    WorkoutsInWave,
    $$WorkoutsInWavesTableFilterComposer,
    $$WorkoutsInWavesTableOrderingComposer,
    $$WorkoutsInWavesTableAnnotationComposer,
    $$WorkoutsInWavesTableCreateCompanionBuilder,
    $$WorkoutsInWavesTableUpdateCompanionBuilder,
    (WorkoutsInWave, $$WorkoutsInWavesTableReferences),
    WorkoutsInWave,
    PrefetchHooks Function({bool workoutId, bool workoutWaveId})>;
typedef $$WorkoutsWithMeasurementTableCreateCompanionBuilder
    = WorkoutsWithMeasurementCompanion Function({
  Value<int> id,
  required int workoutId,
  required int repitition,
  required String repititionType,
});
typedef $$WorkoutsWithMeasurementTableUpdateCompanionBuilder
    = WorkoutsWithMeasurementCompanion Function({
  Value<int> id,
  Value<int> workoutId,
  Value<int> repitition,
  Value<String> repititionType,
});

final class $$WorkoutsWithMeasurementTableReferences extends BaseReferences<
    _$AppDatabase, $WorkoutsWithMeasurementTable, WorkoutsWithMeasurementData> {
  $$WorkoutsWithMeasurementTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutsTable _workoutIdTable(_$AppDatabase db) =>
      db.workouts.createAlias($_aliasNameGenerator(
          db.workoutsWithMeasurement.workoutId, db.workouts.id));

  $$WorkoutsTableProcessedTableManager? get workoutId {
    if ($_item.workoutId == null) return null;
    final manager = $$WorkoutsTableTableManager($_db, $_db.workouts)
        .filter((f) => f.id($_item.workoutId!));
    final item = $_typedResult.readTableOrNull(_workoutIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$WorkoutsWithMeasurementTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutsWithMeasurementTable> {
  $$WorkoutsWithMeasurementTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get repitition => $composableBuilder(
      column: $table.repitition, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get repititionType => $composableBuilder(
      column: $table.repititionType,
      builder: (column) => ColumnFilters(column));

  $$WorkoutsTableFilterComposer get workoutId {
    final $$WorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableFilterComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkoutsWithMeasurementTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutsWithMeasurementTable> {
  $$WorkoutsWithMeasurementTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get repitition => $composableBuilder(
      column: $table.repitition, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get repititionType => $composableBuilder(
      column: $table.repititionType,
      builder: (column) => ColumnOrderings(column));

  $$WorkoutsTableOrderingComposer get workoutId {
    final $$WorkoutsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableOrderingComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkoutsWithMeasurementTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutsWithMeasurementTable> {
  $$WorkoutsWithMeasurementTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get repitition => $composableBuilder(
      column: $table.repitition, builder: (column) => column);

  GeneratedColumn<String> get repititionType => $composableBuilder(
      column: $table.repititionType, builder: (column) => column);

  $$WorkoutsTableAnnotationComposer get workoutId {
    final $$WorkoutsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableAnnotationComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkoutsWithMeasurementTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutsWithMeasurementTable,
    WorkoutsWithMeasurementData,
    $$WorkoutsWithMeasurementTableFilterComposer,
    $$WorkoutsWithMeasurementTableOrderingComposer,
    $$WorkoutsWithMeasurementTableAnnotationComposer,
    $$WorkoutsWithMeasurementTableCreateCompanionBuilder,
    $$WorkoutsWithMeasurementTableUpdateCompanionBuilder,
    (WorkoutsWithMeasurementData, $$WorkoutsWithMeasurementTableReferences),
    WorkoutsWithMeasurementData,
    PrefetchHooks Function({bool workoutId})> {
  $$WorkoutsWithMeasurementTableTableManager(
      _$AppDatabase db, $WorkoutsWithMeasurementTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutsWithMeasurementTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutsWithMeasurementTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutsWithMeasurementTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> workoutId = const Value.absent(),
            Value<int> repitition = const Value.absent(),
            Value<String> repititionType = const Value.absent(),
          }) =>
              WorkoutsWithMeasurementCompanion(
            id: id,
            workoutId: workoutId,
            repitition: repitition,
            repititionType: repititionType,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int workoutId,
            required int repitition,
            required String repititionType,
          }) =>
              WorkoutsWithMeasurementCompanion.insert(
            id: id,
            workoutId: workoutId,
            repitition: repitition,
            repititionType: repititionType,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkoutsWithMeasurementTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workoutId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workoutId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workoutId,
                    referencedTable: $$WorkoutsWithMeasurementTableReferences
                        ._workoutIdTable(db),
                    referencedColumn: $$WorkoutsWithMeasurementTableReferences
                        ._workoutIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$WorkoutsWithMeasurementTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $WorkoutsWithMeasurementTable,
        WorkoutsWithMeasurementData,
        $$WorkoutsWithMeasurementTableFilterComposer,
        $$WorkoutsWithMeasurementTableOrderingComposer,
        $$WorkoutsWithMeasurementTableAnnotationComposer,
        $$WorkoutsWithMeasurementTableCreateCompanionBuilder,
        $$WorkoutsWithMeasurementTableUpdateCompanionBuilder,
        (WorkoutsWithMeasurementData, $$WorkoutsWithMeasurementTableReferences),
        WorkoutsWithMeasurementData,
        PrefetchHooks Function({bool workoutId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MuscleMapsTableTableManager get muscleMaps =>
      $$MuscleMapsTableTableManager(_db, _db.muscleMaps);
  $$WorkoutsTableTableManager get workouts =>
      $$WorkoutsTableTableManager(_db, _db.workouts);
  $$MuscleMapsForWorkoutsTableTableManager get muscleMapsForWorkouts =>
      $$MuscleMapsForWorkoutsTableTableManager(_db, _db.muscleMapsForWorkouts);
  $$WorkoutWavesTableTableManager get workoutWaves =>
      $$WorkoutWavesTableTableManager(_db, _db.workoutWaves);
  $$WorkoutsInWavesTableTableManager get workoutsInWaves =>
      $$WorkoutsInWavesTableTableManager(_db, _db.workoutsInWaves);
  $$WorkoutsWithMeasurementTableTableManager get workoutsWithMeasurement =>
      $$WorkoutsWithMeasurementTableTableManager(
          _db, _db.workoutsWithMeasurement);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dbHash() => r'22d1c827009ba0dfeb81c971dec957c5e4b52158';

/// See also [db].
@ProviderFor(db)
final dbProvider = Provider<AppDatabase>.internal(
  db,
  name: r'dbProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DbRef = ProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
