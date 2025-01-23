import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server.
void run(List<String> args) async {
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

  // Create a session for database access
  var session = await pod.createSession();

  try {
    await auth.EmailAuth.db.deleteWhere(
      session,
      where: (emailAuth) => emailAuth.email.equals(adminEmail),
    );
    await auth.UserInfo.db.deleteWhere(
      session,
      where: (emailAuth) => emailAuth.userIdentifier.equals('0'),
    );
    var hashedPassword = await auth.defaultGeneratePasswordHash(adminPassword);
    // Check if the admin user already exists
    // var existingUser = await auth.Users.findUserByEmail(session, adminEmail);
    var existingUser = await auth.EmailAuth.db.find(session);

    if (existingUser.isEmpty) {
      // Create a new admin user
      await auth.EmailAuth.db.insert(session, [
        auth.EmailAuth(
            email: adminEmail, id: 0, userId: 5, hash: hashedPassword)
      ]);
      var userInfo = auth.UserInfo(
          blocked: false,
          userIdentifier: '0',
          created: DateTime.now(),
          scopeNames: ['authenticated']);
      auth.UserInfo.db.insertRow(session, userInfo);
      session.log('Admin user created: $adminEmail');
    } else {
      print('Admin user already exists: $adminEmail');
    }
  } catch (e) {
    print('Error ensuring admin user exists: $e');
  } finally {
    // Close the session
    await session.close();
  }
}

// Future<void> createAdminUserIfNotExists(Session session) async {
//   // Prüfe ob bereits ein Admin-User existiert
//   final users = await auth.Users.find(
//     session,
//     where: (t) => t.userRoles.contains('admin'),
//   );

//   if (users.isEmpty) {
//     try {
//       // Nutze den EmailAuth Provider um einen neuen User zu erstellen
//       final emailAuth = auth.EmailAuth();
      
//       final result = await emailAuth.createUser(
//         email: 'admin@example.com',
//         password: 'AdminPassword123!', // Bitte in ein sicheres Passwort ändern
//         userName: 'admin',
//       );

//       if (result.success) {
//         // Hole den erstellten User
//         final user = await auth.Users.findById(session, result.userId!);
//         if (user != null) {
//           // Füge die Admin-Rolle hinzu
//           user.userRoles = ['admin'];
//           await auth.Users.update(session, user);
//           print('Admin-User wurde erfolgreich erstellt');
//         }
//       } else {
//         print('Fehler beim Erstellen des Admin-Users: ${result.message}');
//       }
//     } catch (e) {
//       print('Fehler beim Erstellen des Admin-Users: $e');
//     }
//   }
// }
