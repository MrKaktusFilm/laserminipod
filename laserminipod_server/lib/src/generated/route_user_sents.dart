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

abstract class RouteUserSents
    implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  RouteUserSents._({
    this.id,
    required this.routeId,
    required this.userId,
  });

  factory RouteUserSents({
    int? id,
    required int routeId,
    required int userId,
  }) = _RouteUserSentsImpl;

  factory RouteUserSents.fromJson(Map<String, dynamic> jsonSerialization) {
    return RouteUserSents(
      id: jsonSerialization['id'] as int?,
      routeId: jsonSerialization['routeId'] as int,
      userId: jsonSerialization['userId'] as int,
    );
  }

  static final t = RouteUserSentsTable();

  static const db = RouteUserSentsRepository._();

  @override
  int? id;

  int routeId;

  int userId;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [RouteUserSents]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RouteUserSents copyWith({
    int? id,
    int? routeId,
    int? userId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'routeId': routeId,
      'userId': userId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'routeId': routeId,
      'userId': userId,
    };
  }

  static RouteUserSentsInclude include() {
    return RouteUserSentsInclude._();
  }

  static RouteUserSentsIncludeList includeList({
    _i1.WhereExpressionBuilder<RouteUserSentsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RouteUserSentsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteUserSentsTable>? orderByList,
    RouteUserSentsInclude? include,
  }) {
    return RouteUserSentsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RouteUserSents.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RouteUserSents.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RouteUserSentsImpl extends RouteUserSents {
  _RouteUserSentsImpl({
    int? id,
    required int routeId,
    required int userId,
  }) : super._(
          id: id,
          routeId: routeId,
          userId: userId,
        );

  /// Returns a shallow copy of this [RouteUserSents]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RouteUserSents copyWith({
    Object? id = _Undefined,
    int? routeId,
    int? userId,
  }) {
    return RouteUserSents(
      id: id is int? ? id : this.id,
      routeId: routeId ?? this.routeId,
      userId: userId ?? this.userId,
    );
  }
}

class RouteUserSentsTable extends _i1.Table<int> {
  RouteUserSentsTable({super.tableRelation})
      : super(tableName: 'route_user_sents') {
    routeId = _i1.ColumnInt(
      'routeId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
  }

  late final _i1.ColumnInt routeId;

  late final _i1.ColumnInt userId;

  @override
  List<_i1.Column> get columns => [
        id,
        routeId,
        userId,
      ];
}

class RouteUserSentsInclude extends _i1.IncludeObject {
  RouteUserSentsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int> get table => RouteUserSents.t;
}

class RouteUserSentsIncludeList extends _i1.IncludeList {
  RouteUserSentsIncludeList._({
    _i1.WhereExpressionBuilder<RouteUserSentsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RouteUserSents.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => RouteUserSents.t;
}

class RouteUserSentsRepository {
  const RouteUserSentsRepository._();

  /// Returns a list of [RouteUserSents]s matching the given query parameters.
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
  Future<List<RouteUserSents>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteUserSentsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RouteUserSentsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteUserSentsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<RouteUserSents>(
      where: where?.call(RouteUserSents.t),
      orderBy: orderBy?.call(RouteUserSents.t),
      orderByList: orderByList?.call(RouteUserSents.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [RouteUserSents] matching the given query parameters.
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
  Future<RouteUserSents?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteUserSentsTable>? where,
    int? offset,
    _i1.OrderByBuilder<RouteUserSentsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteUserSentsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<RouteUserSents>(
      where: where?.call(RouteUserSents.t),
      orderBy: orderBy?.call(RouteUserSents.t),
      orderByList: orderByList?.call(RouteUserSents.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [RouteUserSents] by its [id] or null if no such row exists.
  Future<RouteUserSents?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<RouteUserSents>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [RouteUserSents]s in the list and returns the inserted rows.
  ///
  /// The returned [RouteUserSents]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RouteUserSents>> insert(
    _i1.Session session,
    List<RouteUserSents> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RouteUserSents>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RouteUserSents] and returns the inserted row.
  ///
  /// The returned [RouteUserSents] will have its `id` field set.
  Future<RouteUserSents> insertRow(
    _i1.Session session,
    RouteUserSents row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RouteUserSents>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RouteUserSents]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RouteUserSents>> update(
    _i1.Session session,
    List<RouteUserSents> rows, {
    _i1.ColumnSelections<RouteUserSentsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RouteUserSents>(
      rows,
      columns: columns?.call(RouteUserSents.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RouteUserSents]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RouteUserSents> updateRow(
    _i1.Session session,
    RouteUserSents row, {
    _i1.ColumnSelections<RouteUserSentsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RouteUserSents>(
      row,
      columns: columns?.call(RouteUserSents.t),
      transaction: transaction,
    );
  }

  /// Deletes all [RouteUserSents]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RouteUserSents>> delete(
    _i1.Session session,
    List<RouteUserSents> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RouteUserSents>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RouteUserSents].
  Future<RouteUserSents> deleteRow(
    _i1.Session session,
    RouteUserSents row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RouteUserSents>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RouteUserSents>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RouteUserSentsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RouteUserSents>(
      where: where(RouteUserSents.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteUserSentsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RouteUserSents>(
      where: where?.call(RouteUserSents.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
