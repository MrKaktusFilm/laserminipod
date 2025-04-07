import 'package:serverpod/serverpod.dart';

class HealthEndpoint extends Endpoint {
  Future<bool> isConnectionSuccessful(Session session) async {
    return true;
  }
}
