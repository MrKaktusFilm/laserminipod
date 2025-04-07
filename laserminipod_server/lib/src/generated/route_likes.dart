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

abstract class RouteLikes implements _i1.TableRow, _i1.ProtocolSerialization {
  RouteLikes._({
    this.id,
    required this.routeId,
    required this.userId,
  });

  factory RouteLikes({
    int? id,
    required int routeId,
    required int userId,
  }) = _RouteLikesImpl;

  factory RouteLikes.fromJson(Map<String, dynamic> jsonSerialization) {
    return RouteLikes(
      id: jsonSerialization['id'] as int?,
      routeId: jsonSerialization['routeId'] as int,
      userId: jsonSerialization['userId'] as int,
    );
  }

  static final t = RouteLikesTable();

  static const db = RouteLikesRepository._();

  @override
  int? id;

  int routeId;

  int userId;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [RouteLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RouteLikes copyWith({
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

  static RouteLikesInclude include() {
    return RouteLikesInclude._();
  }

  static RouteLikesIncludeList includeList({
    _i1.WhereExpressionBuilder<RouteLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RouteLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteLikesTable>? orderByList,
    RouteLikesInclude? include,
  }) {
    return RouteLikesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RouteLikes.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RouteLikes.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RouteLikesImpl extends RouteLikes {
  _RouteLikesImpl({
    int? id,
    required int routeId,
    required int userId,
  }) : super._(
          id: id,
          routeId: routeId,
          userId: userId,
        );

  /// Returns a shallow copy of this [RouteLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RouteLikes copyWith({
    Object? id = _Undefined,
    int? routeId,
    int? userId,
  }) {
    return RouteLikes(
      id: id is int? ? id : this.id,
      routeId: routeId ?? this.routeId,
      userId: userId ?? this.userId,
    );
  }
}

class RouteLikesTable extends _i1.Table {
  RouteLikesTable({super.tableRelation}) : super(tableName: 'route_likes') {
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

class RouteLikesInclude extends _i1.IncludeObject {
  RouteLikesInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => RouteLikes.t;
}

class RouteLikesIncludeList extends _i1.IncludeList {
  RouteLikesIncludeList._({
    _i1.WhereExpressionBuilder<RouteLikesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RouteLikes.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => RouteLikes.t;
}

class RouteLikesRepository {
  const RouteLikesRepository._();

  /// Returns a list of [RouteLikes]s matching the given query parameters.
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
  Future<List<RouteLikes>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RouteLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteLikesTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<RouteLikes>(
      where: where?.call(RouteLikes.t),
      orderBy: orderBy?.call(RouteLikes.t),
      orderByList: orderByList?.call(RouteLikes.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [RouteLikes] matching the given query parameters.
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
  Future<RouteLikes?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteLikesTable>? where,
    int? offset,
    _i1.OrderByBuilder<RouteLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteLikesTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<RouteLikes>(
      where: where?.call(RouteLikes.t),
      orderBy: orderBy?.call(RouteLikes.t),
      orderByList: orderByList?.call(RouteLikes.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [RouteLikes] by its [id] or null if no such row exists.
  Future<RouteLikes?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<RouteLikes>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [RouteLikes]s in the list and returns the inserted rows.
  ///
  /// The returned [RouteLikes]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RouteLikes>> insert(
    _i1.Session session,
    List<RouteLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RouteLikes>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RouteLikes] and returns the inserted row.
  ///
  /// The returned [RouteLikes] will have its `id` field set.
  Future<RouteLikes> insertRow(
    _i1.Session session,
    RouteLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RouteLikes>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RouteLikes]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RouteLikes>> update(
    _i1.Session session,
    List<RouteLikes> rows, {
    _i1.ColumnSelections<RouteLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RouteLikes>(
      rows,
      columns: columns?.call(RouteLikes.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RouteLikes]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RouteLikes> updateRow(
    _i1.Session session,
    RouteLikes row, {
    _i1.ColumnSelections<RouteLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RouteLikes>(
      row,
      columns: columns?.call(RouteLikes.t),
      transaction: transaction,
    );
  }

  /// Deletes all [RouteLikes]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RouteLikes>> delete(
    _i1.Session session,
    List<RouteLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RouteLikes>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RouteLikes].
  Future<RouteLikes> deleteRow(
    _i1.Session session,
    RouteLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RouteLikes>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RouteLikes>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RouteLikesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RouteLikes>(
      where: where(RouteLikes.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteLikesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RouteLikes>(
      where: where?.call(RouteLikes.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
