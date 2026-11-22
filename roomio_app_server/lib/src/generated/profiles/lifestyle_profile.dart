/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _ida;
import 'package:serverpod/serverpod.dart' as _is;

abstract class LifestyleProfile
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  LifestyleProfile._({
    this.id,
    required this.userId,
    required this.name,
    required this.minBudget,
    required this.maxBudget,
    required this.preferredCity,
    required this.sleepSchedule,
    required this.cleanliness,
    required this.foodHabit,
    required this.socialHabit,
    required this.smokingHabit,
    required this.petHabit,
    required this.hardFilterNoSmoking,
    required this.hardFilterPetFriendly,
    required this.hardFilterSameGender,
  });

  factory LifestyleProfile({
    int? id,
    required String userId,
    required String name,
    required int minBudget,
    required int maxBudget,
    required String preferredCity,
    required String sleepSchedule,
    required String cleanliness,
    required String foodHabit,
    required String socialHabit,
    required String smokingHabit,
    required String petHabit,
    required bool hardFilterNoSmoking,
    required bool hardFilterPetFriendly,
    required bool hardFilterSameGender,
  }) = _LifestyleProfileImpl;

  factory LifestyleProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return LifestyleProfile(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      name: jsonSerialization['name'] as String,
      minBudget: jsonSerialization['minBudget'] as int,
      maxBudget: jsonSerialization['maxBudget'] as int,
      preferredCity: jsonSerialization['preferredCity'] as String,
      sleepSchedule: jsonSerialization['sleepSchedule'] as String,
      cleanliness: jsonSerialization['cleanliness'] as String,
      foodHabit: jsonSerialization['foodHabit'] as String,
      socialHabit: jsonSerialization['socialHabit'] as String,
      smokingHabit: jsonSerialization['smokingHabit'] as String,
      petHabit: jsonSerialization['petHabit'] as String,
      hardFilterNoSmoking: _is.BoolJsonExtension.fromJson(
        jsonSerialization['hardFilterNoSmoking'],
      ),
      hardFilterPetFriendly: _is.BoolJsonExtension.fromJson(
        jsonSerialization['hardFilterPetFriendly'],
      ),
      hardFilterSameGender: _is.BoolJsonExtension.fromJson(
        jsonSerialization['hardFilterSameGender'],
      ),
    );
  }

  static final t = LifestyleProfileTable();

  static const db = LifestyleProfileRepository._();

  @override
  int? id;

  String userId;

  String name;

  int minBudget;

  int maxBudget;

  String preferredCity;

  String sleepSchedule;

  String cleanliness;

  String foodHabit;

  String socialHabit;

  String smokingHabit;

  String petHabit;

  bool hardFilterNoSmoking;

  bool hardFilterPetFriendly;

  bool hardFilterSameGender;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [LifestyleProfile]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  LifestyleProfile copyWith({
    int? id,
    String? userId,
    String? name,
    int? minBudget,
    int? maxBudget,
    String? preferredCity,
    String? sleepSchedule,
    String? cleanliness,
    String? foodHabit,
    String? socialHabit,
    String? smokingHabit,
    String? petHabit,
    bool? hardFilterNoSmoking,
    bool? hardFilterPetFriendly,
    bool? hardFilterSameGender,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LifestyleProfile',
      if (id != null) 'id': id,
      'userId': userId,
      'name': name,
      'minBudget': minBudget,
      'maxBudget': maxBudget,
      'preferredCity': preferredCity,
      'sleepSchedule': sleepSchedule,
      'cleanliness': cleanliness,
      'foodHabit': foodHabit,
      'socialHabit': socialHabit,
      'smokingHabit': smokingHabit,
      'petHabit': petHabit,
      'hardFilterNoSmoking': hardFilterNoSmoking,
      'hardFilterPetFriendly': hardFilterPetFriendly,
      'hardFilterSameGender': hardFilterSameGender,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LifestyleProfile',
      if (id != null) 'id': id,
      'userId': userId,
      'name': name,
      'minBudget': minBudget,
      'maxBudget': maxBudget,
      'preferredCity': preferredCity,
      'sleepSchedule': sleepSchedule,
      'cleanliness': cleanliness,
      'foodHabit': foodHabit,
      'socialHabit': socialHabit,
      'smokingHabit': smokingHabit,
      'petHabit': petHabit,
      'hardFilterNoSmoking': hardFilterNoSmoking,
      'hardFilterPetFriendly': hardFilterPetFriendly,
      'hardFilterSameGender': hardFilterSameGender,
    };
  }

  static LifestyleProfileInclude include() {
    return LifestyleProfileInclude._();
  }

  static LifestyleProfileIncludeList includeList({
    _is.WhereExpressionBuilder<LifestyleProfileTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LifestyleProfileTable>? orderBy,
    _is.OrderByListBuilder<LifestyleProfileTable>? orderByList,
    LifestyleProfileInclude? include,
  }) {
    return LifestyleProfileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LifestyleProfile.t),
      orderByList: orderByList?.call(LifestyleProfile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LifestyleProfileImpl extends LifestyleProfile {
  _LifestyleProfileImpl({
    int? id,
    required String userId,
    required String name,
    required int minBudget,
    required int maxBudget,
    required String preferredCity,
    required String sleepSchedule,
    required String cleanliness,
    required String foodHabit,
    required String socialHabit,
    required String smokingHabit,
    required String petHabit,
    required bool hardFilterNoSmoking,
    required bool hardFilterPetFriendly,
    required bool hardFilterSameGender,
  }) : super._(
         id: id,
         userId: userId,
         name: name,
         minBudget: minBudget,
         maxBudget: maxBudget,
         preferredCity: preferredCity,
         sleepSchedule: sleepSchedule,
         cleanliness: cleanliness,
         foodHabit: foodHabit,
         socialHabit: socialHabit,
         smokingHabit: smokingHabit,
         petHabit: petHabit,
         hardFilterNoSmoking: hardFilterNoSmoking,
         hardFilterPetFriendly: hardFilterPetFriendly,
         hardFilterSameGender: hardFilterSameGender,
       );

  /// Returns a shallow copy of this [LifestyleProfile]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  LifestyleProfile copyWith({
    Object? id = _Undefined,
    String? userId,
    String? name,
    int? minBudget,
    int? maxBudget,
    String? preferredCity,
    String? sleepSchedule,
    String? cleanliness,
    String? foodHabit,
    String? socialHabit,
    String? smokingHabit,
    String? petHabit,
    bool? hardFilterNoSmoking,
    bool? hardFilterPetFriendly,
    bool? hardFilterSameGender,
  }) {
    return LifestyleProfile(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      minBudget: minBudget ?? this.minBudget,
      maxBudget: maxBudget ?? this.maxBudget,
      preferredCity: preferredCity ?? this.preferredCity,
      sleepSchedule: sleepSchedule ?? this.sleepSchedule,
      cleanliness: cleanliness ?? this.cleanliness,
      foodHabit: foodHabit ?? this.foodHabit,
      socialHabit: socialHabit ?? this.socialHabit,
      smokingHabit: smokingHabit ?? this.smokingHabit,
      petHabit: petHabit ?? this.petHabit,
      hardFilterNoSmoking: hardFilterNoSmoking ?? this.hardFilterNoSmoking,
      hardFilterPetFriendly:
          hardFilterPetFriendly ?? this.hardFilterPetFriendly,
      hardFilterSameGender: hardFilterSameGender ?? this.hardFilterSameGender,
    );
  }
}

class LifestyleProfileUpdateTable
    extends _is.UpdateTable<LifestyleProfileTable> {
  LifestyleProfileUpdateTable(super.table);

  _is.ColumnValue<String, String> userId(String value) => _is.ColumnValue(
    table.userId,
    value,
  );

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<int, int> minBudget(int value) => _is.ColumnValue(
    table.minBudget,
    value,
  );

  _is.ColumnValue<int, int> maxBudget(int value) => _is.ColumnValue(
    table.maxBudget,
    value,
  );

  _is.ColumnValue<String, String> preferredCity(String value) =>
      _is.ColumnValue(
        table.preferredCity,
        value,
      );

  _is.ColumnValue<String, String> sleepSchedule(String value) =>
      _is.ColumnValue(
        table.sleepSchedule,
        value,
      );

  _is.ColumnValue<String, String> cleanliness(String value) => _is.ColumnValue(
    table.cleanliness,
    value,
  );

  _is.ColumnValue<String, String> foodHabit(String value) => _is.ColumnValue(
    table.foodHabit,
    value,
  );

  _is.ColumnValue<String, String> socialHabit(String value) => _is.ColumnValue(
    table.socialHabit,
    value,
  );

  _is.ColumnValue<String, String> smokingHabit(String value) => _is.ColumnValue(
    table.smokingHabit,
    value,
  );

  _is.ColumnValue<String, String> petHabit(String value) => _is.ColumnValue(
    table.petHabit,
    value,
  );

  _is.ColumnValue<bool, bool> hardFilterNoSmoking(bool value) =>
      _is.ColumnValue(
        table.hardFilterNoSmoking,
        value,
      );

  _is.ColumnValue<bool, bool> hardFilterPetFriendly(bool value) =>
      _is.ColumnValue(
        table.hardFilterPetFriendly,
        value,
      );

  _is.ColumnValue<bool, bool> hardFilterSameGender(bool value) =>
      _is.ColumnValue(
        table.hardFilterSameGender,
        value,
      );
}

class LifestyleProfileTable extends _is.Table<int?> {
  LifestyleProfileTable({super.tableRelation})
    : super(tableName: 'lifestyle_profile') {
    updateTable = LifestyleProfileUpdateTable(this);
    userId = _is.ColumnString(
      'userId',
      this,
    );
    name = _is.ColumnString(
      'name',
      this,
    );
    minBudget = _is.ColumnInt(
      'minBudget',
      this,
    );
    maxBudget = _is.ColumnInt(
      'maxBudget',
      this,
    );
    preferredCity = _is.ColumnString(
      'preferredCity',
      this,
    );
    sleepSchedule = _is.ColumnString(
      'sleepSchedule',
      this,
    );
    cleanliness = _is.ColumnString(
      'cleanliness',
      this,
    );
    foodHabit = _is.ColumnString(
      'foodHabit',
      this,
    );
    socialHabit = _is.ColumnString(
      'socialHabit',
      this,
    );
    smokingHabit = _is.ColumnString(
      'smokingHabit',
      this,
    );
    petHabit = _is.ColumnString(
      'petHabit',
      this,
    );
    hardFilterNoSmoking = _is.ColumnBool(
      'hardFilterNoSmoking',
      this,
    );
    hardFilterPetFriendly = _is.ColumnBool(
      'hardFilterPetFriendly',
      this,
    );
    hardFilterSameGender = _is.ColumnBool(
      'hardFilterSameGender',
      this,
    );
  }

  late final LifestyleProfileUpdateTable updateTable;

  late final _is.ColumnString userId;

  late final _is.ColumnString name;

  late final _is.ColumnInt minBudget;

  late final _is.ColumnInt maxBudget;

  late final _is.ColumnString preferredCity;

  late final _is.ColumnString sleepSchedule;

  late final _is.ColumnString cleanliness;

  late final _is.ColumnString foodHabit;

  late final _is.ColumnString socialHabit;

  late final _is.ColumnString smokingHabit;

  late final _is.ColumnString petHabit;

  late final _is.ColumnBool hardFilterNoSmoking;

  late final _is.ColumnBool hardFilterPetFriendly;

  late final _is.ColumnBool hardFilterSameGender;

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    name,
    minBudget,
    maxBudget,
    preferredCity,
    sleepSchedule,
    cleanliness,
    foodHabit,
    socialHabit,
    smokingHabit,
    petHabit,
    hardFilterNoSmoking,
    hardFilterPetFriendly,
    hardFilterSameGender,
  ];
}

class LifestyleProfileInclude extends _is.IncludeObject {
  LifestyleProfileInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => LifestyleProfile.t;
}

class LifestyleProfileIncludeList extends _is.IncludeList {
  LifestyleProfileIncludeList._({
    _is.WhereExpressionBuilder<LifestyleProfileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LifestyleProfile.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => LifestyleProfile.t;
}

class LifestyleProfileRepository {
  const LifestyleProfileRepository._();

  /// Returns a list of [LifestyleProfile]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<LifestyleProfile>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LifestyleProfileTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LifestyleProfileTable>? orderBy,
    _is.OrderByListBuilder<LifestyleProfileTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<LifestyleProfile>(
      where: where?.call(LifestyleProfile.t),
      orderBy: orderBy?.call(LifestyleProfile.t),
      orderByList: orderByList?.call(LifestyleProfile.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [LifestyleProfile]s matching the given query parameters every time the
  /// source tables are modified.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// Use [throttle] to specify the minimum interval between queries. It can
  /// also be set to `null`, in which case the stream will only be throttled
  /// when its subscription is paused.
  ///
  /// Source tables are collected from the queried table, [where], [orderBy],
  /// [orderByList], and the [include] graph. [alsoTriggerOnTables] is added
  /// to that set. Pass [Table] instances such as `LifestyleProfile.t`.
  ///
  /// Raw [Expression] SQL is not inspected. Tables referenced only in raw
  /// SQL must be passed via [alsoTriggerOnTables].
  ///
  /// The stream always reads committed state and never joins an ambient
  /// [Transaction]. Emissions for a write fire after that write commits.
  ///
  /// Currently only supported on SQLite. Calling this method on PostgreSQL
  /// throws an [UnsupportedError].
  ///
  /// ```dart
  /// var subscription = Persons.db.watch(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// ).listen((persons) {
  ///   // Handle the latest matching rows.
  /// });
  /// ```
  _ida.Stream<List<LifestyleProfile>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LifestyleProfileTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LifestyleProfileTable>? orderBy,
    _is.OrderByListBuilder<LifestyleProfileTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<LifestyleProfile>(
      where: where?.call(LifestyleProfile.t),
      orderBy: orderBy?.call(LifestyleProfile.t),
      orderByList: orderByList?.call(LifestyleProfile.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [LifestyleProfile] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<LifestyleProfile?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LifestyleProfileTable>? where,
    int? offset,
    _is.OrderByBuilder<LifestyleProfileTable>? orderBy,
    _is.OrderByListBuilder<LifestyleProfileTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<LifestyleProfile>(
      where: where?.call(LifestyleProfile.t),
      orderBy: orderBy?.call(LifestyleProfile.t),
      orderByList: orderByList?.call(LifestyleProfile.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [LifestyleProfile] by its [id] or null if no such row exists.
  Future<LifestyleProfile?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<LifestyleProfile>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [LifestyleProfile]s in the list and returns the inserted rows.
  ///
  /// The returned [LifestyleProfile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LifestyleProfile>> insert(
    _is.DatabaseSession session,
    List<LifestyleProfile> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<LifestyleProfile>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [LifestyleProfile] and returns the inserted row.
  ///
  /// The returned [LifestyleProfile] will have its `id` field set.
  Future<LifestyleProfile> insertRow(
    _is.DatabaseSession session,
    LifestyleProfile row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<LifestyleProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [LifestyleProfile]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [LifestyleProfile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LifestyleProfile>> upsert(
    _is.DatabaseSession session,
    List<LifestyleProfile> rows, {
    required _is.ColumnSelections<LifestyleProfileTable> conflictColumns,
    _is.ColumnSelections<LifestyleProfileTable>? updateColumns,
    _is.WhereExpressionBuilder<LifestyleProfileTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<LifestyleProfile>(
      rows,
      conflictColumns: conflictColumns(LifestyleProfile.t),
      updateColumns: updateColumns?.call(LifestyleProfile.t),
      updateWhere: updateWhere?.call(LifestyleProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [LifestyleProfile] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [LifestyleProfile] will have its `id` field set.
  Future<LifestyleProfile?> upsertRow(
    _is.DatabaseSession session,
    LifestyleProfile row, {
    required _is.ColumnSelections<LifestyleProfileTable> conflictColumns,
    _is.ColumnSelections<LifestyleProfileTable>? updateColumns,
    _is.WhereExpressionBuilder<LifestyleProfileTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<LifestyleProfile>(
      row,
      conflictColumns: conflictColumns(LifestyleProfile.t),
      updateColumns: updateColumns?.call(LifestyleProfile.t),
      updateWhere: updateWhere?.call(LifestyleProfile.t),
      transaction: transaction,
    );
  }

  /// Updates all [LifestyleProfile]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LifestyleProfile>> update(
    _is.DatabaseSession session,
    List<LifestyleProfile> rows, {
    _is.ColumnSelections<LifestyleProfileTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<LifestyleProfile>(
      rows,
      columns: columns?.call(LifestyleProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [LifestyleProfile]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LifestyleProfile> updateRow(
    _is.DatabaseSession session,
    LifestyleProfile row, {
    _is.ColumnSelections<LifestyleProfileTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<LifestyleProfile>(
      row,
      columns: columns?.call(LifestyleProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LifestyleProfile] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<LifestyleProfile?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<LifestyleProfileUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<LifestyleProfile>(
      id,
      columnValues: columnValues(LifestyleProfile.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [LifestyleProfile]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LifestyleProfile>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<LifestyleProfileUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<LifestyleProfileTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LifestyleProfileTable>? orderBy,
    _is.OrderByListBuilder<LifestyleProfileTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<LifestyleProfile>(
      columnValues: columnValues(LifestyleProfile.t.updateTable),
      where: where(LifestyleProfile.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LifestyleProfile.t),
      orderByList: orderByList?.call(LifestyleProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [LifestyleProfile]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LifestyleProfile>> delete(
    _is.DatabaseSession session,
    List<LifestyleProfile> rows, {
    _is.OrderByBuilder<LifestyleProfileTable>? orderBy,
    _is.OrderByListBuilder<LifestyleProfileTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<LifestyleProfile>(
      rows,
      orderBy: orderBy?.call(LifestyleProfile.t),
      orderByList: orderByList?.call(LifestyleProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [LifestyleProfile].
  Future<LifestyleProfile> deleteRow(
    _is.DatabaseSession session,
    LifestyleProfile row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LifestyleProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LifestyleProfile>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<LifestyleProfileTable> where,
    _is.OrderByBuilder<LifestyleProfileTable>? orderBy,
    _is.OrderByListBuilder<LifestyleProfileTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<LifestyleProfile>(
      where: where(LifestyleProfile.t),
      orderBy: orderBy?.call(LifestyleProfile.t),
      orderByList: orderByList?.call(LifestyleProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LifestyleProfileTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<LifestyleProfile>(
      where: where?.call(LifestyleProfile.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [LifestyleProfile] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<LifestyleProfileTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<LifestyleProfile>(
      where: where(LifestyleProfile.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
