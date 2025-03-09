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
