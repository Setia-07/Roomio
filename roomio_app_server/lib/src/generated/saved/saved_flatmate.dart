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

abstract class SavedFlatmate
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  SavedFlatmate._({
    this.id,
    required this.userId,
    required this.targetUserId,
    required this.savedAt,
  });

  factory SavedFlatmate({
    int? id,
    required String userId,
    required String targetUserId,
    required DateTime savedAt,
  }) = _SavedFlatmateImpl;

  factory SavedFlatmate.fromJson(Map<String, dynamic> jsonSerialization) {
    return SavedFlatmate(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      targetUserId: jsonSerialization['targetUserId'] as String,
      savedAt: _is.DateTimeJsonExtension.fromJson(jsonSerialization['savedAt']),
    );
  }

  static final t = SavedFlatmateTable();

  static const db = SavedFlatmateRepository._();

  @override
  int? id;

  String userId;

  String targetUserId;

  DateTime savedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [SavedFlatmate]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  SavedFlatmate copyWith({
    int? id,
    String? userId,
    String? targetUserId,
    DateTime? savedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SavedFlatmate',
      if (id != null) 'id': id,
      'userId': userId,
      'targetUserId': targetUserId,
      'savedAt': savedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SavedFlatmate',
      if (id != null) 'id': id,
      'userId': userId,
      'targetUserId': targetUserId,
      'savedAt': savedAt.toJson(),
    };
  }

  static SavedFlatmateInclude include() {
    return SavedFlatmateInclude._();
  }

  static SavedFlatmateIncludeList includeList({
    _is.WhereExpressionBuilder<SavedFlatmateTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SavedFlatmateTable>? orderBy,
    _is.OrderByListBuilder<SavedFlatmateTable>? orderByList,
    SavedFlatmateInclude? include,
  }) {
    return SavedFlatmateIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SavedFlatmate.t),
      orderByList: orderByList?.call(SavedFlatmate.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SavedFlatmateImpl extends SavedFlatmate {
  _SavedFlatmateImpl({
    int? id,
    required String userId,
    required String targetUserId,
    required DateTime savedAt,
  }) : super._(
         id: id,
         userId: userId,
         targetUserId: targetUserId,
         savedAt: savedAt,
       );

  /// Returns a shallow copy of this [SavedFlatmate]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  SavedFlatmate copyWith({
    Object? id = _Undefined,
    String? userId,
    String? targetUserId,
    DateTime? savedAt,
  }) {
    return SavedFlatmate(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      targetUserId: targetUserId ?? this.targetUserId,
      savedAt: savedAt ?? this.savedAt,
    );
  }
}

class SavedFlatmateUpdateTable extends _is.UpdateTable<SavedFlatmateTable> {
  SavedFlatmateUpdateTable(super.table);

  _is.ColumnValue<String, String> userId(String value) => _is.ColumnValue(
    table.userId,
    value,
  );

  _is.ColumnValue<String, String> targetUserId(String value) => _is.ColumnValue(
    table.targetUserId,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> savedAt(DateTime value) =>
      _is.ColumnValue(
        table.savedAt,
        value,
      );
}

class SavedFlatmateTable extends _is.Table<int?> {
  SavedFlatmateTable({super.tableRelation})
    : super(tableName: 'saved_flatmate') {
    updateTable = SavedFlatmateUpdateTable(this);
    userId = _is.ColumnString(
      'userId',
      this,
    );
    targetUserId = _is.ColumnString(
      'targetUserId',
      this,
    );
    savedAt = _is.ColumnDateTime(
      'savedAt',
      this,
    );
  }

  late final SavedFlatmateUpdateTable updateTable;

  late final _is.ColumnString userId;

  late final _is.ColumnString targetUserId;

  late final _is.ColumnDateTime savedAt;

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    targetUserId,
    savedAt,
  ];
}

class SavedFlatmateInclude extends _is.IncludeObject {
  SavedFlatmateInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => SavedFlatmate.t;
}

class SavedFlatmateIncludeList extends _is.IncludeList {
  SavedFlatmateIncludeList._({
    _is.WhereExpressionBuilder<SavedFlatmateTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SavedFlatmate.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => SavedFlatmate.t;
}

class SavedFlatmateRepository {
  const SavedFlatmateRepository._();

  /// Returns a list of [SavedFlatmate]s matching the given query parameters.
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
  Future<List<SavedFlatmate>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SavedFlatmateTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SavedFlatmateTable>? orderBy,
    _is.OrderByListBuilder<SavedFlatmateTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SavedFlatmate>(
      where: where?.call(SavedFlatmate.t),
      orderBy: orderBy?.call(SavedFlatmate.t),
      orderByList: orderByList?.call(SavedFlatmate.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [SavedFlatmate]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `SavedFlatmate.t`.
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
  _ida.Stream<List<SavedFlatmate>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SavedFlatmateTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SavedFlatmateTable>? orderBy,
    _is.OrderByListBuilder<SavedFlatmateTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<SavedFlatmate>(
      where: where?.call(SavedFlatmate.t),
      orderBy: orderBy?.call(SavedFlatmate.t),
      orderByList: orderByList?.call(SavedFlatmate.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [SavedFlatmate] matching the given query parameters.
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
  Future<SavedFlatmate?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SavedFlatmateTable>? where,
    int? offset,
    _is.OrderByBuilder<SavedFlatmateTable>? orderBy,
    _is.OrderByListBuilder<SavedFlatmateTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SavedFlatmate>(
      where: where?.call(SavedFlatmate.t),
      orderBy: orderBy?.call(SavedFlatmate.t),
      orderByList: orderByList?.call(SavedFlatmate.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SavedFlatmate] by its [id] or null if no such row exists.
  Future<SavedFlatmate?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SavedFlatmate>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SavedFlatmate]s in the list and returns the inserted rows.
  ///
  /// The returned [SavedFlatmate]s will have their `id` fields set.
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
  Future<List<SavedFlatmate>> insert(
    _is.DatabaseSession session,
    List<SavedFlatmate> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<SavedFlatmate>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [SavedFlatmate] and returns the inserted row.
  ///
  /// The returned [SavedFlatmate] will have its `id` field set.
  Future<SavedFlatmate> insertRow(
    _is.DatabaseSession session,
    SavedFlatmate row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<SavedFlatmate>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [SavedFlatmate]s in the list and returns the resulting rows.
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
  /// The returned [SavedFlatmate]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SavedFlatmate>> upsert(
    _is.DatabaseSession session,
    List<SavedFlatmate> rows, {
    required _is.ColumnSelections<SavedFlatmateTable> conflictColumns,
    _is.ColumnSelections<SavedFlatmateTable>? updateColumns,
    _is.WhereExpressionBuilder<SavedFlatmateTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<SavedFlatmate>(
      rows,
      conflictColumns: conflictColumns(SavedFlatmate.t),
      updateColumns: updateColumns?.call(SavedFlatmate.t),
      updateWhere: updateWhere?.call(SavedFlatmate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [SavedFlatmate] and returns the resulting row.
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
  /// The returned [SavedFlatmate] will have its `id` field set.
  Future<SavedFlatmate?> upsertRow(
    _is.DatabaseSession session,
    SavedFlatmate row, {
    required _is.ColumnSelections<SavedFlatmateTable> conflictColumns,
    _is.ColumnSelections<SavedFlatmateTable>? updateColumns,
    _is.WhereExpressionBuilder<SavedFlatmateTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<SavedFlatmate>(
      row,
      conflictColumns: conflictColumns(SavedFlatmate.t),
      updateColumns: updateColumns?.call(SavedFlatmate.t),
      updateWhere: updateWhere?.call(SavedFlatmate.t),
      transaction: transaction,
    );
  }

  /// Updates all [SavedFlatmate]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SavedFlatmate>> update(
    _is.DatabaseSession session,
    List<SavedFlatmate> rows, {
    _is.ColumnSelections<SavedFlatmateTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<SavedFlatmate>(
      rows,
      columns: columns?.call(SavedFlatmate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [SavedFlatmate]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SavedFlatmate> updateRow(
    _is.DatabaseSession session,
    SavedFlatmate row, {
    _is.ColumnSelections<SavedFlatmateTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<SavedFlatmate>(
      row,
      columns: columns?.call(SavedFlatmate.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SavedFlatmate] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SavedFlatmate?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<SavedFlatmateUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<SavedFlatmate>(
      id,
      columnValues: columnValues(SavedFlatmate.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SavedFlatmate]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SavedFlatmate>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<SavedFlatmateUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<SavedFlatmateTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SavedFlatmateTable>? orderBy,
    _is.OrderByListBuilder<SavedFlatmateTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<SavedFlatmate>(
      columnValues: columnValues(SavedFlatmate.t.updateTable),
      where: where(SavedFlatmate.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SavedFlatmate.t),
      orderByList: orderByList?.call(SavedFlatmate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [SavedFlatmate]s in the list and returns the deleted rows.
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
  Future<List<SavedFlatmate>> delete(
    _is.DatabaseSession session,
    List<SavedFlatmate> rows, {
    _is.OrderByBuilder<SavedFlatmateTable>? orderBy,
    _is.OrderByListBuilder<SavedFlatmateTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<SavedFlatmate>(
      rows,
      orderBy: orderBy?.call(SavedFlatmate.t),
      orderByList: orderByList?.call(SavedFlatmate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [SavedFlatmate].
  Future<SavedFlatmate> deleteRow(
    _is.DatabaseSession session,
    SavedFlatmate row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SavedFlatmate>(
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
  Future<List<SavedFlatmate>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SavedFlatmateTable> where,
    _is.OrderByBuilder<SavedFlatmateTable>? orderBy,
    _is.OrderByListBuilder<SavedFlatmateTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<SavedFlatmate>(
      where: where(SavedFlatmate.t),
      orderBy: orderBy?.call(SavedFlatmate.t),
      orderByList: orderByList?.call(SavedFlatmate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SavedFlatmateTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<SavedFlatmate>(
      where: where?.call(SavedFlatmate.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SavedFlatmate] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SavedFlatmateTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SavedFlatmate>(
      where: where(SavedFlatmate.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
