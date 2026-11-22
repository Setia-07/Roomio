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

abstract class RoomVote
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  RoomVote._({
    this.id,
    required this.shortlistItemId,
    required this.userId,
    required this.voteType,
    required this.votedAt,
  });

  factory RoomVote({
    int? id,
    required int shortlistItemId,
    required String userId,
    required String voteType,
    required DateTime votedAt,
  }) = _RoomVoteImpl;

  factory RoomVote.fromJson(Map<String, dynamic> jsonSerialization) {
    return RoomVote(
      id: jsonSerialization['id'] as int?,
      shortlistItemId: jsonSerialization['shortlistItemId'] as int,
      userId: jsonSerialization['userId'] as String,
      voteType: jsonSerialization['voteType'] as String,
      votedAt: _is.DateTimeJsonExtension.fromJson(jsonSerialization['votedAt']),
    );
  }

  static final t = RoomVoteTable();

  static const db = RoomVoteRepository._();

  @override
  int? id;

  int shortlistItemId;

  String userId;

  String voteType;

  DateTime votedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [RoomVote]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RoomVote copyWith({
    int? id,
    int? shortlistItemId,
    String? userId,
    String? voteType,
    DateTime? votedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RoomVote',
      if (id != null) 'id': id,
      'shortlistItemId': shortlistItemId,
      'userId': userId,
      'voteType': voteType,
      'votedAt': votedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RoomVote',
      if (id != null) 'id': id,
      'shortlistItemId': shortlistItemId,
      'userId': userId,
      'voteType': voteType,
      'votedAt': votedAt.toJson(),
    };
  }

  static RoomVoteInclude include() {
    return RoomVoteInclude._();
  }

  static RoomVoteIncludeList includeList({
    _is.WhereExpressionBuilder<RoomVoteTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RoomVoteTable>? orderBy,
    _is.OrderByListBuilder<RoomVoteTable>? orderByList,
    RoomVoteInclude? include,
  }) {
    return RoomVoteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RoomVote.t),
      orderByList: orderByList?.call(RoomVote.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoomVoteImpl extends RoomVote {
  _RoomVoteImpl({
    int? id,
    required int shortlistItemId,
    required String userId,
    required String voteType,
    required DateTime votedAt,
  }) : super._(
         id: id,
         shortlistItemId: shortlistItemId,
         userId: userId,
         voteType: voteType,
         votedAt: votedAt,
       );

  /// Returns a shallow copy of this [RoomVote]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RoomVote copyWith({
    Object? id = _Undefined,
    int? shortlistItemId,
    String? userId,
    String? voteType,
    DateTime? votedAt,
  }) {
    return RoomVote(
      id: id is int? ? id : this.id,
      shortlistItemId: shortlistItemId ?? this.shortlistItemId,
      userId: userId ?? this.userId,
      voteType: voteType ?? this.voteType,
      votedAt: votedAt ?? this.votedAt,
    );
  }
}

class RoomVoteUpdateTable extends _is.UpdateTable<RoomVoteTable> {
  RoomVoteUpdateTable(super.table);

  _is.ColumnValue<int, int> shortlistItemId(int value) => _is.ColumnValue(
    table.shortlistItemId,
    value,
  );

  _is.ColumnValue<String, String> userId(String value) => _is.ColumnValue(
    table.userId,
    value,
  );

  _is.ColumnValue<String, String> voteType(String value) => _is.ColumnValue(
    table.voteType,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> votedAt(DateTime value) =>
      _is.ColumnValue(
        table.votedAt,
        value,
      );
}

class RoomVoteTable extends _is.Table<int?> {
  RoomVoteTable({super.tableRelation}) : super(tableName: 'room_vote') {
    updateTable = RoomVoteUpdateTable(this);
    shortlistItemId = _is.ColumnInt(
      'shortlistItemId',
      this,
    );
    userId = _is.ColumnString(
      'userId',
      this,
    );
    voteType = _is.ColumnString(
      'voteType',
      this,
    );
    votedAt = _is.ColumnDateTime(
      'votedAt',
      this,
    );
  }

  late final RoomVoteUpdateTable updateTable;

  late final _is.ColumnInt shortlistItemId;

  late final _is.ColumnString userId;

  late final _is.ColumnString voteType;

  late final _is.ColumnDateTime votedAt;

  @override
  List<_is.Column> get columns => [
    id,
    shortlistItemId,
    userId,
    voteType,
    votedAt,
  ];
}

class RoomVoteInclude extends _is.IncludeObject {
  RoomVoteInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => RoomVote.t;
}

class RoomVoteIncludeList extends _is.IncludeList {
  RoomVoteIncludeList._({
    _is.WhereExpressionBuilder<RoomVoteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RoomVote.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => RoomVote.t;
}

class RoomVoteRepository {
  const RoomVoteRepository._();

  /// Returns a list of [RoomVote]s matching the given query parameters.
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
  Future<List<RoomVote>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RoomVoteTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RoomVoteTable>? orderBy,
    _is.OrderByListBuilder<RoomVoteTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RoomVote>(
      where: where?.call(RoomVote.t),
      orderBy: orderBy?.call(RoomVote.t),
      orderByList: orderByList?.call(RoomVote.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [RoomVote]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `RoomVote.t`.
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
  _ida.Stream<List<RoomVote>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RoomVoteTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RoomVoteTable>? orderBy,
    _is.OrderByListBuilder<RoomVoteTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<RoomVote>(
      where: where?.call(RoomVote.t),
      orderBy: orderBy?.call(RoomVote.t),
      orderByList: orderByList?.call(RoomVote.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [RoomVote] matching the given query parameters.
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
  Future<RoomVote?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RoomVoteTable>? where,
    int? offset,
    _is.OrderByBuilder<RoomVoteTable>? orderBy,
    _is.OrderByListBuilder<RoomVoteTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RoomVote>(
      where: where?.call(RoomVote.t),
      orderBy: orderBy?.call(RoomVote.t),
      orderByList: orderByList?.call(RoomVote.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RoomVote] by its [id] or null if no such row exists.
  Future<RoomVote?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RoomVote>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RoomVote]s in the list and returns the inserted rows.
  ///
  /// The returned [RoomVote]s will have their `id` fields set.
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
  Future<List<RoomVote>> insert(
    _is.DatabaseSession session,
    List<RoomVote> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<RoomVote>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [RoomVote] and returns the inserted row.
  ///
  /// The returned [RoomVote] will have its `id` field set.
  Future<RoomVote> insertRow(
    _is.DatabaseSession session,
    RoomVote row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<RoomVote>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [RoomVote]s in the list and returns the resulting rows.
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
  /// The returned [RoomVote]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RoomVote>> upsert(
    _is.DatabaseSession session,
    List<RoomVote> rows, {
    required _is.ColumnSelections<RoomVoteTable> conflictColumns,
    _is.ColumnSelections<RoomVoteTable>? updateColumns,
    _is.WhereExpressionBuilder<RoomVoteTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<RoomVote>(
      rows,
      conflictColumns: conflictColumns(RoomVote.t),
      updateColumns: updateColumns?.call(RoomVote.t),
      updateWhere: updateWhere?.call(RoomVote.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [RoomVote] and returns the resulting row.
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
  /// The returned [RoomVote] will have its `id` field set.
  Future<RoomVote?> upsertRow(
    _is.DatabaseSession session,
    RoomVote row, {
    required _is.ColumnSelections<RoomVoteTable> conflictColumns,
    _is.ColumnSelections<RoomVoteTable>? updateColumns,
    _is.WhereExpressionBuilder<RoomVoteTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<RoomVote>(
      row,
      conflictColumns: conflictColumns(RoomVote.t),
      updateColumns: updateColumns?.call(RoomVote.t),
      updateWhere: updateWhere?.call(RoomVote.t),
      transaction: transaction,
    );
  }

  /// Updates all [RoomVote]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RoomVote>> update(
    _is.DatabaseSession session,
    List<RoomVote> rows, {
    _is.ColumnSelections<RoomVoteTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<RoomVote>(
      rows,
      columns: columns?.call(RoomVote.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [RoomVote]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RoomVote> updateRow(
    _is.DatabaseSession session,
    RoomVote row, {
    _is.ColumnSelections<RoomVoteTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<RoomVote>(
      row,
      columns: columns?.call(RoomVote.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RoomVote] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RoomVote?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<RoomVoteUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<RoomVote>(
      id,
      columnValues: columnValues(RoomVote.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RoomVote]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RoomVote>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<RoomVoteUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<RoomVoteTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RoomVoteTable>? orderBy,
    _is.OrderByListBuilder<RoomVoteTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<RoomVote>(
      columnValues: columnValues(RoomVote.t.updateTable),
      where: where(RoomVote.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RoomVote.t),
      orderByList: orderByList?.call(RoomVote.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [RoomVote]s in the list and returns the deleted rows.
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
  Future<List<RoomVote>> delete(
    _is.DatabaseSession session,
    List<RoomVote> rows, {
    _is.OrderByBuilder<RoomVoteTable>? orderBy,
    _is.OrderByListBuilder<RoomVoteTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<RoomVote>(
      rows,
      orderBy: orderBy?.call(RoomVote.t),
      orderByList: orderByList?.call(RoomVote.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [RoomVote].
  Future<RoomVote> deleteRow(
    _is.DatabaseSession session,
    RoomVote row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RoomVote>(
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
  Future<List<RoomVote>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RoomVoteTable> where,
    _is.OrderByBuilder<RoomVoteTable>? orderBy,
    _is.OrderByListBuilder<RoomVoteTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<RoomVote>(
      where: where(RoomVote.t),
      orderBy: orderBy?.call(RoomVote.t),
      orderByList: orderByList?.call(RoomVote.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RoomVoteTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<RoomVote>(
      where: where?.call(RoomVote.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RoomVote] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RoomVoteTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RoomVote>(
      where: where(RoomVote.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
