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

abstract class UserReport
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  UserReport._({
    this.id,
    required this.reporterUserId,
    required this.targetEntity,
    required this.targetId,
    required this.reason,
    this.details,
    required this.createdAt,
  });

  factory UserReport({
    int? id,
    required String reporterUserId,
    required String targetEntity,
    required String targetId,
    required String reason,
    String? details,
    required DateTime createdAt,
  }) = _UserReportImpl;

  factory UserReport.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserReport(
      id: jsonSerialization['id'] as int?,
      reporterUserId: jsonSerialization['reporterUserId'] as String,
      targetEntity: jsonSerialization['targetEntity'] as String,
      targetId: jsonSerialization['targetId'] as String,
      reason: jsonSerialization['reason'] as String,
      details: jsonSerialization['details'] as String?,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = UserReportTable();

  static const db = UserReportRepository._();

  @override
  int? id;

  String reporterUserId;

  String targetEntity;

  String targetId;

  String reason;

  String? details;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserReport]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  UserReport copyWith({
    int? id,
    String? reporterUserId,
    String? targetEntity,
    String? targetId,
    String? reason,
    String? details,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserReport',
      if (id != null) 'id': id,
      'reporterUserId': reporterUserId,
      'targetEntity': targetEntity,
      'targetId': targetId,
      'reason': reason,
      if (details != null) 'details': details,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserReport',
      if (id != null) 'id': id,
      'reporterUserId': reporterUserId,
      'targetEntity': targetEntity,
      'targetId': targetId,
      'reason': reason,
      if (details != null) 'details': details,
      'createdAt': createdAt.toJson(),
    };
  }

  static UserReportInclude include() {
    return UserReportInclude._();
  }

  static UserReportIncludeList includeList({
    _is.WhereExpressionBuilder<UserReportTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<UserReportTable>? orderBy,
    _is.OrderByListBuilder<UserReportTable>? orderByList,
    UserReportInclude? include,
  }) {
    return UserReportIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserReport.t),
      orderByList: orderByList?.call(UserReport.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserReportImpl extends UserReport {
  _UserReportImpl({
    int? id,
    required String reporterUserId,
    required String targetEntity,
    required String targetId,
    required String reason,
    String? details,
    required DateTime createdAt,
  }) : super._(
         id: id,
         reporterUserId: reporterUserId,
         targetEntity: targetEntity,
         targetId: targetId,
         reason: reason,
         details: details,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [UserReport]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  UserReport copyWith({
    Object? id = _Undefined,
    String? reporterUserId,
    String? targetEntity,
    String? targetId,
    String? reason,
    Object? details = _Undefined,
    DateTime? createdAt,
  }) {
    return UserReport(
      id: id is int? ? id : this.id,
      reporterUserId: reporterUserId ?? this.reporterUserId,
      targetEntity: targetEntity ?? this.targetEntity,
      targetId: targetId ?? this.targetId,
      reason: reason ?? this.reason,
      details: details is String? ? details : this.details,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class UserReportUpdateTable extends _is.UpdateTable<UserReportTable> {
  UserReportUpdateTable(super.table);

  _is.ColumnValue<String, String> reporterUserId(String value) =>
      _is.ColumnValue(
        table.reporterUserId,
        value,
      );

  _is.ColumnValue<String, String> targetEntity(String value) => _is.ColumnValue(
    table.targetEntity,
    value,
  );

  _is.ColumnValue<String, String> targetId(String value) => _is.ColumnValue(
    table.targetId,
    value,
  );

  _is.ColumnValue<String, String> reason(String value) => _is.ColumnValue(
    table.reason,
    value,
  );

  _is.ColumnValue<String, String> details(String? value) => _is.ColumnValue(
    table.details,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class UserReportTable extends _is.Table<int?> {
  UserReportTable({super.tableRelation}) : super(tableName: 'user_report') {
    updateTable = UserReportUpdateTable(this);
    reporterUserId = _is.ColumnString(
      'reporterUserId',
      this,
    );
    targetEntity = _is.ColumnString(
      'targetEntity',
      this,
    );
    targetId = _is.ColumnString(
      'targetId',
      this,
    );
    reason = _is.ColumnString(
      'reason',
      this,
    );
    details = _is.ColumnString(
      'details',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final UserReportUpdateTable updateTable;

  late final _is.ColumnString reporterUserId;

  late final _is.ColumnString targetEntity;

  late final _is.ColumnString targetId;

  late final _is.ColumnString reason;

  late final _is.ColumnString details;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    reporterUserId,
    targetEntity,
    targetId,
    reason,
    details,
    createdAt,
  ];
}

class UserReportInclude extends _is.IncludeObject {
  UserReportInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => UserReport.t;
}

class UserReportIncludeList extends _is.IncludeList {
  UserReportIncludeList._({
    _is.WhereExpressionBuilder<UserReportTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserReport.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => UserReport.t;
}

class UserReportRepository {
  const UserReportRepository._();

  /// Returns a list of [UserReport]s matching the given query parameters.
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
  Future<List<UserReport>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<UserReportTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<UserReportTable>? orderBy,
    _is.OrderByListBuilder<UserReportTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<UserReport>(
      where: where?.call(UserReport.t),
      orderBy: orderBy?.call(UserReport.t),
      orderByList: orderByList?.call(UserReport.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [UserReport]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `UserReport.t`.
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
  _ida.Stream<List<UserReport>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<UserReportTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<UserReportTable>? orderBy,
    _is.OrderByListBuilder<UserReportTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<UserReport>(
      where: where?.call(UserReport.t),
      orderBy: orderBy?.call(UserReport.t),
      orderByList: orderByList?.call(UserReport.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [UserReport] matching the given query parameters.
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
  Future<UserReport?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<UserReportTable>? where,
    int? offset,
    _is.OrderByBuilder<UserReportTable>? orderBy,
    _is.OrderByListBuilder<UserReportTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<UserReport>(
      where: where?.call(UserReport.t),
      orderBy: orderBy?.call(UserReport.t),
      orderByList: orderByList?.call(UserReport.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [UserReport] by its [id] or null if no such row exists.
  Future<UserReport?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<UserReport>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [UserReport]s in the list and returns the inserted rows.
  ///
  /// The returned [UserReport]s will have their `id` fields set.
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
  Future<List<UserReport>> insert(
    _is.DatabaseSession session,
    List<UserReport> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<UserReport>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [UserReport] and returns the inserted row.
  ///
  /// The returned [UserReport] will have its `id` field set.
  Future<UserReport> insertRow(
    _is.DatabaseSession session,
    UserReport row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserReport>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [UserReport]s in the list and returns the resulting rows.
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
  /// The returned [UserReport]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserReport>> upsert(
    _is.DatabaseSession session,
    List<UserReport> rows, {
    required _is.ColumnSelections<UserReportTable> conflictColumns,
    _is.ColumnSelections<UserReportTable>? updateColumns,
    _is.WhereExpressionBuilder<UserReportTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<UserReport>(
      rows,
      conflictColumns: conflictColumns(UserReport.t),
      updateColumns: updateColumns?.call(UserReport.t),
      updateWhere: updateWhere?.call(UserReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [UserReport] and returns the resulting row.
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
  /// The returned [UserReport] will have its `id` field set.
  Future<UserReport?> upsertRow(
    _is.DatabaseSession session,
    UserReport row, {
    required _is.ColumnSelections<UserReportTable> conflictColumns,
    _is.ColumnSelections<UserReportTable>? updateColumns,
    _is.WhereExpressionBuilder<UserReportTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<UserReport>(
      row,
      conflictColumns: conflictColumns(UserReport.t),
      updateColumns: updateColumns?.call(UserReport.t),
      updateWhere: updateWhere?.call(UserReport.t),
      transaction: transaction,
    );
  }

  /// Updates all [UserReport]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserReport>> update(
    _is.DatabaseSession session,
    List<UserReport> rows, {
    _is.ColumnSelections<UserReportTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<UserReport>(
      rows,
      columns: columns?.call(UserReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [UserReport]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserReport> updateRow(
    _is.DatabaseSession session,
    UserReport row, {
    _is.ColumnSelections<UserReportTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserReport>(
      row,
      columns: columns?.call(UserReport.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserReport] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserReport?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<UserReportUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<UserReport>(
      id,
      columnValues: columnValues(UserReport.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserReport]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserReport>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<UserReportUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<UserReportTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<UserReportTable>? orderBy,
    _is.OrderByListBuilder<UserReportTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<UserReport>(
      columnValues: columnValues(UserReport.t.updateTable),
      where: where(UserReport.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserReport.t),
      orderByList: orderByList?.call(UserReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [UserReport]s in the list and returns the deleted rows.
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
  Future<List<UserReport>> delete(
    _is.DatabaseSession session,
    List<UserReport> rows, {
    _is.OrderByBuilder<UserReportTable>? orderBy,
    _is.OrderByListBuilder<UserReportTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<UserReport>(
      rows,
      orderBy: orderBy?.call(UserReport.t),
      orderByList: orderByList?.call(UserReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [UserReport].
  Future<UserReport> deleteRow(
    _is.DatabaseSession session,
    UserReport row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserReport>(
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
  Future<List<UserReport>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<UserReportTable> where,
    _is.OrderByBuilder<UserReportTable>? orderBy,
    _is.OrderByListBuilder<UserReportTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<UserReport>(
      where: where(UserReport.t),
      orderBy: orderBy?.call(UserReport.t),
      orderByList: orderByList?.call(UserReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<UserReportTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<UserReport>(
      where: where?.call(UserReport.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [UserReport] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<UserReportTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<UserReport>(
      where: where(UserReport.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
