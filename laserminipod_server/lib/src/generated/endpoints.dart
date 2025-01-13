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
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/route_endpoint_no_db.dart' as _i3;
import 'package:laserminipod_server/src/generated/spraywall_route.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'example': _i2.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'routeEndpointNoDB': _i3.RouteEndpointNoDB()
        ..initialize(
          server,
          'routeEndpointNoDB',
          null,
        ),
    };
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
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
              (endpoints['example'] as _i2.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['routeEndpointNoDB'] = _i1.EndpointConnector(
      name: 'routeEndpointNoDB',
      endpoint: endpoints['routeEndpointNoDB']!,
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
              (endpoints['routeEndpointNoDB'] as _i3.RouteEndpointNoDB)
                  .deleteRoute(
            session,
            params['id'],
          ),
        ),
        'loadRoute': _i1.MethodConnector(
          name: 'loadRoute',
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
              (endpoints['routeEndpointNoDB'] as _i3.RouteEndpointNoDB)
                  .loadRoute(
            session,
            params['id'],
          ),
        ),
        'saveRoute': _i1.MethodConnector(
          name: 'saveRoute',
          params: {
            'route': _i1.ParameterDescription(
              name: 'route',
              type: _i1.getType<_i4.SpraywallRoute>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['routeEndpointNoDB'] as _i3.RouteEndpointNoDB)
                  .saveRoute(
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
              (endpoints['routeEndpointNoDB'] as _i3.RouteEndpointNoDB)
                  .getNewId(session),
        ),
        'loadAllRoutes': _i1.MethodConnector(
          name: 'loadAllRoutes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['routeEndpointNoDB'] as _i3.RouteEndpointNoDB)
                  .loadAllRoutes(session),
        ),
        'existsRouteAlready': _i1.MethodConnector(
          name: 'existsRouteAlready',
          params: {
            'route': _i1.ParameterDescription(
              name: 'route',
              type: _i1.getType<_i4.SpraywallRoute>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['routeEndpointNoDB'] as _i3.RouteEndpointNoDB)
                  .existsRouteAlready(
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
              (endpoints['routeEndpointNoDB'] as _i3.RouteEndpointNoDB)
                  .nameAlreadyAssigned(
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
              (endpoints['routeEndpointNoDB'] as _i3.RouteEndpointNoDB)
                  .test(session),
        ),
      },
    );
  }
}
