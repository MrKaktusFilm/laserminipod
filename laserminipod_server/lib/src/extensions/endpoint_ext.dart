import 'package:serverpod/serverpod.dart';

extension Validation on Endpoint {
  Future<void> _validateScope(
      Session session, List<String> requiredScope) async {
    var userInfo = await session.authenticated;

    var hasAnyRequiredScope = false;
    for (var scope in requiredScope) {
      if (userInfo!.scopes.map((s) => s.name).contains(scope)) {
        hasAnyRequiredScope = true;
        break;
      }
    }
    if (!hasAnyRequiredScope) {
      throw Exception(
          'Unauthorized: one of these scopes is needed: ${requiredScope.join(", ")}');
    }
  }

  Future<void> validateUserScope(Session session) async {
    await _validateScope(session, ['user', 'admin']);
  }

  Future<void> validateAdminScope(Session session) async {
    await _validateScope(session, ['admin']);
  }
}
