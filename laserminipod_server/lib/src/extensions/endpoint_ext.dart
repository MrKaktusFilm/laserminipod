import 'package:serverpod/serverpod.dart';

extension Validation on Endpoint {
  Future<void> _validateScope(Session session, String requiredScope) async {
    // TODO: fix
    var userInfo = await session.authenticated;
    if (userInfo == null ||
        !userInfo.scopes.map((scope) => scope.name).contains(requiredScope)) {
      throw Exception('Unauthorized: scope $requiredScope is needed');
    }
  }

  Future<void> validateUserScope(Session session) async {
    await _validateScope(session, 'user');
  }

  Future<void> validateAdminScope(Session session) async {
    await _validateScope(session, 'admin');
  }
}
