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

abstract class RouteHandleState
    implements _i1.TableRow, _i1.ProtocolSerialization {
  RouteHandleState._({
    this.id,
    required this.routeId,
    required this.handleId,
    required this.state,
  });

  factory RouteHandleState({
    int? id,
    required int routeId,
    required int handleId,
    required int state,
  }) = _RouteHandleStateImpl;

  factory RouteHandleState.fromJson(Map<String, dynamic> jsonSerialization) {
    return RouteHandleState(
      id: jsonSerialization['id'] as int?,
      routeId: jsonSerialization['routeId'] as int,
      handleId: jsonSerialization['handleId'] as int,
      state: jsonSerialization['state'] as int,
    );
  }

  static final t = RouteHandleStateTable();

  static const db = RouteHandleStateRepository._();

  @override
  int? id;

  int routeId;

  int handleId;

  int state;

  int? _spraywallrouteRoutehandlestatesSpraywallrouteId;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [RouteHandleState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RouteHandleState copyWith({
    int? id,
    int? routeId,
    int? handleId,
    int? state,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'routeId': routeId,
      'handleId': handleId,
      'state': state,
      if (_spraywallrouteRoutehandlestatesSpraywallrouteId != null)
        '_spraywallrouteRoutehandlestatesSpraywallrouteId':
            _spraywallrouteRoutehandlestatesSpraywallrouteId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'routeId': routeId,
      'handleId': handleId,
      'state': state,
    };
  }

  static RouteHandleStateInclude include() {
    return RouteHandleStateInclude._();
  }

  static RouteHandleStateIncludeList includeList({
    _i1.WhereExpressionBuilder<RouteHandleStateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RouteHandleStateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteHandleStateTable>? orderByList,
    RouteHandleStateInclude? include,
  }) {
    return RouteHandleStateIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RouteHandleState.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RouteHandleState.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RouteHandleStateImpl extends RouteHandleState {
  _RouteHandleStateImpl({
    int? id,
    required int routeId,
    required int handleId,
    required int state,
  }) : super._(
          id: id,
          routeId: routeId,
          handleId: handleId,
          state: state,
        );

  /// Returns a shallow copy of this [RouteHandleState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RouteHandleState copyWith({
    Object? id = _Undefined,
    int? routeId,
    int? handleId,
    int? state,
  }) {
    return RouteHandleState(
      id: id is int? ? id : this.id,
      routeId: routeId ?? this.routeId,
      handleId: handleId ?? this.handleId,
      state: state ?? this.state,
    );
  }
}

class RouteHandleStateImplicit extends _RouteHandleStateImpl {
  RouteHandleStateImplicit._({
    int? id,
    required int routeId,
    required int handleId,
    required int state,
    this.$_spraywallrouteRoutehandlestatesSpraywallrouteId,
  }) : super(
          id: id,
          routeId: routeId,
          handleId: handleId,
          state: state,
        );

  factory RouteHandleStateImplicit(
    RouteHandleState routeHandleState, {
    int? $_spraywallrouteRoutehandlestatesSpraywallrouteId,
  }) {
    return RouteHandleStateImplicit._(
      id: routeHandleState.id,
      routeId: routeHandleState.routeId,
      handleId: routeHandleState.handleId,
      state: routeHandleState.state,
      $_spraywallrouteRoutehandlestatesSpraywallrouteId:
          $_spraywallrouteRoutehandlestatesSpraywallrouteId,
    );
  }

  int? $_spraywallrouteRoutehandlestatesSpraywallrouteId;

  @override
  Map<String, dynamic> toJson() {
    var jsonMap = super.toJson();
    jsonMap.addAll({
      '_spraywallrouteRoutehandlestatesSpraywallrouteId':
          $_spraywallrouteRoutehandlestatesSpraywallrouteId
    });
    return jsonMap;
  }
}

class RouteHandleStateTable extends _i1.Table {
  RouteHandleStateTable({super.tableRelation})
      : super(tableName: 'route_handle_state') {
    routeId = _i1.ColumnInt(
      'routeId',
      this,
    );
    handleId = _i1.ColumnInt(
      'handleId',
      this,
    );
    state = _i1.ColumnInt(
      'state',
      this,
    );
    $_spraywallrouteRoutehandlestatesSpraywallrouteId = _i1.ColumnInt(
      '_spraywallrouteRoutehandlestatesSpraywallrouteId',
      this,
    );
  }

  late final _i1.ColumnInt routeId;

  late final _i1.ColumnInt handleId;

  late final _i1.ColumnInt state;

  late final _i1.ColumnInt $_spraywallrouteRoutehandlestatesSpraywallrouteId;

  @override
  List<_i1.Column> get columns => [
        id,
        routeId,
        handleId,
        state,
        $_spraywallrouteRoutehandlestatesSpraywallrouteId,
      ];
}

class RouteHandleStateInclude extends _i1.IncludeObject {
  RouteHandleStateInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => RouteHandleState.t;
}

class RouteHandleStateIncludeList extends _i1.IncludeList {
  RouteHandleStateIncludeList._({
    _i1.WhereExpressionBuilder<RouteHandleStateTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RouteHandleState.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => RouteHandleState.t;
}

class RouteHandleStateRepository {
  const RouteHandleStateRepository._();

  /// Returns a list of [RouteHandleState]s matching the given query parameters.
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
  Future<List<RouteHandleState>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteHandleStateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RouteHandleStateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteHandleStateTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<RouteHandleState>(
      where: where?.call(RouteHandleState.t),
      orderBy: orderBy?.call(RouteHandleState.t),
      orderByList: orderByList?.call(RouteHandleState.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [RouteHandleState] matching the given query parameters.
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
  Future<RouteHandleState?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteHandleStateTable>? where,
    int? offset,
    _i1.OrderByBuilder<RouteHandleStateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteHandleStateTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<RouteHandleState>(
      where: where?.call(RouteHandleState.t),
      orderBy: orderBy?.call(RouteHandleState.t),
      orderByList: orderByList?.call(RouteHandleState.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [RouteHandleState] by its [id] or null if no such row exists.
  Future<RouteHandleState?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<RouteHandleState>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [RouteHandleState]s in the list and returns the inserted rows.
  ///
  /// The returned [RouteHandleState]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RouteHandleState>> insert(
    _i1.Session session,
    List<RouteHandleState> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RouteHandleState>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RouteHandleState] and returns the inserted row.
  ///
  /// The returned [RouteHandleState] will have its `id` field set.
  Future<RouteHandleState> insertRow(
    _i1.Session session,
    RouteHandleState row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RouteHandleState>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RouteHandleState]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RouteHandleState>> update(
    _i1.Session session,
    List<RouteHandleState> rows, {
    _i1.ColumnSelections<RouteHandleStateTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RouteHandleState>(
      rows,
      columns: columns?.call(RouteHandleState.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RouteHandleState]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RouteHandleState> updateRow(
    _i1.Session session,
    RouteHandleState row, {
    _i1.ColumnSelections<RouteHandleStateTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RouteHandleState>(
      row,
      columns: columns?.call(RouteHandleState.t),
      transaction: transaction,
    );
  }

  /// Deletes all [RouteHandleState]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RouteHandleState>> delete(
    _i1.Session session,
    List<RouteHandleState> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RouteHandleState>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RouteHandleState].
  Future<RouteHandleState> deleteRow(
    _i1.Session session,
    RouteHandleState row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RouteHandleState>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RouteHandleState>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RouteHandleStateTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RouteHandleState>(
      where: where(RouteHandleState.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteHandleStateTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RouteHandleState>(
      where: where?.call(RouteHandleState.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
