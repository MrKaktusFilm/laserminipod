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
import 'route_handle_state.dart' as _i2;

abstract class SpraywallRoute
    implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  SpraywallRoute._({
    this.id,
    required this.name,
    this.description,
    required this.difficulty,
    DateTime? creationDate,
    required this.userInfoId,
    this.routeHandleStates,
  }) : creationDate = creationDate ?? DateTime.now();

  factory SpraywallRoute({
    int? id,
    required String name,
    String? description,
    required int difficulty,
    DateTime? creationDate,
    required int userInfoId,
    List<_i2.RouteHandleState>? routeHandleStates,
  }) = _SpraywallRouteImpl;

  factory SpraywallRoute.fromJson(Map<String, dynamic> jsonSerialization) {
    return SpraywallRoute(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      difficulty: jsonSerialization['difficulty'] as int,
      creationDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['creationDate']),
      userInfoId: jsonSerialization['userInfoId'] as int,
      routeHandleStates: (jsonSerialization['routeHandleStates'] as List?)
          ?.map(
              (e) => _i2.RouteHandleState.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = SpraywallRouteTable();

  static const db = SpraywallRouteRepository._();

  @override
  int? id;

  String name;

  String? description;

  int difficulty;

  DateTime creationDate;

  int userInfoId;

  List<_i2.RouteHandleState>? routeHandleStates;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [SpraywallRoute]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SpraywallRoute copyWith({
    int? id,
    String? name,
    String? description,
    int? difficulty,
    DateTime? creationDate,
    int? userInfoId,
    List<_i2.RouteHandleState>? routeHandleStates,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'difficulty': difficulty,
      'creationDate': creationDate.toJson(),
      'userInfoId': userInfoId,
      if (routeHandleStates != null)
        'routeHandleStates':
            routeHandleStates?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'difficulty': difficulty,
      'creationDate': creationDate.toJson(),
      'userInfoId': userInfoId,
      if (routeHandleStates != null)
        'routeHandleStates': routeHandleStates?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static SpraywallRouteInclude include(
      {_i2.RouteHandleStateIncludeList? routeHandleStates}) {
    return SpraywallRouteInclude._(routeHandleStates: routeHandleStates);
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
    DateTime? creationDate,
    required int userInfoId,
    List<_i2.RouteHandleState>? routeHandleStates,
  }) : super._(
          id: id,
          name: name,
          description: description,
          difficulty: difficulty,
          creationDate: creationDate,
          userInfoId: userInfoId,
          routeHandleStates: routeHandleStates,
        );

  /// Returns a shallow copy of this [SpraywallRoute]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SpraywallRoute copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    int? difficulty,
    DateTime? creationDate,
    int? userInfoId,
    Object? routeHandleStates = _Undefined,
  }) {
    return SpraywallRoute(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      difficulty: difficulty ?? this.difficulty,
      creationDate: creationDate ?? this.creationDate,
      userInfoId: userInfoId ?? this.userInfoId,
      routeHandleStates: routeHandleStates is List<_i2.RouteHandleState>?
          ? routeHandleStates
          : this.routeHandleStates?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class SpraywallRouteTable extends _i1.Table<int> {
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

  late final _i1.ColumnDateTime creationDate;

  late final _i1.ColumnInt userInfoId;

  _i2.RouteHandleStateTable? ___routeHandleStates;

  _i1.ManyRelation<_i2.RouteHandleStateTable>? _routeHandleStates;

  _i2.RouteHandleStateTable get __routeHandleStates {
    if (___routeHandleStates != null) return ___routeHandleStates!;
    ___routeHandleStates = _i1.createRelationTable(
      relationFieldName: '__routeHandleStates',
      field: SpraywallRoute.t.id,
      foreignField: _i2
          .RouteHandleState.t.$_spraywallrouteRoutehandlestatesSpraywallrouteId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.RouteHandleStateTable(tableRelation: foreignTableRelation),
    );
    return ___routeHandleStates!;
  }

  _i1.ManyRelation<_i2.RouteHandleStateTable> get routeHandleStates {
    if (_routeHandleStates != null) return _routeHandleStates!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'routeHandleStates',
      field: SpraywallRoute.t.id,
      foreignField: _i2
          .RouteHandleState.t.$_spraywallrouteRoutehandlestatesSpraywallrouteId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.RouteHandleStateTable(tableRelation: foreignTableRelation),
    );
    _routeHandleStates = _i1.ManyRelation<_i2.RouteHandleStateTable>(
      tableWithRelations: relationTable,
      table: _i2.RouteHandleStateTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _routeHandleStates!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        difficulty,
        creationDate,
        userInfoId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'routeHandleStates') {
      return __routeHandleStates;
    }
    return null;
  }
}

class SpraywallRouteInclude extends _i1.IncludeObject {
  SpraywallRouteInclude._(
      {_i2.RouteHandleStateIncludeList? routeHandleStates}) {
    _routeHandleStates = routeHandleStates;
  }

  _i2.RouteHandleStateIncludeList? _routeHandleStates;

  @override
  Map<String, _i1.Include?> get includes =>
      {'routeHandleStates': _routeHandleStates};

  @override
  _i1.Table<int> get table => SpraywallRoute.t;
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
  _i1.Table<int> get table => SpraywallRoute.t;
}

class SpraywallRouteRepository {
  const SpraywallRouteRepository._();

  final attach = const SpraywallRouteAttachRepository._();

  final attachRow = const SpraywallRouteAttachRowRepository._();

  final detach = const SpraywallRouteDetachRepository._();

  final detachRow = const SpraywallRouteDetachRowRepository._();

  /// Returns a list of [SpraywallRoute]s matching the given query parameters.
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
  Future<List<SpraywallRoute>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SpraywallRouteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SpraywallRouteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SpraywallRouteTable>? orderByList,
    _i1.Transaction? transaction,
    SpraywallRouteInclude? include,
  }) async {
    return session.db.find<SpraywallRoute>(
      where: where?.call(SpraywallRoute.t),
      orderBy: orderBy?.call(SpraywallRoute.t),
      orderByList: orderByList?.call(SpraywallRoute.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SpraywallRoute] matching the given query parameters.
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
  Future<SpraywallRoute?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SpraywallRouteTable>? where,
    int? offset,
    _i1.OrderByBuilder<SpraywallRouteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SpraywallRouteTable>? orderByList,
    _i1.Transaction? transaction,
    SpraywallRouteInclude? include,
  }) async {
    return session.db.findFirstRow<SpraywallRoute>(
      where: where?.call(SpraywallRoute.t),
      orderBy: orderBy?.call(SpraywallRoute.t),
      orderByList: orderByList?.call(SpraywallRoute.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SpraywallRoute] by its [id] or null if no such row exists.
  Future<SpraywallRoute?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SpraywallRouteInclude? include,
  }) async {
    return session.db.findById<SpraywallRoute>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SpraywallRoute]s in the list and returns the inserted rows.
  ///
  /// The returned [SpraywallRoute]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
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

  /// Inserts a single [SpraywallRoute] and returns the inserted row.
  ///
  /// The returned [SpraywallRoute] will have its `id` field set.
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

  /// Updates all [SpraywallRoute]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
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

  /// Updates a single [SpraywallRoute]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
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

  /// Deletes all [SpraywallRoute]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
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

  /// Deletes a single [SpraywallRoute].
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

  /// Deletes all rows matching the [where] expression.
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

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
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

class SpraywallRouteAttachRepository {
  const SpraywallRouteAttachRepository._();

  /// Creates a relation between this [SpraywallRoute] and the given [RouteHandleState]s
  /// by setting each [RouteHandleState]'s foreign key `_spraywallrouteRoutehandlestatesSpraywallrouteId` to refer to this [SpraywallRoute].
  Future<void> routeHandleStates(
    _i1.Session session,
    SpraywallRoute spraywallRoute,
    List<_i2.RouteHandleState> routeHandleState, {
    _i1.Transaction? transaction,
  }) async {
    if (routeHandleState.any((e) => e.id == null)) {
      throw ArgumentError.notNull('routeHandleState.id');
    }
    if (spraywallRoute.id == null) {
      throw ArgumentError.notNull('spraywallRoute.id');
    }

    var $routeHandleState = routeHandleState
        .map((e) => _i2.RouteHandleStateImplicit(
              e,
              $_spraywallrouteRoutehandlestatesSpraywallrouteId:
                  spraywallRoute.id,
            ))
        .toList();
    await session.db.update<_i2.RouteHandleState>(
      $routeHandleState,
      columns: [
        _i2.RouteHandleState.t.$_spraywallrouteRoutehandlestatesSpraywallrouteId
      ],
      transaction: transaction,
    );
  }
}

class SpraywallRouteAttachRowRepository {
  const SpraywallRouteAttachRowRepository._();

  /// Creates a relation between this [SpraywallRoute] and the given [RouteHandleState]
  /// by setting the [RouteHandleState]'s foreign key `_spraywallrouteRoutehandlestatesSpraywallrouteId` to refer to this [SpraywallRoute].
  Future<void> routeHandleStates(
    _i1.Session session,
    SpraywallRoute spraywallRoute,
    _i2.RouteHandleState routeHandleState, {
    _i1.Transaction? transaction,
  }) async {
    if (routeHandleState.id == null) {
      throw ArgumentError.notNull('routeHandleState.id');
    }
    if (spraywallRoute.id == null) {
      throw ArgumentError.notNull('spraywallRoute.id');
    }

    var $routeHandleState = _i2.RouteHandleStateImplicit(
      routeHandleState,
      $_spraywallrouteRoutehandlestatesSpraywallrouteId: spraywallRoute.id,
    );
    await session.db.updateRow<_i2.RouteHandleState>(
      $routeHandleState,
      columns: [
        _i2.RouteHandleState.t.$_spraywallrouteRoutehandlestatesSpraywallrouteId
      ],
      transaction: transaction,
    );
  }
}

class SpraywallRouteDetachRepository {
  const SpraywallRouteDetachRepository._();

  /// Detaches the relation between this [SpraywallRoute] and the given [RouteHandleState]
  /// by setting the [RouteHandleState]'s foreign key `_spraywallrouteRoutehandlestatesSpraywallrouteId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> routeHandleStates(
    _i1.Session session,
    List<_i2.RouteHandleState> routeHandleState, {
    _i1.Transaction? transaction,
  }) async {
    if (routeHandleState.any((e) => e.id == null)) {
      throw ArgumentError.notNull('routeHandleState.id');
    }

    var $routeHandleState = routeHandleState
        .map((e) => _i2.RouteHandleStateImplicit(
              e,
              $_spraywallrouteRoutehandlestatesSpraywallrouteId: null,
            ))
        .toList();
    await session.db.update<_i2.RouteHandleState>(
      $routeHandleState,
      columns: [
        _i2.RouteHandleState.t.$_spraywallrouteRoutehandlestatesSpraywallrouteId
      ],
      transaction: transaction,
    );
  }
}

class SpraywallRouteDetachRowRepository {
  const SpraywallRouteDetachRowRepository._();

  /// Detaches the relation between this [SpraywallRoute] and the given [RouteHandleState]
  /// by setting the [RouteHandleState]'s foreign key `_spraywallrouteRoutehandlestatesSpraywallrouteId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> routeHandleStates(
    _i1.Session session,
    _i2.RouteHandleState routeHandleState, {
    _i1.Transaction? transaction,
  }) async {
    if (routeHandleState.id == null) {
      throw ArgumentError.notNull('routeHandleState.id');
    }

    var $routeHandleState = _i2.RouteHandleStateImplicit(
      routeHandleState,
      $_spraywallrouteRoutehandlestatesSpraywallrouteId: null,
    );
    await session.db.updateRow<_i2.RouteHandleState>(
      $routeHandleState,
      columns: [
        _i2.RouteHandleState.t.$_spraywallrouteRoutehandlestatesSpraywallrouteId
      ],
      transaction: transaction,
    );
  }
}
