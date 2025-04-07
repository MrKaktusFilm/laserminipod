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

abstract class RouteLikes implements _i1.SerializableModel {
  RouteLikes._({
    this.id,
    required this.routeId,
    required this.userId,
  });

  factory RouteLikes({
    int? id,
    required int routeId,
    required int userId,
  }) = _RouteLikesImpl;

  factory RouteLikes.fromJson(Map<String, dynamic> jsonSerialization) {
    return RouteLikes(
      id: jsonSerialization['id'] as int?,
      routeId: jsonSerialization['routeId'] as int,
      userId: jsonSerialization['userId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int routeId;

  int userId;

  /// Returns a shallow copy of this [RouteLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RouteLikes copyWith({
    int? id,
    int? routeId,
    int? userId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'routeId': routeId,
      'userId': userId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RouteLikesImpl extends RouteLikes {
  _RouteLikesImpl({
    int? id,
    required int routeId,
    required int userId,
  }) : super._(
          id: id,
          routeId: routeId,
          userId: userId,
        );

  /// Returns a shallow copy of this [RouteLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RouteLikes copyWith({
    Object? id = _Undefined,
    int? routeId,
    int? userId,
  }) {
    return RouteLikes(
      id: id is int? ? id : this.id,
      routeId: routeId ?? this.routeId,
      userId: userId ?? this.userId,
    );
  }
}
