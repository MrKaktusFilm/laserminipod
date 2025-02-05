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
import '../endpoints/user_endpoint.dart' as _i4;
import 'package:laserminipod_server/src/generated/spraywall_route.dart' as _i5;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i6;

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
      'user': _i4.UserEndpoint()
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
              type: _i1.getType<_i5.SpraywallRoute>(),
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
              type: _i1.getType<_i5.SpraywallRoute>(),
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
        'test': _i1.MethodConnector(
          name: 'test',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i3.RouteEndpoint).test(session),
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
              (endpoints['user'] as _i4.UserEndpoint).changePassword(
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
              (endpoints['user'] as _i4.UserEndpoint).checkPassword(
            session,
            params['email'],
            params['password'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}
