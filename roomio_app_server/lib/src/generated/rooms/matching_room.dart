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

abstract class MatchingRoom
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  MatchingRoom._({
    this.id,
    required this.creatorUserId,
    required this.name,
    required this.inviteCode,
    required this.createdAt,
  });

  factory MatchingRoom({
    int? id,
    required String creatorUserId,
    required String name,
    required String inviteCode,
    required DateTime createdAt,
  }) = _MatchingRoomImpl;

  factory MatchingRoom.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchingRoom(
      id: jsonSerialization['id'] as int?,
      creatorUserId: jsonSerialization['creatorUserId'] as String,
      name: jsonSerialization['name'] as String,
      inviteCode: jsonSerialization['inviteCode'] as String,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = MatchingRoomTable();

  static const db = MatchingRoomRepository._();

  @override
  int? id;

  String creatorUserId;

  String name;

  String inviteCode;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [MatchingRoom]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  MatchingRoom copyWith({
    int? id,
    String? creatorUserId,
    String? name,
    String? inviteCode,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchingRoom',
      if (id != null) 'id': id,
      'creatorUserId': creatorUserId,
      'name': name,
      'inviteCode': inviteCode,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchingRoom',
      if (id != null) 'id': id,
      'creatorUserId': creatorUserId,
      'name': name,
      'inviteCode': inviteCode,
      'createdAt': createdAt.toJson(),
    };
  }

  static MatchingRoomInclude include() {
    return MatchingRoomInclude._();
  }

  static MatchingRoomIncludeList includeList({
    _is.WhereExpressionBuilder<MatchingRoomTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MatchingRoomTable>? orderBy,
    _is.OrderByListBuilder<MatchingRoomTable>? orderByList,
    MatchingRoomInclude? include,
  }) {
    return MatchingRoomIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchingRoom.t),
      orderByList: orderByList?.call(MatchingRoom.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MatchingRoomImpl extends MatchingRoom {
  _MatchingRoomImpl({
    int? id,
    required String creatorUserId,
    required String name,
    required String inviteCode,
    required DateTime createdAt,
  }) : super._(
         id: id,
         creatorUserId: creatorUserId,
         name: name,
         inviteCode: inviteCode,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [MatchingRoom]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  MatchingRoom copyWith({
    Object? id = _Undefined,
    String? creatorUserId,
    String? name,
    String? inviteCode,
    DateTime? createdAt,
  }) {
    return MatchingRoom(
      id: id is int? ? id : this.id,
      creatorUserId: creatorUserId ?? this.creatorUserId,
      name: name ?? this.name,
      inviteCode: inviteCode ?? this.inviteCode,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class MatchingRoomUpdateTable extends _is.UpdateTable<MatchingRoomTable> {
  MatchingRoomUpdateTable(super.table);

  _is.ColumnValue<String, String> creatorUserId(String value) =>
      _is.ColumnValue(
        table.creatorUserId,
        value,
      );

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<String, String> inviteCode(String value) => _is.ColumnValue(
    table.inviteCode,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class MatchingRoomTable extends _is.Table<int?> {
  MatchingRoomTable({super.tableRelation}) : super(tableName: 'matching_room') {
    updateTable = MatchingRoomUpdateTable(this);
    creatorUserId = _is.ColumnString(
      'creatorUserId',
      this,
    );
    name = _is.ColumnString(
      'name',
      this,
    );
    inviteCode = _is.ColumnString(
      'inviteCode',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final MatchingRoomUpdateTable updateTable;

  late final _is.ColumnString creatorUserId;

  late final _is.ColumnString name;

  late final _is.ColumnString inviteCode;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    creatorUserId,
    name,
    inviteCode,
    createdAt,
  ];
}

class MatchingRoomInclude extends _is.IncludeObject {
  MatchingRoomInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => MatchingRoom.t;
}

class MatchingRoomIncludeList extends _is.IncludeList {
  MatchingRoomIncludeList._({
    _is.WhereExpressionBuilder<MatchingRoomTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MatchingRoom.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => MatchingRoom.t;
}

class MatchingRoomRepository {
  const MatchingRoomRepository._();

  /// Returns a list of [MatchingRoom]s matching the given query parameters.
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
  Future<List<MatchingRoom>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MatchingRoomTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MatchingRoomTable>? orderBy,
    _is.OrderByListBuilder<MatchingRoomTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<MatchingRoom>(
      where: where?.call(MatchingRoom.t),
      orderBy: orderBy?.call(MatchingRoom.t),
      orderByList: orderByList?.call(MatchingRoom.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [MatchingRoom]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `MatchingRoom.t`.
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
  _ida.Stream<List<MatchingRoom>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MatchingRoomTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MatchingRoomTable>? orderBy,
    _is.OrderByListBuilder<MatchingRoomTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<MatchingRoom>(
      where: where?.call(MatchingRoom.t),
      orderBy: orderBy?.call(MatchingRoom.t),
      orderByList: orderByList?.call(MatchingRoom.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [MatchingRoom] matching the given query parameters.
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
  Future<MatchingRoom?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MatchingRoomTable>? where,
    int? offset,
    _is.OrderByBuilder<MatchingRoomTable>? orderBy,
    _is.OrderByListBuilder<MatchingRoomTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<MatchingRoom>(
      where: where?.call(MatchingRoom.t),
      orderBy: orderBy?.call(MatchingRoom.t),
      orderByList: orderByList?.call(MatchingRoom.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [MatchingRoom] by its [id] or null if no such row exists.
  Future<MatchingRoom?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<MatchingRoom>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [MatchingRoom]s in the list and returns the inserted rows.
  ///
  /// The returned [MatchingRoom]s will have their `id` fields set.
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
  Future<List<MatchingRoom>> insert(
    _is.DatabaseSession session,
    List<MatchingRoom> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<MatchingRoom>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [MatchingRoom] and returns the inserted row.
  ///
  /// The returned [MatchingRoom] will have its `id` field set.
  Future<MatchingRoom> insertRow(
    _is.DatabaseSession session,
    MatchingRoom row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<MatchingRoom>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [MatchingRoom]s in the list and returns the resulting rows.
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
  /// The returned [MatchingRoom]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<MatchingRoom>> upsert(
    _is.DatabaseSession session,
    List<MatchingRoom> rows, {
    required _is.ColumnSelections<MatchingRoomTable> conflictColumns,
    _is.ColumnSelections<MatchingRoomTable>? updateColumns,
    _is.WhereExpressionBuilder<MatchingRoomTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<MatchingRoom>(
      rows,
      conflictColumns: conflictColumns(MatchingRoom.t),
      updateColumns: updateColumns?.call(MatchingRoom.t),
      updateWhere: updateWhere?.call(MatchingRoom.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [MatchingRoom] and returns the resulting row.
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
  /// The returned [MatchingRoom] will have its `id` field set.
  Future<MatchingRoom?> upsertRow(
    _is.DatabaseSession session,
    MatchingRoom row, {
    required _is.ColumnSelections<MatchingRoomTable> conflictColumns,
    _is.ColumnSelections<MatchingRoomTable>? updateColumns,
    _is.WhereExpressionBuilder<MatchingRoomTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<MatchingRoom>(
      row,
      conflictColumns: conflictColumns(MatchingRoom.t),
      updateColumns: updateColumns?.call(MatchingRoom.t),
      updateWhere: updateWhere?.call(MatchingRoom.t),
      transaction: transaction,
    );
  }

  /// Updates all [MatchingRoom]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<MatchingRoom>> update(
    _is.DatabaseSession session,
    List<MatchingRoom> rows, {
    _is.ColumnSelections<MatchingRoomTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<MatchingRoom>(
      rows,
      columns: columns?.call(MatchingRoom.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [MatchingRoom]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MatchingRoom> updateRow(
    _is.DatabaseSession session,
    MatchingRoom row, {
    _is.ColumnSelections<MatchingRoomTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<MatchingRoom>(
      row,
      columns: columns?.call(MatchingRoom.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MatchingRoom] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MatchingRoom?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<MatchingRoomUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<MatchingRoom>(
      id,
      columnValues: columnValues(MatchingRoom.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MatchingRoom]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<MatchingRoom>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<MatchingRoomUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<MatchingRoomTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MatchingRoomTable>? orderBy,
    _is.OrderByListBuilder<MatchingRoomTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<MatchingRoom>(
      columnValues: columnValues(MatchingRoom.t.updateTable),
      where: where(MatchingRoom.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MatchingRoom.t),
      orderByList: orderByList?.call(MatchingRoom.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [MatchingRoom]s in the list and returns the deleted rows.
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
  Future<List<MatchingRoom>> delete(
    _is.DatabaseSession session,
    List<MatchingRoom> rows, {
    _is.OrderByBuilder<MatchingRoomTable>? orderBy,
    _is.OrderByListBuilder<MatchingRoomTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<MatchingRoom>(
      rows,
      orderBy: orderBy?.call(MatchingRoom.t),
      orderByList: orderByList?.call(MatchingRoom.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [MatchingRoom].
  Future<MatchingRoom> deleteRow(
    _is.DatabaseSession session,
    MatchingRoom row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MatchingRoom>(
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
  Future<List<MatchingRoom>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<MatchingRoomTable> where,
    _is.OrderByBuilder<MatchingRoomTable>? orderBy,
    _is.OrderByListBuilder<MatchingRoomTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<MatchingRoom>(
      where: where(MatchingRoom.t),
      orderBy: orderBy?.call(MatchingRoom.t),
      orderByList: orderByList?.call(MatchingRoom.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MatchingRoomTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<MatchingRoom>(
      where: where?.call(MatchingRoom.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [MatchingRoom] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<MatchingRoomTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<MatchingRoom>(
      where: where(MatchingRoom.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
