/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Handle implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  Handle._({
    this.id,
    required this.x,
    required this.y,
    required this.radius,
  });

  factory Handle({
    int? id,
    required int x,
    required int y,
    required int radius,
  }) = _HandleImpl;

  factory Handle.fromJson(Map<String, dynamic> jsonSerialization) {
    return Handle(
      id: jsonSerialization['id'] as int?,
      x: jsonSerialization['x'] as int,
      y: jsonSerialization['y'] as int,
      radius: jsonSerialization['radius'] as int,
    );
  }

  static final t = HandleTable();

  static const db = HandleRepository._();

  @override
  int? id;

  int x;

  int y;

  int radius;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [Handle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Handle copyWith({
    int? id,
    int? x,
    int? y,
    int? radius,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'x': x,
      'y': y,
      'radius': radius,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'x': x,
      'y': y,
      'radius': radius,
    };
  }

  static HandleInclude include() {
    return HandleInclude._();
  }

  static HandleIncludeList includeList({
    _i1.WhereExpressionBuilder<HandleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HandleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HandleTable>? orderByList,
    HandleInclude? include,
  }) {
    return HandleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Handle.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Handle.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HandleImpl extends Handle {
  _HandleImpl({
    int? id,
    required int x,
    required int y,
    required int radius,
  }) : super._(
          id: id,
          x: x,
          y: y,
          radius: radius,
        );

  /// Returns a shallow copy of this [Handle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Handle copyWith({
    Object? id = _Undefined,
    int? x,
    int? y,
    int? radius,
  }) {
    return Handle(
      id: id is int? ? id : this.id,
      x: x ?? this.x,
      y: y ?? this.y,
      radius: radius ?? this.radius,
    );
  }
}

class HandleTable extends _i1.Table<int> {
  HandleTable({super.tableRelation}) : super(tableName: 'handle') {
    x = _i1.ColumnInt(
      'x',
      this,
    );
    y = _i1.ColumnInt(
      'y',
      this,
    );
    radius = _i1.ColumnInt(
      'radius',
      this,
    );
  }

  late final _i1.ColumnInt x;

  late final _i1.ColumnInt y;

  late final _i1.ColumnInt radius;

  @override
  List<_i1.Column> get columns => [
        id,
        x,
        y,
        radius,
      ];
}

class HandleInclude extends _i1.IncludeObject {
  HandleInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int> get table => Handle.t;
}

class HandleIncludeList extends _i1.IncludeList {
  HandleIncludeList._({
    _i1.WhereExpressionBuilder<HandleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Handle.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => Handle.t;
}

class HandleRepository {
  const HandleRepository._();

  /// Returns a list of [Handle]s matching the given query parameters.
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
  Future<List<Handle>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HandleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HandleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HandleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Handle>(
      where: where?.call(Handle.t),
      orderBy: orderBy?.call(Handle.t),
      orderByList: orderByList?.call(Handle.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Handle] matching the given query parameters.
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
  Future<Handle?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HandleTable>? where,
    int? offset,
    _i1.OrderByBuilder<HandleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HandleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Handle>(
      where: where?.call(Handle.t),
      orderBy: orderBy?.call(Handle.t),
      orderByList: orderByList?.call(Handle.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Handle] by its [id] or null if no such row exists.
  Future<Handle?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Handle>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Handle]s in the list and returns the inserted rows.
  ///
  /// The returned [Handle]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Handle>> insert(
    _i1.Session session,
    List<Handle> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Handle>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Handle] and returns the inserted row.
  ///
  /// The returned [Handle] will have its `id` field set.
  Future<Handle> insertRow(
    _i1.Session session,
    Handle row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Handle>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Handle]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Handle>> update(
    _i1.Session session,
    List<Handle> rows, {
    _i1.ColumnSelections<HandleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Handle>(
      rows,
      columns: columns?.call(Handle.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Handle]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Handle> updateRow(
    _i1.Session session,
    Handle row, {
    _i1.ColumnSelections<HandleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Handle>(
      row,
      columns: columns?.call(Handle.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Handle]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Handle>> delete(
    _i1.Session session,
    List<Handle> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Handle>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Handle].
  Future<Handle> deleteRow(
    _i1.Session session,
    Handle row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Handle>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Handle>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<HandleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Handle>(
      where: where(Handle.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HandleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Handle>(
      where: where?.call(Handle.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
