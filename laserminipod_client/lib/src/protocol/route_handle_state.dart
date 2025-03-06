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

abstract class RouteHandleState implements _i1.SerializableModel {
  RouteHandleState._({
    this.id,
    required this.routeId,
    required this.handleId,
    required this.state,
  });

  factory RouteHandleState({
    int? id,
    required int routeId,
    required int handleId,
    required int state,
  }) = _RouteHandleStateImpl;

  factory RouteHandleState.fromJson(Map<String, dynamic> jsonSerialization) {
    return RouteHandleState(
      id: jsonSerialization['id'] as int?,
      routeId: jsonSerialization['routeId'] as int,
      handleId: jsonSerialization['handleId'] as int,
      state: jsonSerialization['state'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int routeId;

  int handleId;

  int state;

  RouteHandleState copyWith({
    int? id,
    int? routeId,
    int? handleId,
    int? state,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'routeId': routeId,
      'handleId': handleId,
      'state': state,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RouteHandleStateImpl extends RouteHandleState {
  _RouteHandleStateImpl({
    int? id,
    required int routeId,
    required int handleId,
    required int state,
  }) : super._(
          id: id,
          routeId: routeId,
          handleId: handleId,
          state: state,
        );

  @override
  RouteHandleState copyWith({
    Object? id = _Undefined,
    int? routeId,
    int? handleId,
    int? state,
  }) {
    return RouteHandleState(
      id: id is int? ? id : this.id,
      routeId: routeId ?? this.routeId,
      handleId: handleId ?? this.handleId,
      state: state ?? this.state,
    );
  }
}
