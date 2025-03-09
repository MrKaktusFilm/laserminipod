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
