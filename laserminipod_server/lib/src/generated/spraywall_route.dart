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
    this.description,
    required this.difficulty,
    required this.handles,
    DateTime? creationDate,
    required this.userInfoId,
  }) : creationDate = creationDate ?? DateTime.now();

  factory SpraywallRoute({
    int? id,
    required String name,
    String? description,
    required int difficulty,
    required List<int> handles,
    DateTime? creationDate,
    required int userInfoId,
  }) = _SpraywallRouteImpl;

  factory SpraywallRoute.fromJson(Map<String, dynamic> jsonSerialization) {
    return SpraywallRoute(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      difficulty: jsonSerialization['difficulty'] as int,
      handles:
          (jsonSerialization['handles'] as List).map((e) => e as int).toList(),
      creationDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['creationDate']),
      userInfoId: jsonSerialization['userInfoId'] as int,
    );
  }

  static final t = SpraywallRouteTable();

  static const db = SpraywallRouteRepository._();

  @override
  int? id;

  String name;

  String? description;

  int difficulty;

  List<int> handles;

  DateTime creationDate;

  int userInfoId;

  @override
  _i1.Table get table => t;

  SpraywallRoute copyWith({
    int? id,
    String? name,
    String? description,
    int? difficulty,
    List<int>? handles,
    DateTime? creationDate,
    int? userInfoId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'difficulty': difficulty,
      'handles': handles.toJson(),
      'creationDate': creationDate.toJson(),
      'userInfoId': userInfoId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'difficulty': difficulty,
      'handles': handles.toJson(),
      'creationDate': creationDate.toJson(),
      'userInfoId': userInfoId,
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
    String? description,
    required int difficulty,
    required List<int> handles,
    DateTime? creationDate,
    required int userInfoId,
  }) : super._(
          id: id,
          name: name,
          description: description,
          difficulty: difficulty,
          handles: handles,
          creationDate: creationDate,
          userInfoId: userInfoId,
        );

  @override
  SpraywallRoute copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    int? difficulty,
    List<int>? handles,
    DateTime? creationDate,
    int? userInfoId,
  }) {
    return SpraywallRoute(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      difficulty: difficulty ?? this.difficulty,
      handles: handles ?? this.handles.map((e0) => e0).toList(),
      creationDate: creationDate ?? this.creationDate,
      userInfoId: userInfoId ?? this.userInfoId,
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
    description = _i1.ColumnString(
      'description',
      this,
    );
    difficulty = _i1.ColumnInt(
      'difficulty',
      this,
    );
    handles = _i1.ColumnSerializable(
      'handles',
      this,
    );
    creationDate = _i1.ColumnDateTime(
      'creationDate',
      this,
      hasDefault: true,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt difficulty;

  late final _i1.ColumnSerializable handles;

  late final _i1.ColumnDateTime creationDate;

  late final _i1.ColumnInt userInfoId;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        difficulty,
        handles,
        creationDate,
        userInfoId,
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
