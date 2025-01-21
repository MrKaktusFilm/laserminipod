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

abstract class Handle implements _i1.TableRow, _i1.ProtocolSerialization {
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
  _i1.Table get table => t;

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

class HandleTable extends _i1.Table {
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
  _i1.Table get table => Handle.t;
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
  _i1.Table get table => Handle.t;
}

class HandleRepository {
  const HandleRepository._();

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
