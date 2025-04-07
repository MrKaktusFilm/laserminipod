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

abstract class CreateUserException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  CreateUserException._({required this.message});

  factory CreateUserException({required String message}) =
      _CreateUserExceptionImpl;

  factory CreateUserException.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateUserException(message: jsonSerialization['message'] as String);
  }

  String message;

  /// Returns a shallow copy of this [CreateUserException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateUserException copyWith({String? message});
  @override
  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'message': message};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CreateUserExceptionImpl extends CreateUserException {
  _CreateUserExceptionImpl({required String message})
      : super._(message: message);

  /// Returns a shallow copy of this [CreateUserException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateUserException copyWith({String? message}) {
    return CreateUserException(message: message ?? this.message);
  }
}
