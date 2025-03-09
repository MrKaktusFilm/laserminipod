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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'exceptions/create_user_exception.dart' as _i4;
import 'handle.dart' as _i5;
import 'route_handle_state.dart' as _i6;
import 'spraywall_route.dart' as _i7;
import 'package:laserminipod_server/src/generated/handle.dart' as _i8;
import 'package:laserminipod_server/src/generated/spraywall_route.dart' as _i9;
export 'exceptions/create_user_exception.dart';
export 'handle.dart';
export 'route_handle_state.dart';
export 'spraywall_route.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'handle',
      dartName: 'Handle',
      schema: 'public',
      module: 'laserminipod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'handle_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'x',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'y',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'radius',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'handle_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'route_handle_state',
      dartName: 'RouteHandleState',
      schema: 'public',
      module: 'laserminipod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'route_handle_state_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'routeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'handleId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'state',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: '_spraywallrouteRoutehandlestatesSpraywallrouteId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'route_handle_state_fk_0',
          columns: ['routeId'],
          referenceTable: 'spraywallroute',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'route_handle_state_fk_1',
          columns: ['handleId'],
          referenceTable: 'handle',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'route_handle_state_fk_2',
          columns: ['_spraywallrouteRoutehandlestatesSpraywallrouteId'],
          referenceTable: 'spraywallroute',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'route_handle_state_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'spraywallroute',
      dartName: 'SpraywallRoute',
      schema: 'public',
      module: 'laserminipod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'spraywallroute_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'difficulty',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'creationDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'spraywallroute_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'spraywallroute_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.CreateUserException) {
      return _i4.CreateUserException.fromJson(data) as T;
    }
    if (t == _i5.Handle) {
      return _i5.Handle.fromJson(data) as T;
    }
    if (t == _i6.RouteHandleState) {
      return _i6.RouteHandleState.fromJson(data) as T;
    }
    if (t == _i7.SpraywallRoute) {
      return _i7.SpraywallRoute.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.CreateUserException?>()) {
      return (data != null ? _i4.CreateUserException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.Handle?>()) {
      return (data != null ? _i5.Handle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.RouteHandleState?>()) {
      return (data != null ? _i6.RouteHandleState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.SpraywallRoute?>()) {
      return (data != null ? _i7.SpraywallRoute.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i6.RouteHandleState>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i6.RouteHandleState>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i8.Handle>) {
      return (data as List).map((e) => deserialize<_i8.Handle>(e)).toList()
          as dynamic;
    }
    if (t == List<_i9.SpraywallRoute>) {
      return (data as List)
          .map((e) => deserialize<_i9.SpraywallRoute>(e))
          .toList() as dynamic;
    }
    if (t == Map<int, int>) {
      return Map.fromEntries((data as List).map((e) =>
              MapEntry(deserialize<int>(e['k']), deserialize<int>(e['v']))))
          as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.CreateUserException) {
      return 'CreateUserException';
    }
    if (data is _i5.Handle) {
      return 'Handle';
    }
    if (data is _i6.RouteHandleState) {
      return 'RouteHandleState';
    }
    if (data is _i7.SpraywallRoute) {
      return 'SpraywallRoute';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'CreateUserException') {
      return deserialize<_i4.CreateUserException>(data['data']);
    }
    if (dataClassName == 'Handle') {
      return deserialize<_i5.Handle>(data['data']);
    }
    if (dataClassName == 'RouteHandleState') {
      return deserialize<_i6.RouteHandleState>(data['data']);
    }
    if (dataClassName == 'SpraywallRoute') {
      return deserialize<_i7.SpraywallRoute>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Handle:
        return _i5.Handle.t;
      case _i6.RouteHandleState:
        return _i6.RouteHandleState.t;
      case _i7.SpraywallRoute:
        return _i7.SpraywallRoute.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'laserminipod';
}
