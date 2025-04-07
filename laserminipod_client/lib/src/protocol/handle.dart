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

abstract class Handle implements _i1.SerializableModel {
  Handle._({
    this.id,
    required this.x,
    required this.y,
    required this.radius,
  });

  factory Handle({
    int? id,
    required int x,
    required int y,
    required int radius,
  }) = _HandleImpl;

  factory Handle.fromJson(Map<String, dynamic> jsonSerialization) {
    return Handle(
      id: jsonSerialization['id'] as int?,
      x: jsonSerialization['x'] as int,
      y: jsonSerialization['y'] as int,
      radius: jsonSerialization['radius'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int x;

  int y;

  int radius;

  /// Returns a shallow copy of this [Handle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Handle copyWith({
    int? id,
    int? x,
    int? y,
    int? radius,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'x': x,
      'y': y,
      'radius': radius,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HandleImpl extends Handle {
  _HandleImpl({
    int? id,
    required int x,
    required int y,
    required int radius,
  }) : super._(
          id: id,
          x: x,
          y: y,
          radius: radius,
        );

  /// Returns a shallow copy of this [Handle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Handle copyWith({
    Object? id = _Undefined,
    int? x,
    int? y,
    int? radius,
  }) {
    return Handle(
      id: id is int? ? id : this.id,
      x: x ?? this.x,
      y: y ?? this.y,
      radius: radius ?? this.radius,
    );
  }
}
