import 'package:serverpod/serverpod.dart';

extension on Endpoint {
  Future<void> _validateScope(Session session, String requiredScope) async {
    var userInfo = await session.authenticated;
    if (userInfo == null ||
        !userInfo.scopes.map((scope) => scope.name).contains(requiredScope)) {
      throw Exception('Unauthorized: scope $requiredScope is needed');
    }
  }
}
