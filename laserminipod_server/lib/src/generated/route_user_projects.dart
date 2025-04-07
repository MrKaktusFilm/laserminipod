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

abstract class RouteUserProjects
    implements _i1.TableRow, _i1.ProtocolSerialization {
  RouteUserProjects._({
    this.id,
    required this.routeId,
    required this.userId,
  });

  factory RouteUserProjects({
    int? id,
    required int routeId,
    required int userId,
  }) = _RouteUserProjectsImpl;

  factory RouteUserProjects.fromJson(Map<String, dynamic> jsonSerialization) {
    return RouteUserProjects(
      id: jsonSerialization['id'] as int?,
      routeId: jsonSerialization['routeId'] as int,
      userId: jsonSerialization['userId'] as int,
    );
  }

  static final t = RouteUserProjectsTable();

  static const db = RouteUserProjectsRepository._();

  @override
  int? id;

  int routeId;

  int userId;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [RouteUserProjects]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RouteUserProjects copyWith({
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

  static RouteUserProjectsInclude include() {
    return RouteUserProjectsInclude._();
  }

  static RouteUserProjectsIncludeList includeList({
    _i1.WhereExpressionBuilder<RouteUserProjectsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RouteUserProjectsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteUserProjectsTable>? orderByList,
    RouteUserProjectsInclude? include,
  }) {
    return RouteUserProjectsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RouteUserProjects.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RouteUserProjects.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RouteUserProjectsImpl extends RouteUserProjects {
  _RouteUserProjectsImpl({
    int? id,
    required int routeId,
    required int userId,
  }) : super._(
          id: id,
          routeId: routeId,
          userId: userId,
        );

  /// Returns a shallow copy of this [RouteUserProjects]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RouteUserProjects copyWith({
    Object? id = _Undefined,
    int? routeId,
    int? userId,
  }) {
    return RouteUserProjects(
      id: id is int? ? id : this.id,
      routeId: routeId ?? this.routeId,
      userId: userId ?? this.userId,
    );
  }
}

class RouteUserProjectsTable extends _i1.Table {
  RouteUserProjectsTable({super.tableRelation})
      : super(tableName: 'route_user_projects') {
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

class RouteUserProjectsInclude extends _i1.IncludeObject {
  RouteUserProjectsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => RouteUserProjects.t;
}

class RouteUserProjectsIncludeList extends _i1.IncludeList {
  RouteUserProjectsIncludeList._({
    _i1.WhereExpressionBuilder<RouteUserProjectsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RouteUserProjects.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => RouteUserProjects.t;
}

class RouteUserProjectsRepository {
  const RouteUserProjectsRepository._();

  /// Returns a list of [RouteUserProjects]s matching the given query parameters.
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
  Future<List<RouteUserProjects>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteUserProjectsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RouteUserProjectsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteUserProjectsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<RouteUserProjects>(
      where: where?.call(RouteUserProjects.t),
      orderBy: orderBy?.call(RouteUserProjects.t),
      orderByList: orderByList?.call(RouteUserProjects.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [RouteUserProjects] matching the given query parameters.
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
  Future<RouteUserProjects?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteUserProjectsTable>? where,
    int? offset,
    _i1.OrderByBuilder<RouteUserProjectsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteUserProjectsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<RouteUserProjects>(
      where: where?.call(RouteUserProjects.t),
      orderBy: orderBy?.call(RouteUserProjects.t),
      orderByList: orderByList?.call(RouteUserProjects.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [RouteUserProjects] by its [id] or null if no such row exists.
  Future<RouteUserProjects?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<RouteUserProjects>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [RouteUserProjects]s in the list and returns the inserted rows.
  ///
  /// The returned [RouteUserProjects]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RouteUserProjects>> insert(
    _i1.Session session,
    List<RouteUserProjects> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RouteUserProjects>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RouteUserProjects] and returns the inserted row.
  ///
  /// The returned [RouteUserProjects] will have its `id` field set.
  Future<RouteUserProjects> insertRow(
    _i1.Session session,
    RouteUserProjects row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RouteUserProjects>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RouteUserProjects]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RouteUserProjects>> update(
    _i1.Session session,
    List<RouteUserProjects> rows, {
    _i1.ColumnSelections<RouteUserProjectsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RouteUserProjects>(
      rows,
      columns: columns?.call(RouteUserProjects.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RouteUserProjects]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RouteUserProjects> updateRow(
    _i1.Session session,
    RouteUserProjects row, {
    _i1.ColumnSelections<RouteUserProjectsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RouteUserProjects>(
      row,
      columns: columns?.call(RouteUserProjects.t),
      transaction: transaction,
    );
  }

  /// Deletes all [RouteUserProjects]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RouteUserProjects>> delete(
    _i1.Session session,
    List<RouteUserProjects> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RouteUserProjects>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RouteUserProjects].
  Future<RouteUserProjects> deleteRow(
    _i1.Session session,
    RouteUserProjects row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RouteUserProjects>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RouteUserProjects>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RouteUserProjectsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RouteUserProjects>(
      where: where(RouteUserProjects.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteUserProjectsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RouteUserProjects>(
      where: where?.call(RouteUserProjects.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
