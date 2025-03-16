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
import '../endpoints/handle_endpoint.dart' as _i2;
import '../endpoints/route_endpoint.dart' as _i3;
import '../endpoints/spraywall_endpoint.dart' as _i4;
import '../endpoints/user_endpoint.dart' as _i5;
import 'package:laserminipod_server/src/generated/spraywall_route.dart' as _i6;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i7;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'handle': _i2.HandleEndpoint()
        ..initialize(
          server,
          'handle',
          null,
        ),
      'route': _i3.RouteEndpoint()
        ..initialize(
          server,
          'route',
          null,
        ),
      'spraywall': _i4.SpraywallEndpoint()
        ..initialize(
          server,
          'spraywall',
          null,
        ),
      'user': _i5.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
    connectors['handle'] = _i1.EndpointConnector(
      name: 'handle',
      endpoint: endpoints['handle']!,
      methodConnectors: {
        'loadAllHandles': _i1.MethodConnector(
          name: 'loadAllHandles',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['handle'] as _i2.HandleEndpoint)
                  .loadAllHandles(session),
        ),
        'addHandle': _i1.MethodConnector(
          name: 'addHandle',
          params: {
            'x': _i1.ParameterDescription(
              name: 'x',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'y': _i1.ParameterDescription(
              name: 'y',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'radius': _i1.ParameterDescription(
              name: 'radius',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['handle'] as _i2.HandleEndpoint).addHandle(
            session,
            params['x'],
            params['y'],
            params['radius'],
          ),
        ),
        'editHandle': _i1.MethodConnector(
          name: 'editHandle',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'x': _i1.ParameterDescription(
              name: 'x',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'y': _i1.ParameterDescription(
              name: 'y',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'radius': _i1.ParameterDescription(
              name: 'radius',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['handle'] as _i2.HandleEndpoint).editHandle(
            session,
            params['id'],
            params['x'],
            params['y'],
            params['radius'],
          ),
        ),
        'removeHandle': _i1.MethodConnector(
          name: 'removeHandle',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['handle'] as _i2.HandleEndpoint).removeHandle(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['route'] = _i1.EndpointConnector(
      name: 'route',
      endpoint: endpoints['route']!,
      methodConnectors: {
        'deleteRoute': _i1.MethodConnector(
          name: 'deleteRoute',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).deleteRoute(
            session,
            params['id'],
          ),
        ),
        'saveRoute': _i1.MethodConnector(
          name: 'saveRoute',
          params: {
            'route': _i1.ParameterDescription(
              name: 'route',
              type: _i1.getType<_i6.SpraywallRoute>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).saveRoute(
            session,
            params['route'],
          ),
        ),
        'getNewId': _i1.MethodConnector(
          name: 'getNewId',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).getNewId(session),
        ),
        'loadAllRoutes': _i1.MethodConnector(
          name: 'loadAllRoutes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).loadAllRoutes(session),
        ),
        'existsRouteAlready': _i1.MethodConnector(
          name: 'existsRouteAlready',
          params: {
            'route': _i1.ParameterDescription(
              name: 'route',
              type: _i1.getType<Map<int, int>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).existsRouteAlready(
            session,
            params['route'],
          ),
        ),
        'nameAlreadyAssigned': _i1.MethodConnector(
          name: 'nameAlreadyAssigned',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).nameAlreadyAssigned(
            session,
            params['name'],
          ),
        ),
        'getHandleStatesForRoute': _i1.MethodConnector(
          name: 'getHandleStatesForRoute',
          params: {
            'routeId': _i1.ParameterDescription(
              name: 'routeId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).getHandleStatesForRoute(
            session,
            params['routeId'],
          ),
        ),
        'loadProjects': _i1.MethodConnector(
          name: 'loadProjects',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).loadProjects(
            session,
            params['userId'],
          ),
        ),
        'loadSents': _i1.MethodConnector(
          name: 'loadSents',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).loadSents(session),
        ),
        'addProjectForUser': _i1.MethodConnector(
          name: 'addProjectForUser',
          params: {
            'routeId': _i1.ParameterDescription(
              name: 'routeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).addProjectForUser(
            session,
            params['routeId'],
            params['userId'],
          ),
        ),
        'deleteProjectForUser': _i1.MethodConnector(
          name: 'deleteProjectForUser',
          params: {
            'routeId': _i1.ParameterDescription(
              name: 'routeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).deleteProjectForUser(
            session,
            params['routeId'],
            params['userId'],
          ),
        ),
        'addSentForUser': _i1.MethodConnector(
          name: 'addSentForUser',
          params: {
            'routeId': _i1.ParameterDescription(
              name: 'routeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).addSentForUser(
            session,
            params['routeId'],
            params['userId'],
          ),
        ),
        'deleteSentForUser': _i1.MethodConnector(
          name: 'deleteSentForUser',
          params: {
            'routeId': _i1.ParameterDescription(
              name: 'routeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).deleteSentForUser(
            session,
            params['routeId'],
            params['userId'],
          ),
        ),
        'getLikesForUser': _i1.MethodConnector(
          name: 'getLikesForUser',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).getLikesForUser(
            session,
            params['userId'],
          ),
        ),
        'getAllLikes': _i1.MethodConnector(
          name: 'getAllLikes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).getAllLikes(session),
        ),
        'toggleLikeForUser': _i1.MethodConnector(
          name: 'toggleLikeForUser',
          params: {
            'routeId': _i1.ParameterDescription(
              name: 'routeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).toggleLikeForUser(
            session,
            params['routeId'],
            params['userId'],
          ),
        ),
      },
    );
    connectors['spraywall'] = _i1.EndpointConnector(
      name: 'spraywall',
      endpoint: endpoints['spraywall']!,
      methodConnectors: {
        'toggleHandle': _i1.MethodConnector(
          name: 'toggleHandle',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'state': _i1.ParameterDescription(
              name: 'state',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['spraywall'] as _i4.SpraywallEndpoint).toggleHandle(
            session,
            params['id'],
            params['state'],
          ),
        ),
        'clearCurrentRoute': _i1.MethodConnector(
          name: 'clearCurrentRoute',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['spraywall'] as _i4.SpraywallEndpoint)
                  .clearCurrentRoute(session),
        ),
        'loadRoute': _i1.MethodConnector(
          name: 'loadRoute',
          params: {
            'route': _i1.ParameterDescription(
              name: 'route',
              type: _i1.getType<Map<int, int>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['spraywall'] as _i4.SpraywallEndpoint).loadRoute(
            session,
            params['route'],
          ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'changePassword': _i1.MethodConnector(
          name: 'changePassword',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i5.UserEndpoint).changePassword(
            session,
            params['email'],
            params['newPassword'],
          ),
        ),
        'checkPassword': _i1.MethodConnector(
          name: 'checkPassword',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i5.UserEndpoint).checkPassword(
            session,
            params['email'],
            params['password'],
          ),
        ),
        'createUser': _i1.MethodConnector(
          name: 'createUser',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'userName': _i1.ParameterDescription(
              name: 'userName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i5.UserEndpoint).createUser(
            session,
            params['email'],
            params['userName'],
            params['password'],
          ),
        ),
        'deleteUser': _i1.MethodConnector(
          name: 'deleteUser',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i5.UserEndpoint).deleteUser(
            session,
            params['email'],
          ),
        ),
        'getUserById': _i1.MethodConnector(
          name: 'getUserById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i5.UserEndpoint).getUserById(
            session,
            params['id'],
          ),
        ),
        'getAllUsers': _i1.MethodConnector(
          name: 'getAllUsers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i5.UserEndpoint).getAllUsers(session),
        ),
        'setUserName': _i1.MethodConnector(
          name: 'setUserName',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newUserName': _i1.ParameterDescription(
              name: 'newUserName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i5.UserEndpoint).setUserName(
            session,
            params['userId'],
            params['newUserName'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i7.Endpoints()..initializeEndpoints(server);
  }
}
