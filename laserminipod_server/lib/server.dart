import 'package:laserminipod_server/src/di.dart';
import 'package:laserminipod_server/src/helpers/user_helper.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server.
void run(List<String> args) async {
  setupDependencies();
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  await _ensureAdminUserExists(pod);

  // Start the server.
  await pod.start();
}

// Function to ensure an admin user exists.
Future<void> _ensureAdminUserExists(Serverpod pod) async {
  const adminEmail = 'test';
  const adminPassword = 'pw';

  var session = await pod.createSession();

  try {
    var hashedPassword = await auth.defaultGeneratePasswordHash(adminPassword);
    await UserHelper.createUser(session, adminEmail, hashedPassword);
  } catch (e) {
    print('Error ensuring admin user exists: $e');
  } finally {
    // Close the session
    await session.close();
  }
}
