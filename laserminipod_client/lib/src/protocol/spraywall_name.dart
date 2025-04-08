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

abstract class SpraywallName implements _i1.SerializableModel {
  SpraywallName._({
    this.id,
    required this.name,
  });

  factory SpraywallName({
    int? id,
    required String name,
  }) = _SpraywallNameImpl;

  factory SpraywallName.fromJson(Map<String, dynamic> jsonSerialization) {
    return SpraywallName(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  /// Returns a shallow copy of this [SpraywallName]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SpraywallName copyWith({
    int? id,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SpraywallNameImpl extends SpraywallName {
  _SpraywallNameImpl({
    int? id,
    required String name,
  }) : super._(
          id: id,
          name: name,
        );

  /// Returns a shallow copy of this [SpraywallName]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SpraywallName copyWith({
    Object? id = _Undefined,
    String? name,
  }) {
    return SpraywallName(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
    );
  }
}
