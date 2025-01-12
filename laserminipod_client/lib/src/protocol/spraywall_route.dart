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

abstract class SpraywallRoute implements _i1.SerializableModel {
  SpraywallRoute._({
    required this.id,
    required this.name,
    required this.handles,
  });

  factory SpraywallRoute({
    required int id,
    required String name,
    required List<int> handles,
  }) = _SpraywallRouteImpl;

  factory SpraywallRoute.fromJson(Map<String, dynamic> jsonSerialization) {
    return SpraywallRoute(
      id: jsonSerialization['id'] as int,
      name: jsonSerialization['name'] as String,
      handles:
          (jsonSerialization['handles'] as List).map((e) => e as int).toList(),
    );
  }

  String name;

  int id;

  List<int> handles;

  SpraywallRoute copyWith({
    int? id,
    String? name,
    List<int>? handles,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'handles': handles.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SpraywallRouteImpl extends SpraywallRoute {
  _SpraywallRouteImpl({
    required int id,
    required String name,
    required List<int> handles,
  }) : super._(
          id: id,
          name: name,
          handles: handles,
        );

  @override
  SpraywallRoute copyWith({
    int? id,
    String? name,
    List<int>? handles,
  }) {
    return SpraywallRoute(
      id: id ?? this.id,
      name: name ?? this.name,
      handles: handles ?? this.handles.map((e0) => e0).toList(),
    );
  }
}
