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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MuscleMapsTable muscleMaps = $MuscleMapsTable(this);
  late final MuscleMapsDao muscleMapsDao = MuscleMapsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [muscleMaps];
}

typedef $$MuscleMapsTableCreateCompanionBuilder = MuscleMapsCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$MuscleMapsTableUpdateCompanionBuilder = MuscleMapsCompanion Function({
  Value<int> id,
  Value<String> name,
});

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
    (MuscleMap, BaseReferences<_$AppDatabase, $MuscleMapsTable, MuscleMap>),
    MuscleMap,
    PrefetchHooks Function()> {
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
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
    (MuscleMap, BaseReferences<_$AppDatabase, $MuscleMapsTable, MuscleMap>),
    MuscleMap,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MuscleMapsTableTableManager get muscleMaps =>
      $$MuscleMapsTableTableManager(_db, _db.muscleMaps);
}
