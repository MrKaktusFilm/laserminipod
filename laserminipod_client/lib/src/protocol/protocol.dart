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
import 'exceptions/create_user_exception.dart' as _i2;
import 'handle.dart' as _i3;
import 'route_handle_state.dart' as _i4;
import 'route_user_projects.dart' as _i5;
import 'route_user_sents.dart' as _i6;
import 'spraywall_route.dart' as _i7;
import 'package:laserminipod_client/src/protocol/handle.dart' as _i8;
import 'package:laserminipod_client/src/protocol/spraywall_route.dart' as _i9;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i10;
export 'exceptions/create_user_exception.dart';
export 'handle.dart';
export 'route_handle_state.dart';
export 'route_user_projects.dart';
export 'route_user_sents.dart';
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
    if (t == _i2.CreateUserException) {
      return _i2.CreateUserException.fromJson(data) as T;
    }
    if (t == _i3.Handle) {
      return _i3.Handle.fromJson(data) as T;
    }
    if (t == _i4.RouteHandleState) {
      return _i4.RouteHandleState.fromJson(data) as T;
    }
    if (t == _i5.RouteUserProjects) {
      return _i5.RouteUserProjects.fromJson(data) as T;
    }
    if (t == _i6.RouteUserSents) {
      return _i6.RouteUserSents.fromJson(data) as T;
    }
    if (t == _i7.SpraywallRoute) {
      return _i7.SpraywallRoute.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.CreateUserException?>()) {
      return (data != null ? _i2.CreateUserException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i3.Handle?>()) {
      return (data != null ? _i3.Handle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.RouteHandleState?>()) {
      return (data != null ? _i4.RouteHandleState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.RouteUserProjects?>()) {
      return (data != null ? _i5.RouteUserProjects.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.RouteUserSents?>()) {
      return (data != null ? _i6.RouteUserSents.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.SpraywallRoute?>()) {
      return (data != null ? _i7.SpraywallRoute.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i4.RouteHandleState>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i4.RouteHandleState>(e))
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
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i10.UserInfo>) {
      return (data as List).map((e) => deserialize<_i10.UserInfo>(e)).toList()
          as dynamic;
    }
    try {
      return _i10.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.CreateUserException) {
      return 'CreateUserException';
    }
    if (data is _i3.Handle) {
      return 'Handle';
    }
    if (data is _i4.RouteHandleState) {
      return 'RouteHandleState';
    }
    if (data is _i5.RouteUserProjects) {
      return 'RouteUserProjects';
    }
    if (data is _i6.RouteUserSents) {
      return 'RouteUserSents';
    }
    if (data is _i7.SpraywallRoute) {
      return 'SpraywallRoute';
    }
    className = _i10.Protocol().getClassNameForObject(data);
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
      return deserialize<_i2.CreateUserException>(data['data']);
    }
    if (dataClassName == 'Handle') {
      return deserialize<_i3.Handle>(data['data']);
    }
    if (dataClassName == 'RouteHandleState') {
      return deserialize<_i4.RouteHandleState>(data['data']);
    }
    if (dataClassName == 'RouteUserProjects') {
      return deserialize<_i5.RouteUserProjects>(data['data']);
    }
    if (dataClassName == 'RouteUserSents') {
      return deserialize<_i6.RouteUserSents>(data['data']);
    }
    if (dataClassName == 'SpraywallRoute') {
      return deserialize<_i7.SpraywallRoute>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i10.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
