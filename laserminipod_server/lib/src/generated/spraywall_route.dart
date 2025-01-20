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

abstract class SpraywallRoute
    implements _i1.TableRow, _i1.ProtocolSerialization {
  SpraywallRoute._({
    this.id,
    required this.name,
    required this.handles,
  });

  factory SpraywallRoute({
    int? id,
    required String name,
    required List<int> handles,
  }) = _SpraywallRouteImpl;

  factory SpraywallRoute.fromJson(Map<String, dynamic> jsonSerialization) {
    return SpraywallRoute(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      handles:
          (jsonSerialization['handles'] as List).map((e) => e as int).toList(),
    );
  }

  static final t = SpraywallRouteTable();

  static const db = SpraywallRouteRepository._();

  @override
  int? id;

  String name;

  List<int> handles;

  @override
  _i1.Table get table => t;

  SpraywallRoute copyWith({
    int? id,
    String? name,
    List<int>? handles,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'handles': handles.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'handles': handles.toJson(),
    };
  }

  static SpraywallRouteInclude include() {
    return SpraywallRouteInclude._();
  }

  static SpraywallRouteIncludeList includeList({
    _i1.WhereExpressionBuilder<SpraywallRouteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SpraywallRouteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SpraywallRouteTable>? orderByList,
    SpraywallRouteInclude? include,
  }) {
    return SpraywallRouteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SpraywallRoute.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SpraywallRoute.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SpraywallRouteImpl extends SpraywallRoute {
  _SpraywallRouteImpl({
    int? id,
    required String name,
    required List<int> handles,
  }) : super._(
          id: id,
          name: name,
          handles: handles,
        );

  @override
  SpraywallRoute copyWith({
    Object? id = _Undefined,
    String? name,
    List<int>? handles,
  }) {
    return SpraywallRoute(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      handles: handles ?? this.handles.map((e0) => e0).toList(),
    );
  }
}

class SpraywallRouteTable extends _i1.Table {
  SpraywallRouteTable({super.tableRelation})
      : super(tableName: 'spraywallroute') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    handles = _i1.ColumnSerializable(
      'handles',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnSerializable handles;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        handles,
      ];
}

class SpraywallRouteInclude extends _i1.IncludeObject {
  SpraywallRouteInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => SpraywallRoute.t;
}

class SpraywallRouteIncludeList extends _i1.IncludeList {
  SpraywallRouteIncludeList._({
    _i1.WhereExpressionBuilder<SpraywallRouteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SpraywallRoute.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => SpraywallRoute.t;
}

class SpraywallRouteRepository {
  const SpraywallRouteRepository._();

  Future<List<SpraywallRoute>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SpraywallRouteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SpraywallRouteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SpraywallRouteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<SpraywallRoute>(
      where: where?.call(SpraywallRoute.t),
      orderBy: orderBy?.call(SpraywallRoute.t),
      orderByList: orderByList?.call(SpraywallRoute.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<SpraywallRoute?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SpraywallRouteTable>? where,
    int? offset,
    _i1.OrderByBuilder<SpraywallRouteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SpraywallRouteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<SpraywallRoute>(
      where: where?.call(SpraywallRoute.t),
      orderBy: orderBy?.call(SpraywallRoute.t),
      orderByList: orderByList?.call(SpraywallRoute.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<SpraywallRoute?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<SpraywallRoute>(
      id,
      transaction: transaction,
    );
  }

  Future<List<SpraywallRoute>> insert(
    _i1.Session session,
    List<SpraywallRoute> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SpraywallRoute>(
      rows,
      transaction: transaction,
    );
  }

  Future<SpraywallRoute> insertRow(
    _i1.Session session,
    SpraywallRoute row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SpraywallRoute>(
      row,
      transaction: transaction,
    );
  }

  Future<List<SpraywallRoute>> update(
    _i1.Session session,
    List<SpraywallRoute> rows, {
    _i1.ColumnSelections<SpraywallRouteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SpraywallRoute>(
      rows,
      columns: columns?.call(SpraywallRoute.t),
      transaction: transaction,
    );
  }

  Future<SpraywallRoute> updateRow(
    _i1.Session session,
    SpraywallRoute row, {
    _i1.ColumnSelections<SpraywallRouteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SpraywallRoute>(
      row,
      columns: columns?.call(SpraywallRoute.t),
      transaction: transaction,
    );
  }

  Future<List<SpraywallRoute>> delete(
    _i1.Session session,
    List<SpraywallRoute> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SpraywallRoute>(
      rows,
      transaction: transaction,
    );
  }

  Future<SpraywallRoute> deleteRow(
    _i1.Session session,
    SpraywallRoute row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SpraywallRoute>(
      row,
      transaction: transaction,
    );
  }

  Future<List<SpraywallRoute>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SpraywallRouteTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SpraywallRoute>(
      where: where(SpraywallRoute.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SpraywallRouteTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SpraywallRoute>(
      where: where?.call(SpraywallRoute.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
