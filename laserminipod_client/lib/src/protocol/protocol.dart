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
import 'handle.dart' as _i2;
import 'route_handle_state.dart' as _i3;
import 'spraywall_route.dart' as _i4;
import 'package:laserminipod_client/src/protocol/handle.dart' as _i5;
import 'package:laserminipod_client/src/protocol/spraywall_route.dart' as _i6;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i7;
export 'handle.dart';
export 'route_handle_state.dart';
export 'spraywall_route.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Handle) {
      return _i2.Handle.fromJson(data) as T;
    }
    if (t == _i3.RouteHandleState) {
      return _i3.RouteHandleState.fromJson(data) as T;
    }
    if (t == _i4.SpraywallRoute) {
      return _i4.SpraywallRoute.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Handle?>()) {
      return (data != null ? _i2.Handle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.RouteHandleState?>()) {
      return (data != null ? _i3.RouteHandleState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.SpraywallRoute?>()) {
      return (data != null ? _i4.SpraywallRoute.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i3.RouteHandleState>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i3.RouteHandleState>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i5.Handle>) {
      return (data as List).map((e) => deserialize<_i5.Handle>(e)).toList()
          as dynamic;
    }
    if (t == List<_i6.SpraywallRoute>) {
      return (data as List)
          .map((e) => deserialize<_i6.SpraywallRoute>(e))
          .toList() as dynamic;
    }
    if (t == Map<int, int>) {
      return Map.fromEntries((data as List).map((e) =>
              MapEntry(deserialize<int>(e['k']), deserialize<int>(e['v']))))
          as dynamic;
    }
    try {
      return _i7.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Handle) {
      return 'Handle';
    }
    if (data is _i3.RouteHandleState) {
      return 'RouteHandleState';
    }
    if (data is _i4.SpraywallRoute) {
      return 'SpraywallRoute';
    }
    className = _i7.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Handle') {
      return deserialize<_i2.Handle>(data['data']);
    }
    if (dataClassName == 'RouteHandleState') {
      return deserialize<_i3.RouteHandleState>(data['data']);
    }
    if (dataClassName == 'SpraywallRoute') {
      return deserialize<_i4.SpraywallRoute>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i7.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
