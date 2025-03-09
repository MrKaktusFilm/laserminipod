/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:laserminipod_client/src/protocol/handle.dart' as _i3;
import 'package:laserminipod_client/src/protocol/spraywall_route.dart' as _i4;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointHandle extends _i1.EndpointRef {
  EndpointHandle(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'handle';

  _i2.Future<List<_i3.Handle>> loadAllHandles() =>
      caller.callServerEndpoint<List<_i3.Handle>>(
        'handle',
        'loadAllHandles',
        {},
      );

  /// returns id of created handle
  _i2.Future<int> addHandle(
    int x,
    int y,
    int radius,
  ) =>
      caller.callServerEndpoint<int>(
        'handle',
        'addHandle',
        {
          'x': x,
          'y': y,
          'radius': radius,
        },
      );

  _i2.Future<void> editHandle(
    int id,
    int x,
    int y,
    int radius,
  ) =>
      caller.callServerEndpoint<void>(
        'handle',
        'editHandle',
        {
          'id': id,
          'x': x,
          'y': y,
          'radius': radius,
        },
      );

  _i2.Future<void> removeHandle(int id) => caller.callServerEndpoint<void>(
        'handle',
        'removeHandle',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointRoute extends _i1.EndpointRef {
  EndpointRoute(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'route';

  _i2.Future<void> deleteRoute(int id) => caller.callServerEndpoint<void>(
        'route',
        'deleteRoute',
        {'id': id},
      );

  _i2.Future<bool> saveRoute(_i4.SpraywallRoute route) =>
      caller.callServerEndpoint<bool>(
        'route',
        'saveRoute',
        {'route': route},
      );

  _i2.Future<int> getNewId() => caller.callServerEndpoint<int>(
        'route',
        'getNewId',
        {},
      );

  _i2.Future<List<_i4.SpraywallRoute>> loadAllRoutes() =>
      caller.callServerEndpoint<List<_i4.SpraywallRoute>>(
        'route',
        'loadAllRoutes',
        {},
      );

  _i2.Future<bool> existsRouteAlready(Map<int, int> route) =>
      caller.callServerEndpoint<bool>(
        'route',
        'existsRouteAlready',
        {'route': route},
      );

  _i2.Future<bool> nameAlreadyAssigned(String name) =>
      caller.callServerEndpoint<bool>(
        'route',
        'nameAlreadyAssigned',
        {'name': name},
      );

  _i2.Future<Map<int, int>> getHandleStatesForRoute(int routeId) =>
      caller.callServerEndpoint<Map<int, int>>(
        'route',
        'getHandleStatesForRoute',
        {'routeId': routeId},
      );

  _i2.Future<List<int>> loadProjects(int userId) =>
      caller.callServerEndpoint<List<int>>(
        'route',
        'loadProjects',
        {'userId': userId},
      );

  _i2.Future<List<int>> loadSents(int userId) =>
      caller.callServerEndpoint<List<int>>(
        'route',
        'loadSents',
        {'userId': userId},
      );

  _i2.Future<void> addProjectForUser(
    int routeId,
    int userId,
  ) =>
      caller.callServerEndpoint<void>(
        'route',
        'addProjectForUser',
        {
          'routeId': routeId,
          'userId': userId,
        },
      );

  _i2.Future<void> deleteProjectForUser(
    int routeId,
    int userId,
  ) =>
      caller.callServerEndpoint<void>(
        'route',
        'deleteProjectForUser',
        {
          'routeId': routeId,
          'userId': userId,
        },
      );

  _i2.Future<void> addSentForUser(
    int routeId,
    int userId,
  ) =>
      caller.callServerEndpoint<void>(
        'route',
        'addSentForUser',
        {
          'routeId': routeId,
          'userId': userId,
        },
      );

  _i2.Future<void> deleteSentForUser(
    int routeId,
    int userId,
  ) =>
      caller.callServerEndpoint<void>(
        'route',
        'deleteSentForUser',
        {
          'routeId': routeId,
          'userId': userId,
        },
      );
}

/// {@category Endpoint}
class EndpointSpraywall extends _i1.EndpointRef {
  EndpointSpraywall(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'spraywall';

  _i2.Future<void> toggleHandle(
    int id,
    int state,
  ) =>
      caller.callServerEndpoint<void>(
        'spraywall',
        'toggleHandle',
        {
          'id': id,
          'state': state,
        },
      );

  _i2.Future<void> clearCurrentRoute() => caller.callServerEndpoint<void>(
        'spraywall',
        'clearCurrentRoute',
        {},
      );

  _i2.Future<void> loadRoute(Map<int, int> route) =>
      caller.callServerEndpoint<void>(
        'spraywall',
        'loadRoute',
        {'route': route},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<void> changePassword(
    String email,
    String newPassword,
  ) =>
      caller.callServerEndpoint<void>(
        'user',
        'changePassword',
        {
          'email': email,
          'newPassword': newPassword,
        },
      );

  _i2.Future<bool> checkPassword(
    String email,
    String password,
  ) =>
      caller.callServerEndpoint<bool>(
        'user',
        'checkPassword',
        {
          'email': email,
          'password': password,
        },
      );

  _i2.Future<_i5.UserInfo?> createUser(
    String email,
    String userName,
    String password,
  ) =>
      caller.callServerEndpoint<_i5.UserInfo?>(
        'user',
        'createUser',
        {
          'email': email,
          'userName': userName,
          'password': password,
        },
      );

  _i2.Future<void> deleteUser(String email) => caller.callServerEndpoint<void>(
        'user',
        'deleteUser',
        {'email': email},
      );

  _i2.Future<_i5.UserInfo?> getUserById(int id) =>
      caller.callServerEndpoint<_i5.UserInfo?>(
        'user',
        'getUserById',
        {'id': id},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    handle = EndpointHandle(this);
    route = EndpointRoute(this);
    spraywall = EndpointSpraywall(this);
    user = EndpointUser(this);
    modules = Modules(this);
  }

  late final EndpointHandle handle;

  late final EndpointRoute route;

  late final EndpointSpraywall spraywall;

  late final EndpointUser user;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'handle': handle,
        'route': route,
        'spraywall': spraywall,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
