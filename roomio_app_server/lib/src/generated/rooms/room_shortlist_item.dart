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

abstract class RoomShortlistItem
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  RoomShortlistItem._({
    this.id,
    required this.roomId,
    required this.listingId,
    required this.addedByUserId,
    required this.addedByName,
    required this.addedAt,
  });

  factory RoomShortlistItem({
    int? id,
    required int roomId,
    required int listingId,
    required String addedByUserId,
    required String addedByName,
    required DateTime addedAt,
  }) = _RoomShortlistItemImpl;

  factory RoomShortlistItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return RoomShortlistItem(
      id: jsonSerialization['id'] as int?,
      roomId: jsonSerialization['roomId'] as int,
      listingId: jsonSerialization['listingId'] as int,
      addedByUserId: jsonSerialization['addedByUserId'] as String,
      addedByName: jsonSerialization['addedByName'] as String,
      addedAt: _is.DateTimeJsonExtension.fromJson(jsonSerialization['addedAt']),
    );
  }

  static final t = RoomShortlistItemTable();

  static const db = RoomShortlistItemRepository._();

  @override
  int? id;

  int roomId;

  int listingId;

  String addedByUserId;

  String addedByName;

  DateTime addedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [RoomShortlistItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RoomShortlistItem copyWith({
    int? id,
    int? roomId,
    int? listingId,
    String? addedByUserId,
    String? addedByName,
    DateTime? addedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RoomShortlistItem',
      if (id != null) 'id': id,
      'roomId': roomId,
      'listingId': listingId,
      'addedByUserId': addedByUserId,
      'addedByName': addedByName,
      'addedAt': addedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RoomShortlistItem',
      if (id != null) 'id': id,
      'roomId': roomId,
      'listingId': listingId,
      'addedByUserId': addedByUserId,
      'addedByName': addedByName,
      'addedAt': addedAt.toJson(),
    };
  }

  static RoomShortlistItemInclude include() {
    return RoomShortlistItemInclude._();
  }

  static RoomShortlistItemIncludeList includeList({
    _is.WhereExpressionBuilder<RoomShortlistItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RoomShortlistItemTable>? orderBy,
    _is.OrderByListBuilder<RoomShortlistItemTable>? orderByList,
    RoomShortlistItemInclude? include,
  }) {
    return RoomShortlistItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RoomShortlistItem.t),
      orderByList: orderByList?.call(RoomShortlistItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoomShortlistItemImpl extends RoomShortlistItem {
  _RoomShortlistItemImpl({
    int? id,
    required int roomId,
    required int listingId,
    required String addedByUserId,
    required String addedByName,
    required DateTime addedAt,
  }) : super._(
         id: id,
         roomId: roomId,
         listingId: listingId,
         addedByUserId: addedByUserId,
         addedByName: addedByName,
         addedAt: addedAt,
       );

  /// Returns a shallow copy of this [RoomShortlistItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RoomShortlistItem copyWith({
    Object? id = _Undefined,
    int? roomId,
    int? listingId,
    String? addedByUserId,
    String? addedByName,
    DateTime? addedAt,
  }) {
    return RoomShortlistItem(
      id: id is int? ? id : this.id,
      roomId: roomId ?? this.roomId,
      listingId: listingId ?? this.listingId,
      addedByUserId: addedByUserId ?? this.addedByUserId,
      addedByName: addedByName ?? this.addedByName,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}

class RoomShortlistItemUpdateTable
    extends _is.UpdateTable<RoomShortlistItemTable> {
  RoomShortlistItemUpdateTable(super.table);

  _is.ColumnValue<int, int> roomId(int value) => _is.ColumnValue(
    table.roomId,
    value,
  );

  _is.ColumnValue<int, int> listingId(int value) => _is.ColumnValue(
    table.listingId,
    value,
  );

  _is.ColumnValue<String, String> addedByUserId(String value) =>
      _is.ColumnValue(
        table.addedByUserId,
        value,
      );

  _is.ColumnValue<String, String> addedByName(String value) => _is.ColumnValue(
    table.addedByName,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> addedAt(DateTime value) =>
      _is.ColumnValue(
        table.addedAt,
        value,
      );
}

class RoomShortlistItemTable extends _is.Table<int?> {
  RoomShortlistItemTable({super.tableRelation})
    : super(tableName: 'room_shortlist_item') {
    updateTable = RoomShortlistItemUpdateTable(this);
    roomId = _is.ColumnInt(
      'roomId',
      this,
    );
    listingId = _is.ColumnInt(
      'listingId',
      this,
    );
    addedByUserId = _is.ColumnString(
      'addedByUserId',
      this,
    );
    addedByName = _is.ColumnString(
      'addedByName',
      this,
    );
    addedAt = _is.ColumnDateTime(
      'addedAt',
      this,
    );
  }

  late final RoomShortlistItemUpdateTable updateTable;

  late final _is.ColumnInt roomId;

  late final _is.ColumnInt listingId;

  late final _is.ColumnString addedByUserId;

  late final _is.ColumnString addedByName;

  late final _is.ColumnDateTime addedAt;

  @override
  List<_is.Column> get columns => [
    id,
    roomId,
    listingId,
    addedByUserId,
    addedByName,
    addedAt,
  ];
}

class RoomShortlistItemInclude extends _is.IncludeObject {
  RoomShortlistItemInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => RoomShortlistItem.t;
}

class RoomShortlistItemIncludeList extends _is.IncludeList {
  RoomShortlistItemIncludeList._({
    _is.WhereExpressionBuilder<RoomShortlistItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RoomShortlistItem.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => RoomShortlistItem.t;
}

class RoomShortlistItemRepository {
  const RoomShortlistItemRepository._();

  /// Returns a list of [RoomShortlistItem]s matching the given query parameters.
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
  Future<List<RoomShortlistItem>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RoomShortlistItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RoomShortlistItemTable>? orderBy,
    _is.OrderByListBuilder<RoomShortlistItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RoomShortlistItem>(
      where: where?.call(RoomShortlistItem.t),
      orderBy: orderBy?.call(RoomShortlistItem.t),
      orderByList: orderByList?.call(RoomShortlistItem.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [RoomShortlistItem]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `RoomShortlistItem.t`.
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
  _ida.Stream<List<RoomShortlistItem>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RoomShortlistItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RoomShortlistItemTable>? orderBy,
    _is.OrderByListBuilder<RoomShortlistItemTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<RoomShortlistItem>(
      where: where?.call(RoomShortlistItem.t),
      orderBy: orderBy?.call(RoomShortlistItem.t),
      orderByList: orderByList?.call(RoomShortlistItem.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [RoomShortlistItem] matching the given query parameters.
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
  Future<RoomShortlistItem?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RoomShortlistItemTable>? where,
    int? offset,
    _is.OrderByBuilder<RoomShortlistItemTable>? orderBy,
    _is.OrderByListBuilder<RoomShortlistItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RoomShortlistItem>(
      where: where?.call(RoomShortlistItem.t),
      orderBy: orderBy?.call(RoomShortlistItem.t),
      orderByList: orderByList?.call(RoomShortlistItem.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RoomShortlistItem] by its [id] or null if no such row exists.
  Future<RoomShortlistItem?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RoomShortlistItem>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RoomShortlistItem]s in the list and returns the inserted rows.
  ///
  /// The returned [RoomShortlistItem]s will have their `id` fields set.
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
  Future<List<RoomShortlistItem>> insert(
    _is.DatabaseSession session,
    List<RoomShortlistItem> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<RoomShortlistItem>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [RoomShortlistItem] and returns the inserted row.
  ///
  /// The returned [RoomShortlistItem] will have its `id` field set.
  Future<RoomShortlistItem> insertRow(
    _is.DatabaseSession session,
    RoomShortlistItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<RoomShortlistItem>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [RoomShortlistItem]s in the list and returns the resulting rows.
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
  /// The returned [RoomShortlistItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RoomShortlistItem>> upsert(
    _is.DatabaseSession session,
    List<RoomShortlistItem> rows, {
    required _is.ColumnSelections<RoomShortlistItemTable> conflictColumns,
    _is.ColumnSelections<RoomShortlistItemTable>? updateColumns,
    _is.WhereExpressionBuilder<RoomShortlistItemTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<RoomShortlistItem>(
      rows,
      conflictColumns: conflictColumns(RoomShortlistItem.t),
      updateColumns: updateColumns?.call(RoomShortlistItem.t),
      updateWhere: updateWhere?.call(RoomShortlistItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [RoomShortlistItem] and returns the resulting row.
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
  /// The returned [RoomShortlistItem] will have its `id` field set.
  Future<RoomShortlistItem?> upsertRow(
    _is.DatabaseSession session,
    RoomShortlistItem row, {
    required _is.ColumnSelections<RoomShortlistItemTable> conflictColumns,
    _is.ColumnSelections<RoomShortlistItemTable>? updateColumns,
    _is.WhereExpressionBuilder<RoomShortlistItemTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<RoomShortlistItem>(
      row,
      conflictColumns: conflictColumns(RoomShortlistItem.t),
      updateColumns: updateColumns?.call(RoomShortlistItem.t),
      updateWhere: updateWhere?.call(RoomShortlistItem.t),
      transaction: transaction,
    );
  }

  /// Updates all [RoomShortlistItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RoomShortlistItem>> update(
    _is.DatabaseSession session,
    List<RoomShortlistItem> rows, {
    _is.ColumnSelections<RoomShortlistItemTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<RoomShortlistItem>(
      rows,
      columns: columns?.call(RoomShortlistItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [RoomShortlistItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RoomShortlistItem> updateRow(
    _is.DatabaseSession session,
    RoomShortlistItem row, {
    _is.ColumnSelections<RoomShortlistItemTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<RoomShortlistItem>(
      row,
      columns: columns?.call(RoomShortlistItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RoomShortlistItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RoomShortlistItem?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<RoomShortlistItemUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<RoomShortlistItem>(
      id,
      columnValues: columnValues(RoomShortlistItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RoomShortlistItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RoomShortlistItem>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<RoomShortlistItemUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<RoomShortlistItemTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RoomShortlistItemTable>? orderBy,
    _is.OrderByListBuilder<RoomShortlistItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<RoomShortlistItem>(
      columnValues: columnValues(RoomShortlistItem.t.updateTable),
      where: where(RoomShortlistItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RoomShortlistItem.t),
      orderByList: orderByList?.call(RoomShortlistItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [RoomShortlistItem]s in the list and returns the deleted rows.
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
  Future<List<RoomShortlistItem>> delete(
    _is.DatabaseSession session,
    List<RoomShortlistItem> rows, {
    _is.OrderByBuilder<RoomShortlistItemTable>? orderBy,
    _is.OrderByListBuilder<RoomShortlistItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<RoomShortlistItem>(
      rows,
      orderBy: orderBy?.call(RoomShortlistItem.t),
      orderByList: orderByList?.call(RoomShortlistItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [RoomShortlistItem].
  Future<RoomShortlistItem> deleteRow(
    _is.DatabaseSession session,
    RoomShortlistItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RoomShortlistItem>(
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
  Future<List<RoomShortlistItem>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RoomShortlistItemTable> where,
    _is.OrderByBuilder<RoomShortlistItemTable>? orderBy,
    _is.OrderByListBuilder<RoomShortlistItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<RoomShortlistItem>(
      where: where(RoomShortlistItem.t),
      orderBy: orderBy?.call(RoomShortlistItem.t),
      orderByList: orderByList?.call(RoomShortlistItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RoomShortlistItemTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<RoomShortlistItem>(
      where: where?.call(RoomShortlistItem.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RoomShortlistItem] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RoomShortlistItemTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RoomShortlistItem>(
      where: where(RoomShortlistItem.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
