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

abstract class SavedListing
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  SavedListing._({
    this.id,
    required this.userId,
    required this.listingId,
    required this.savedAt,
  });

  factory SavedListing({
    int? id,
    required String userId,
    required int listingId,
    required DateTime savedAt,
  }) = _SavedListingImpl;

  factory SavedListing.fromJson(Map<String, dynamic> jsonSerialization) {
    return SavedListing(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as String,
      listingId: jsonSerialization['listingId'] as int,
      savedAt: _is.DateTimeJsonExtension.fromJson(jsonSerialization['savedAt']),
    );
  }

  static final t = SavedListingTable();

  static const db = SavedListingRepository._();

  @override
  int? id;

  String userId;

  int listingId;

  DateTime savedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [SavedListing]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  SavedListing copyWith({
    int? id,
    String? userId,
    int? listingId,
    DateTime? savedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SavedListing',
      if (id != null) 'id': id,
      'userId': userId,
      'listingId': listingId,
      'savedAt': savedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SavedListing',
      if (id != null) 'id': id,
      'userId': userId,
      'listingId': listingId,
      'savedAt': savedAt.toJson(),
    };
  }

  static SavedListingInclude include() {
    return SavedListingInclude._();
  }

  static SavedListingIncludeList includeList({
    _is.WhereExpressionBuilder<SavedListingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SavedListingTable>? orderBy,
    _is.OrderByListBuilder<SavedListingTable>? orderByList,
    SavedListingInclude? include,
  }) {
    return SavedListingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SavedListing.t),
      orderByList: orderByList?.call(SavedListing.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SavedListingImpl extends SavedListing {
  _SavedListingImpl({
    int? id,
    required String userId,
    required int listingId,
    required DateTime savedAt,
  }) : super._(
         id: id,
         userId: userId,
         listingId: listingId,
         savedAt: savedAt,
       );

  /// Returns a shallow copy of this [SavedListing]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  SavedListing copyWith({
    Object? id = _Undefined,
    String? userId,
    int? listingId,
    DateTime? savedAt,
  }) {
    return SavedListing(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      listingId: listingId ?? this.listingId,
      savedAt: savedAt ?? this.savedAt,
    );
  }
}

class SavedListingUpdateTable extends _is.UpdateTable<SavedListingTable> {
  SavedListingUpdateTable(super.table);

  _is.ColumnValue<String, String> userId(String value) => _is.ColumnValue(
    table.userId,
    value,
  );

  _is.ColumnValue<int, int> listingId(int value) => _is.ColumnValue(
    table.listingId,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> savedAt(DateTime value) =>
      _is.ColumnValue(
        table.savedAt,
        value,
      );
}

class SavedListingTable extends _is.Table<int?> {
  SavedListingTable({super.tableRelation}) : super(tableName: 'saved_listing') {
    updateTable = SavedListingUpdateTable(this);
    userId = _is.ColumnString(
      'userId',
      this,
    );
    listingId = _is.ColumnInt(
      'listingId',
      this,
    );
    savedAt = _is.ColumnDateTime(
      'savedAt',
      this,
    );
  }

  late final SavedListingUpdateTable updateTable;

  late final _is.ColumnString userId;

  late final _is.ColumnInt listingId;

  late final _is.ColumnDateTime savedAt;

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    listingId,
    savedAt,
  ];
}

class SavedListingInclude extends _is.IncludeObject {
  SavedListingInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => SavedListing.t;
}

class SavedListingIncludeList extends _is.IncludeList {
  SavedListingIncludeList._({
    _is.WhereExpressionBuilder<SavedListingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SavedListing.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => SavedListing.t;
}

class SavedListingRepository {
  const SavedListingRepository._();

  /// Returns a list of [SavedListing]s matching the given query parameters.
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
  Future<List<SavedListing>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SavedListingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SavedListingTable>? orderBy,
    _is.OrderByListBuilder<SavedListingTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SavedListing>(
      where: where?.call(SavedListing.t),
      orderBy: orderBy?.call(SavedListing.t),
      orderByList: orderByList?.call(SavedListing.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [SavedListing]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `SavedListing.t`.
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
  _ida.Stream<List<SavedListing>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SavedListingTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SavedListingTable>? orderBy,
    _is.OrderByListBuilder<SavedListingTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<SavedListing>(
      where: where?.call(SavedListing.t),
      orderBy: orderBy?.call(SavedListing.t),
      orderByList: orderByList?.call(SavedListing.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [SavedListing] matching the given query parameters.
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
  Future<SavedListing?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SavedListingTable>? where,
    int? offset,
    _is.OrderByBuilder<SavedListingTable>? orderBy,
    _is.OrderByListBuilder<SavedListingTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SavedListing>(
      where: where?.call(SavedListing.t),
      orderBy: orderBy?.call(SavedListing.t),
      orderByList: orderByList?.call(SavedListing.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SavedListing] by its [id] or null if no such row exists.
  Future<SavedListing?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SavedListing>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SavedListing]s in the list and returns the inserted rows.
  ///
  /// The returned [SavedListing]s will have their `id` fields set.
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
  Future<List<SavedListing>> insert(
    _is.DatabaseSession session,
    List<SavedListing> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<SavedListing>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [SavedListing] and returns the inserted row.
  ///
  /// The returned [SavedListing] will have its `id` field set.
  Future<SavedListing> insertRow(
    _is.DatabaseSession session,
    SavedListing row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<SavedListing>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [SavedListing]s in the list and returns the resulting rows.
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
  /// The returned [SavedListing]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SavedListing>> upsert(
    _is.DatabaseSession session,
    List<SavedListing> rows, {
    required _is.ColumnSelections<SavedListingTable> conflictColumns,
    _is.ColumnSelections<SavedListingTable>? updateColumns,
    _is.WhereExpressionBuilder<SavedListingTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<SavedListing>(
      rows,
      conflictColumns: conflictColumns(SavedListing.t),
      updateColumns: updateColumns?.call(SavedListing.t),
      updateWhere: updateWhere?.call(SavedListing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [SavedListing] and returns the resulting row.
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
  /// The returned [SavedListing] will have its `id` field set.
  Future<SavedListing?> upsertRow(
    _is.DatabaseSession session,
    SavedListing row, {
    required _is.ColumnSelections<SavedListingTable> conflictColumns,
    _is.ColumnSelections<SavedListingTable>? updateColumns,
    _is.WhereExpressionBuilder<SavedListingTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<SavedListing>(
      row,
      conflictColumns: conflictColumns(SavedListing.t),
      updateColumns: updateColumns?.call(SavedListing.t),
      updateWhere: updateWhere?.call(SavedListing.t),
      transaction: transaction,
    );
  }

  /// Updates all [SavedListing]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SavedListing>> update(
    _is.DatabaseSession session,
    List<SavedListing> rows, {
    _is.ColumnSelections<SavedListingTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<SavedListing>(
      rows,
      columns: columns?.call(SavedListing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [SavedListing]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SavedListing> updateRow(
    _is.DatabaseSession session,
    SavedListing row, {
    _is.ColumnSelections<SavedListingTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<SavedListing>(
      row,
      columns: columns?.call(SavedListing.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SavedListing] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SavedListing?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<SavedListingUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<SavedListing>(
      id,
      columnValues: columnValues(SavedListing.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SavedListing]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SavedListing>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<SavedListingUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<SavedListingTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SavedListingTable>? orderBy,
    _is.OrderByListBuilder<SavedListingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<SavedListing>(
      columnValues: columnValues(SavedListing.t.updateTable),
      where: where(SavedListing.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SavedListing.t),
      orderByList: orderByList?.call(SavedListing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [SavedListing]s in the list and returns the deleted rows.
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
  Future<List<SavedListing>> delete(
    _is.DatabaseSession session,
    List<SavedListing> rows, {
    _is.OrderByBuilder<SavedListingTable>? orderBy,
    _is.OrderByListBuilder<SavedListingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<SavedListing>(
      rows,
      orderBy: orderBy?.call(SavedListing.t),
      orderByList: orderByList?.call(SavedListing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [SavedListing].
  Future<SavedListing> deleteRow(
    _is.DatabaseSession session,
    SavedListing row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SavedListing>(
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
  Future<List<SavedListing>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SavedListingTable> where,
    _is.OrderByBuilder<SavedListingTable>? orderBy,
    _is.OrderByListBuilder<SavedListingTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<SavedListing>(
      where: where(SavedListing.t),
      orderBy: orderBy?.call(SavedListing.t),
      orderByList: orderByList?.call(SavedListing.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SavedListingTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<SavedListing>(
      where: where?.call(SavedListing.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SavedListing] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SavedListingTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SavedListing>(
      where: where(SavedListing.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
