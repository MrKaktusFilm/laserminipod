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
import 'spraywall_route.dart' as _i3;
import 'package:laserminipod_client/src/protocol/handle.dart' as _i4;
import 'package:laserminipod_client/src/protocol/spraywall_route.dart' as _i5;
export 'handle.dart';
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
    if (t == _i3.SpraywallRoute) {
      return _i3.SpraywallRoute.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Handle?>()) {
      return (data != null ? _i2.Handle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.SpraywallRoute?>()) {
      return (data != null ? _i3.SpraywallRoute.fromJson(data) : null) as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i4.Handle>) {
      return (data as List).map((e) => deserialize<_i4.Handle>(e)).toList()
          as dynamic;
    }
    if (t == List<_i5.SpraywallRoute>) {
      return (data as List)
          .map((e) => deserialize<_i5.SpraywallRoute>(e))
          .toList() as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Handle) {
      return 'Handle';
    }
    if (data is _i3.SpraywallRoute) {
      return 'SpraywallRoute';
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
    if (dataClassName == 'SpraywallRoute') {
      return deserialize<_i3.SpraywallRoute>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
