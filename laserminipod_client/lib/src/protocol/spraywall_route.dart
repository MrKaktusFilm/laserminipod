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
import 'route_handle_state.dart' as _i2;

abstract class SpraywallRoute implements _i1.SerializableModel {
  SpraywallRoute._({
    this.id,
    required this.name,
    this.description,
    required this.difficulty,
    DateTime? creationDate,
    required this.userInfoId,
    this.routeHandleStates,
  }) : creationDate = creationDate ?? DateTime.now();

  factory SpraywallRoute({
    int? id,
    required String name,
    String? description,
    required int difficulty,
    DateTime? creationDate,
    required int userInfoId,
    List<_i2.RouteHandleState>? routeHandleStates,
  }) = _SpraywallRouteImpl;

  factory SpraywallRoute.fromJson(Map<String, dynamic> jsonSerialization) {
    return SpraywallRoute(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      difficulty: jsonSerialization['difficulty'] as int,
      creationDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['creationDate']),
      userInfoId: jsonSerialization['userInfoId'] as int,
      routeHandleStates: (jsonSerialization['routeHandleStates'] as List?)
          ?.map(
              (e) => _i2.RouteHandleState.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? description;

  int difficulty;

  DateTime creationDate;

  int userInfoId;

  List<_i2.RouteHandleState>? routeHandleStates;

  SpraywallRoute copyWith({
    int? id,
    String? name,
    String? description,
    int? difficulty,
    DateTime? creationDate,
    int? userInfoId,
    List<_i2.RouteHandleState>? routeHandleStates,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'difficulty': difficulty,
      'creationDate': creationDate.toJson(),
      'userInfoId': userInfoId,
      if (routeHandleStates != null)
        'routeHandleStates':
            routeHandleStates?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SpraywallRouteImpl extends SpraywallRoute {
  _SpraywallRouteImpl({
    int? id,
    required String name,
    String? description,
    required int difficulty,
    DateTime? creationDate,
    required int userInfoId,
    List<_i2.RouteHandleState>? routeHandleStates,
  }) : super._(
          id: id,
          name: name,
          description: description,
          difficulty: difficulty,
          creationDate: creationDate,
          userInfoId: userInfoId,
          routeHandleStates: routeHandleStates,
        );

  @override
  SpraywallRoute copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    int? difficulty,
    DateTime? creationDate,
    int? userInfoId,
    Object? routeHandleStates = _Undefined,
  }) {
    return SpraywallRoute(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      difficulty: difficulty ?? this.difficulty,
      creationDate: creationDate ?? this.creationDate,
      userInfoId: userInfoId ?? this.userInfoId,
      routeHandleStates: routeHandleStates is List<_i2.RouteHandleState>?
          ? routeHandleStates
          : this.routeHandleStates?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
